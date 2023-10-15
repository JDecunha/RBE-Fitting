function [output] = Generic_BWF_RBE_RunScript(name, kernelName, penaltyKernelName, filePaths, InitialGuess, alphaRef, betaRef, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps)

%% Setup environment
addpath(genpath("."));

kernel = parallel.gpu.CUDAKernel(kernelName+".ptx", kernelName+".cu");
kernel.ThreadBlockSize = 1024;
penaltyKernel = parallel.gpu.CUDAKernel(penaltyKernelName+".ptx", penaltyKernelName+".cu");
penaltyKernel.ThreadBlockSize = 1024;

%% Import the H460 data
%A 3d array to hold the experiments data
experiments = [];

%Loop through the files and concatenate
for i = 1:size(filePaths,2)
    experiments = cat(3,experiments, readmatrix(filePaths(i)));
end

GPUExperimentalData = ExperimentData(experiments);

%% Call the driver
output = RBE_Alpha_Fitting_Driver(GPUExperimentalData, alphaRef, betaRef, kernel, penaltyKernel, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps);

input = [name, alphaRef, betaRef, filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist];

output = {output, input};

end

