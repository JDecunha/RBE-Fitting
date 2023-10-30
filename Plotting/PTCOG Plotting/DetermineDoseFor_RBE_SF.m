function [LETDs, RBESF] = DetermineDoseFor_RBE_SF(alphaKernel, modelParameters, filePaths, survivingFraction)

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

Cost = 0;

LETDs = zeros(size(filePaths));
RBESF = zeros(size(filePaths));

%Loop through each d(y) spectrum
for i = 1:size(experiments.SF,3)
    gpuBufferArray = feval(kernel,experiments.BinWidth(:,1,i),experiments.BinCenter(:,1,i),experiments.BinValue(:,1,i),size(experiments.BinValue(:,1,i),1), modelParameters(1:end-1), gpuBufferArray);
    alphaPredicted = gather(sum(gpuBufferArray));
    betaPredicted = modelParameters(end); %last param of x is beta

    LETDs(i) = experiments.LETD(1,1,i);
    RBESF(i)= (alphaPredicted - sqrt((alphaPredicted*alphaPredicted)-4*-betaPredicted*-log(survivingFraction)))/(2*-betaPredicted);

end

 
end

