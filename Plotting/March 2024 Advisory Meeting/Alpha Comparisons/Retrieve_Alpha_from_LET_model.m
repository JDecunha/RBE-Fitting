function [LETDs, Alphas, beta] = Retrieve_Alpha_from_LET_model(alphaKernel, modelParameters, filePaths)

kernel = parallel.gpu.CUDAKernel(alphaKernel+".ptx", alphaKernel+".cu");
kernel.ThreadBlockSize = 1024;

%% Import the survival data
%A 3d array to hold the experiments data
CPUexperiments = [];

%Loop through the files and concatenate
for i = 1:size(filePaths,2)
    CPUexperiments = cat(3,CPUexperiments, readmatrix(filePaths(i)));
end

experiments = ExperimentData(CPUexperiments);
gpuBufferArray = gpuArray(zeros(size(experiments.BinCenter,1)-1,1));

LETDs = zeros(size(filePaths));
Alphas = zeros(size(filePaths));
beta = modelParameters(end);

%Loop through each d(y) spectrum
for i = 1:size(experiments.SF,3)
    gpuBufferArray = feval(kernel,1,experiments.LETD(1,1,i),1,1, modelParameters(1:end-1), gpuBufferArray);
    Alphas(i) = gather(sum(gpuBufferArray));
    LETDs(i) = experiments.LETD(1,1,i);

end

 
end

