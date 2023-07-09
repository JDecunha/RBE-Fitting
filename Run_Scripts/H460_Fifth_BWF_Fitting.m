function [output] = H460_Fifth_BWF_Fitting()
%% Setup environment
addpath(genpath("."));

%% Setup fitting parameters
%Took this guess from the converged fourth, with a penalty weight of 50
InitialGuess = [0.312835304762923,-8.24323377088100e-05,-0.00692446738746977,0.000224297550572219,-1.10367658638440e-06, 1e-8, 0.105969822311258];
penaltyWeight = 50.;

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
CudaKernel = parallel.gpu.CUDAKernel("FifthBWF.ptx", "FifthBWF.cu");
CudaKernel.ThreadBlockSize = 1024;
CudaPenalty = parallel.gpu.CUDAKernel("FifthBWFPenaltyFunction.ptx", "FifthBWFPenaltyFunction.cu");
CudaPenalty.ThreadBlockSize = 1024;

%% Call the driver
output = RBE_Fitting_Driver(GPUExperimentalData, CudaKernel, CudaPenalty, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles);


end

