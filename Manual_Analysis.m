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
emptyGPUArray = gpuArray(zeros(3000,1));
emptyGPUArray2 = gpuArray(zeros(3000,1));

%% Set up the kernels
mexcuda -ptx GPU_Fitting/Kernels/CubicBWF.cu GPU_Fitting/Kernels/CubicBWFPenaltyFunction.cu
CubicKernel = parallel.gpu.CUDAKernel("CubicBWF.ptx", "CubicBWF.cu");
CubicKernel.ThreadBlockSize = 1024;
CubicPenalty = parallel.gpu.CUDAKernel("CubicBWFPenaltyFunction.ptx", "CubicBWFPenaltyFunction.cu");
CubicPenalty.ThreadBlockSize = 1024;

%% Evaluate negative fraction for Cubic fitting

%[0.102919429734727,0.125933513311555,-0.019283222333918,2.988322768805547e-04,0.110340625405717]
%0.829809178714362
CubicSolution1 = [0.102919429734727,0.125933513311555,-0.019283222333918,2.988322768805547e-04,0.110340625405717];
frac1 = BWFNegativityFraction(CubicKernel, CubicSolution1, GPUExperimentalData.BinWidth(:,1,1), GPUExperimentalData.BinCenter(:,1,1), GPUExperimentalData.maxRelevantBin);

CubicSolution2 = [0.0786855407569327,0.135672140373969,-0.0201356304923653,0.000309404109628883,0.111993684813713];
frac2 = BWFNegativityFraction(CubicKernel, CubicSolution2, GPUExperimentalData.BinWidth(:,1,1), GPUExperimentalData.BinCenter(:,1,1), GPUExperimentalData.maxRelevantBin);

cost1 = CostMetrics(CubicSolution1, GPUExperimentalData, 10., CubicKernel, emptyGPUArray, CubicPenalty, emptyGPUArray2);