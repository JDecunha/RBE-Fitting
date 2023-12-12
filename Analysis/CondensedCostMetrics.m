function [AIC, RMSE] = CondensedCostMetrics(cost, numExperiments, numFittingParams)

RMSE = cost/numExperiments;
RMSE = sqrt(RMSE);
AIC = (nExperiments*log(RMSE*RMSE))+(2*numFittingParams);

end
