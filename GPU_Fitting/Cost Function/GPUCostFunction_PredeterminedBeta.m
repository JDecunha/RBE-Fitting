function [Cost] = GPUCostFunction_PredeterminedBeta(x, experiments, nAlphaParams, negativePenaltyValue, cudaKernel, gpuBufferArray, cudaPenalty, gpuBufferArray2)

Cost = 0;

%Loop through each d(y) spectrum
for i = 1:size(experiments.SF,3)

    gpuBufferArray = feval(cudaKernel,experiments.BinWidth(:,1,i),experiments.BinCenter(:,1,i),experiments.BinValue(:,1,i),size(experiments.BinValue(:,1,i),1), x(1:end-1), gpuBufferArray);
    alphaPredicted = gather(sum(gpuBufferArray));
    betaPredicted = x(nAlphaParams+i); %last param of x is beta

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

%Apply the negative function penalty
[gpuBufferArray, gpuBufferArray2] = feval(cudaPenalty, experiments.BinWidth(:,1,1),experiments.BinCenter(:,1,1),experiments.maxRelevantBin, x(1:end-1), gpuBufferArray, gpuBufferArray2);
negativeArea = gather(sum(gpuBufferArray(1:experiments.maxRelevantBin)));
totalArea = gather(sum(gpuBufferArray2(1:experiments.maxRelevantBin)));
Cost = Cost + (negativePenaltyValue*(negativeArea/totalArea)); 

%To fit the definition of least squares, the cost has an additional 1/2
%term
Cost = Cost/2;

end

