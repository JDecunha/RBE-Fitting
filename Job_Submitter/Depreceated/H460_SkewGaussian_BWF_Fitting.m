function [output] = H460_SkewGaussian_BWF_Fitting()
%% Setup environment
addpath(genpath("."));

%% Setup fitting parameters
InitialGuess = [-112.670883644831,112.794554890182,12.3686993584413,122.264113352119,0.1,0.105813443933774]; %Skew Gaussian, 5 params + beta
%Is it 4? 0 is offset, 1 is magnitude, 2 is x_0, 3 is omega, 4 is alpha, whatever that is. checks out.
penaltyWeight = 0.;

iterationsPerCyc = 2000000;
numCycles = 500;
toleranceCycles = 50;

%% Import the H460 data

%A list of the files
filePaths = ["a.csv", "b.csv" , "c.csv", "d.csv", "e.csv", "f.csv", "g.csv", "h.csv", "i.csv", "j.csv" , "k.csv" , "l.csv"];

%A 3d array to hold the experiments data
experiments = [];

%Loop through the files and concatenate
for i = 1:size(filePaths,2)
    experiments = cat(3,experiments, readmatrix(filePaths(i)));
end

GPUExperimentalData = ExperimentData(experiments);

%% Set up the kernels
CudaKernel = parallel.gpu.CUDAKernel("SkewGaussianBWF.ptx", "SkewGaussianBWF.cu");
CudaKernel.ThreadBlockSize = 1024;
CudaPenalty = parallel.gpu.CUDAKernel("SkewGaussianPenaltyFunction.ptx", "SkewGaussianPenaltyFunction.cu");
CudaPenalty.ThreadBlockSize = 1024;

%% Call the driver
output = RBE_Fitting_Driver(GPUExperimentalData, CudaKernel, CudaPenalty, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles);


end

