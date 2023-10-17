function [output] = RunScript_LETFixedBeta(name, kernelName, filePaths, InitialGuess, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps)

%% Setup environment
addpath(genpath("."));

kernel = parallel.gpu.CUDAKernel(kernelName+".ptx", kernelName+".cu");
kernel.ThreadBlockSize = 1024;

%% Import the survival data
%A 3d array to hold the experiments data
experiments = [];

%Loop through the files and concatenate
for i = 1:size(filePaths,2)
    experiments = cat(3,experiments, readmatrix(filePaths(i)));
end

GPUExperimentalData = ExperimentData(experiments);

%% Call the driver
output = RBE_LETFixedBeta_Driver(GPUExperimentalData, kernel, InitialGuess, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps);

input = [name, filePaths, InitialGuess];

output = {output, input};

end

