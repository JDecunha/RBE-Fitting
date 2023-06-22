function [Cost] = CostFunction(x, BWF, experiments, negativePenaltyValue)
%COSTFUNCTION
%Alright, I think I need three input arguments
%Those being
% 1.) The fitting parameters themselves  x1 .... xn
% 2.) The symbolic defined function that those parameters go into
% 3.) The experimental data

% 1.) X is going to be a two column set of fitting parameters

Cost = 0;

%Loop through each d(y) spectrum
for i = 1:size(experiments,3)

    %Each d(y) spectrum has multiple dose measurements. Find out how many
    %there are
    numExps = nnz(~isnan(experiments(:,4,i)));

    alphaPredicted = 0;
    betaPredicted = x(end); %last param of x is beta

    %Loop through the d(y) spectrum and compute alpha
    for k = 1:(size(experiments(:,1,i),1)-1)

        %Pull the relevant values from the d(y) spectrum
        binWidth = experiments(k+1,1,i)-experiments(k,1,i);
        binCenter = (1/2)*(experiments(k+1,1,i)+experiments(k,1,i));
        binValue = experiments(k,2,i);
        
        %Pass the fitting parameters and current lineal energy to the
        %BWF
        BWFValue = BWF(x(1:end-1), binCenter); %pass all params of X to BWF, except the last one which is beta

        %Keep integrating to get the predicted alpha
        alphaPredicted = alphaPredicted + (binWidth*binValue*BWFValue);

    end

    %Loop through each dose and surviving fraction
    for j = 1:numExps
        dose = experiments(j,4,i);
        survivingFraction = experiments(j,5,i);
        
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
Cost = Cost + BWFNegativePenalty(x, BWF, experiments(:,:,1), negativePenaltyValue, 120);

%To fit the definition of least squares, the cost has an additional 1/2
%term
Cost = Cost/2;

end

