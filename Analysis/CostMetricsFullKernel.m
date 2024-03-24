function [output] = CostMetricsFullKernel(x, GPUExperimentalData, negativePenaltyValue, cudaKernel, cudaPenalty, nExperimentsOverride)

%Allocate the buffers on the GPU (the cost function needs these)
gpuBufferArray = gpuArray(zeros(size(GPUExperimentalData.BinCenter,1)-1,1));
gpuBufferArray2 = gpuArray(zeros(size(GPUExperimentalData.BinCenter,1)-1,1));

Cost = 0;
nExperiments = 0.;

%Loop through each d(y) spectrum
for i = 1:size(GPUExperimentalData.SF,3)

    gpuBufferArray = feval(cudaKernel,GPUExperimentalData.BinWidth(:,1,i),GPUExperimentalData.BinCenter(:,1,i),GPUExperimentalData.BinValue(:,1,i),size(GPUExperimentalData.BinValue(:,1,i),1), x(1:end-1), gpuBufferArray);
    alphaPredicted = gather(sum(gpuBufferArray));
    betaPredicted = x(end); %last param of x is beta

    %Loop through each dose and surviving fraction
    for j = 1:GPUExperimentalData.sizeDose(1,1,i)

        dose = GPUExperimentalData.Dose(j,1,i);
        survivingFraction = GPUExperimentalData.SF(j,1,i);

        %Calculate surviving fraction
        sfPredicted = (alphaPredicted*dose)+(betaPredicted*dose*dose);
        sfPredicted = -sfPredicted;

        %Update the Cost running tally
        sfDifference = sfPredicted - log(survivingFraction);
        sfSquared = sfDifference*sfDifference;
        Cost = Cost + sfSquared; %It's squared to match definition of least squares
        nExperiments = nExperiments + 1;

    end

end

CostNoPenalty = Cost;
RMSE = CostNoPenalty/nExperiments;
RMSE = sqrt(RMSE);

%Apply the negative function penalty
[gpuBufferArray, gpuBufferArray2] = feval(cudaPenalty, GPUExperimentalData.BinWidth(:,1,1),GPUExperimentalData.BinCenter(:,1,1),GPUExperimentalData.maxRelevantBin, x(1:end-1), gpuBufferArray, gpuBufferArray2);
negativeArea = gather(sum(gpuBufferArray(1:GPUExperimentalData.maxRelevantBin)));
totalArea = gather(sum(gpuBufferArray2(1:GPUExperimentalData.maxRelevantBin)));
NegativeFraction = negativeArea/totalArea;
NegativeCost = negativePenaltyValue*NegativeFraction;
Cost = Cost + NegativeCost;

%To fit the definition of least squares, the cost has an additional 1/2
%term
Cost = Cost/2;
CostNoPenalty = CostNoPenalty/2;
NegativeCost = NegativeCost/2;
AIC = (nExperiments*log(RMSE*RMSE))+(2*size(x,2));

%If overriding the number of experiments (for weighted fitting) recalculate
%RMSE and AIC
if isempty(nExperimentsOverride) == false
    RMSE = CostNoPenalty/nExperimentsOverride;
    RMSE = sqrt(RMSE);
    AIC = (nExperiments*log(RMSE*RMSE))+(2*size(x,2));
end

output = [Cost, CostNoPenalty, RMSE, AIC, NegativeFraction, NegativeCost];

end
