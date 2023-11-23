function [Cost] = DetermineModelCost(alphaKernel, modelParameters, filePaths)

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

%Loop through each d(y) spectrum
for i = 1:size(experiments.SF,3)

    gpuBufferArray = feval(kernel,experiments.BinWidth(:,1,i),experiments.BinCenter(:,1,i),experiments.BinValue(:,1,i),size(experiments.BinValue(:,1,i),1), modelParameters(1:end-1), gpuBufferArray);
    alphaPredicted = gather(sum(gpuBufferArray));
    betaPredicted = modelParameters(end); %last param of x is beta

    %Loop through each dose and surviving fraction
    for j = 1:experiments.sizeDose(1,1,i)

        dose = experiments.Dose(j,1,i);
        survivingFraction = experiments.SF(j,1,i);

        %Calculate surviving fraction
        sfPredicted = (alphaPredicted*dose)+(betaPredicted*dose*dose);
        sfPredicted = -sfPredicted;

        %Update the Cost running tally
        sfDifference = sfPredicted - log(survivingFraction);
        sfSquared = sfDifference*sfDifference;
        Cost = Cost + sfSquared; %It's squared to match definition of least squares

    end

end

%To fit the definition of least squares, the cost has an additional 1/2
%term
Cost = Cost/2;


end

