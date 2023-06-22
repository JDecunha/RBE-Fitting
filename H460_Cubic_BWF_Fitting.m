function [output] = H460_Cubic_BWF_Fitting()
%% Setup fitting parameters
InitialGuess = [0.102919429734727, 0.125933513311555, -0.019283222333918, 2.988322768805547e-04, 0.110340625405717];
penaltyWeight = 10.;

iterationsPerCyc = 1000;
numCycles = 2;
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
CubicKernel = parallel.gpu.CUDAKernel("CubicBWFKernel.ptx", "CubicBWFKernel.cu");
CubicKernel.ThreadBlockSize = 1024;
CubicPenalty = parallel.gpu.CUDAKernel("CubicBWFPenaltyFunction.ptx", "CubicBWFPenaltyFunction.cu");
CubicPenalty.ThreadBlockSize = 1024;

%% Call the driver
output = RBE_Fitting_Driver(GPUExperimentalData, CubicKernel, CubicPenalty, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles);


end

