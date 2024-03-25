function [Cost] = DirectAlpha_SingleBeta_CostFunction(x, experiments)

Cost = 0;

%Loop through each d(y) spectrum
for i = 1:size(experiments.SF,3)

    alphaPredicted = x(i);
    betaPredicted = x(-1);

    %Loop through each dose and surviving fraction
    for j = 1:experiments.sizeDose(1,1,i)

        dose = experiments.Dose(j,1,i);
        survivingFraction = experiments.SF(j,1,i);

        %Calculate surviving fraction
        sfPredicted = (alphaPredicted*dose)+(betaPredicted*dose*dose);
        sfPredicted = -sfPredicted;

        %Update the Cost running tally
        sfDifference = sfPredicted - log(survivingFraction);
        %sfDifference = exp(sfPredicted) - survivingFraction;
        sfSquared = sfDifference*sfDifference;
        Cost = Cost + sfSquared; %It's squared to match definition of least squares

    end

end

%To fit the definition of least squares, the cost has an additional 1/2
%term
Cost = Cost/2;

end

