function [output] = LETCostMetricsFullKernel(x, experiments,  cudaKernel, nExperimentsOverride)

gpuBufferArray = gpuArray(zeros(size(experiments.BinCenter,1)-1,1));
Cost = 0;
nExperiments = 0.;
AIC = 0.;

%Loop through each d(y) spectrum
for i = 1:size(experiments.SF,3)

    gpuBufferArray = feval(cudaKernel,1,experiments.LETD(1,1,i),1,1, x(1:end-1), gpuBufferArray);
    alphaPredicted = gather(sum(gpuBufferArray));
    betaPredicted = x(end); %last param of x is beta

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
        nExperiments = nExperiments + 1;

    end

end

CostNoPenalty = Cost;
RMSE = CostNoPenalty/nExperiments;
RMSE = sqrt(RMSE);

%To fit the definition of least squares, the cost has an additional 1/2
%term
Cost = Cost/2;
AIC = (nExperiments*log(RMSE*RMSE))+(2*size(x,2));

%If overriding the number of experiments (for weighted fitting) recalculate
%RMSE and AIC
if isempty(nExperimentsOverride) == false
    RMSE = CostNoPenalty/nExperimentsOverride;
    RMSE = sqrt(RMSE);
    AIC = (nExperiments*log(RMSE*RMSE))+(2*size(x,2));
end

output = [Cost, CostNoPenalty, RMSE, AIC];

end
