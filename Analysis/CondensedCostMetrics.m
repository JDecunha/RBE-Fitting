function [AIC, RMSE] = CondensedCostMetrics(cost, numExperiments, numFittingParams)

RMSE = cost/numExperiments;
RMSE = sqrt(RMSE);
AIC = (numExperiments*log(RMSE*RMSE))+(2*numFittingParams);

end
