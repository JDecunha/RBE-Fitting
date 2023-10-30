function [output] = Generic_BWF_PredeterminedBeta_RunScript(name, kernelName, nAlphaParams, penaltyKernelName, filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps)

%% Setup environment
addpath(genpath("."));

kernel = parallel.gpu.CUDAKernel(kernelName+".ptx", kernelName+".cu");
kernel.ThreadBlockSize = 1024;
penaltyKernel = parallel.gpu.CUDAKernel(penaltyKernelName+".ptx", penaltyKernelName+".cu");
penaltyKernel.ThreadBlockSize = 1024;

%% Import the survival data
%A 3d array to hold the experiments data
experiments = [];

%Loop through the files and concatenate
for i = 1:size(filePaths,2)
    experiments = cat(3,experiments, readmatrix(filePaths(i)));
end

GPUExperimentalData = ExperimentData(experiments);

%% Call the driver
output = RBE_Fitting_PredeterminedBeta_Driver(GPUExperimentalData, kernel, nAlphaParams, penaltyKernel, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps);

input = [name, filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps];

output = {output, input};

end

