function [output] = Generic_GradDescentBWF_RunScript(name, kernelName, penaltyKernelName, filePaths, InitialGuess, penaltyWeight)

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
output = RBE_GradDescentFitting_Driver(GPUExperimentalData, kernel, penaltyKernel, InitialGuess, penaltyWeight);

input = [name, filePaths, InitialGuess, penaltyWeight];

output = {output, input};

end

