function [output] = RunScript_Direct_Alpha_SingleBeta(name, filePaths)

%% Setup environment
addpath(genpath("."));
%% Import the survival data
%A 3d array to hold the experiments data
experiments = [];

%Loop through the files and concatenate
for i = 1:size(filePaths,2)
    experiments = cat(3,experiments, readmatrix(filePaths(i)));
end

GPUExperimentalData = ExperimentData(experiments);

%% Call the driver
InitialGuess = zeros(size(GPUExperimentalData.SF,3)+1,1)+0.1;

output = Direct_Alpha_SingleBeta_Fitting_Driver(GPUExperimentalData, InitialGuess);

input = [name, filePaths];

output = {output, input};

end

