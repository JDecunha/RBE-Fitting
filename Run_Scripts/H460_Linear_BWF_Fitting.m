function [output] = H460_Linear_BWF_Fitting()
%% Setup environment
addpath(genpath("."));

%% Setup fitting parameters
InitialGuess = [1. 1.];
penaltyWeight = 50.;

iterationsPerCyc = 5;
numCycles = 1;
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
CudaKernel = parallel.gpu.CUDAKernel("LinearBWF.ptx", "LinearBWF.cu");
CudaKernel.ThreadBlockSize = 1024;
CudaPenalty = parallel.gpu.CUDAKernel("LinearPenaltyFunction.ptx", "LinearPenaltyFunction.cu");
CudaPenalty.ThreadBlockSize = 1024;

%% Call the driver
output = RBE_Fitting_Driver(GPUExperimentalData, CudaKernel, CudaPenalty, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles);


end

