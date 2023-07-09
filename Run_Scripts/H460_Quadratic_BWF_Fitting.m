function [output] = H460_Quadratic_BWF_Fitting()
%% Setup environment
addpath(genpath("."));

%% Setup fitting parameters
InitialGuess = [0.444121132516278,-0.0875134108437409,0.00349956427196082,0.104449304420321];
penaltyWeight = 0.;

iterationsPerCyc = 50000; %50000
numCycles = 500; %500
toleranceCycles = 25;

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
CudaKernel = parallel.gpu.CUDAKernel("QuadraticBWF.ptx", "QuadraticBWF.cu");
CudaKernel.ThreadBlockSize = 1024;
CudaPenalty = parallel.gpu.CUDAKernel("QuadraticBWFPenaltyFunction.ptx", "QuadraticBWFPenaltyFunction.cu");
CudaPenalty.ThreadBlockSize = 1024;

%% Call the driver
output = RBE_Fitting_Driver(GPUExperimentalData, CudaKernel, CudaPenalty, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles);


end

