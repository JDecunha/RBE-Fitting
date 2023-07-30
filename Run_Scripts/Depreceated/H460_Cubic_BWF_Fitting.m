function [output] = H460_Cubic_BWF_Fitting()
%% Setup environment
addpath(genpath("."));

%% Setup fitting parameters

%0.7660 without penalty [0.0439315671727350,0.156643097443946,-0.0222482844092451,0.000336580271765968,0.112404925136653]
InitialGuess = [0.0439315671727350,0.156643097443946,-0.0222482844092451,0.000336580271765968,0.112404925136653];
penaltyWeight = 0.;

iterationsPerCyc = 2000000;
numCycles = 100;
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
CubicKernel = parallel.gpu.CUDAKernel("CubicBWF.ptx", "CubicBWF.cu");
CubicKernel.ThreadBlockSize = 1024;
CubicPenalty = parallel.gpu.CUDAKernel("CubicBWFPenaltyFunction.ptx", "CubicBWFPenaltyFunction.cu");
CubicPenalty.ThreadBlockSize = 1024;

%% Call the driver
output = RBE_Fitting_Driver(GPUExperimentalData, CubicKernel, CubicPenalty, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles);


end

