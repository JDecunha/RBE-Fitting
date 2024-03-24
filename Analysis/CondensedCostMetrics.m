function [AIC, RMSE] = CondensedCostMetrics(cost, numExperiments, numFittingParams)

%TODO: Need to verify all of this later. But I believe cost is doubled
%since I previously divided it by half to meet the definition of least
%squares
RMSE = (cost*2)/numExperiments;
RMSE = sqrt(RMSE);
AIC = (numExperiments*log(RMSE*RMSE))+(2*numFittingParams);

end
