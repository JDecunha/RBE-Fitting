function [output] = RunScript_LET_GradDescent(name, kernelName, filePaths, InitialGuess)

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
output = RBE_LETFixedBeta_GradientDriver(GPUExperimentalData, kernel, InitialGuess);

input = [name, filePaths, InitialGuess];

output = {output, input};

end

