function [Cost] = LETFixedBetaCostFunction(x, experiments, cudaKernel, gpuBufferArray)

Cost = 0;

%Loop through each d(y) spectrum
for i = 1:size(experiments.SF,3)

    gpuBufferArray = feval(cudaKernel,1,experiments.LETD(1,1,i),1,1, x(1:end-1), gpuBufferArray);
    alphaPredicted = gather(gpuBufferArray);
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

    end

end

%There is no negative function penalty for the LETd models.

%To fit the definition of least squares, the cost has an additional 1/2
%term
Cost = Cost/2;

end

