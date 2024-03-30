%% Run Cost_List.m before running this

%% Calculate cost function metrics
FittingParamNumbersOrdered = [2,3,4,5,6,3,4,4,4,5,4,5,4,5,5]; %I should verify these one more time because they're essential to the analysis
FittingParamNumbersOrdered = FittingParamNumbersOrdered + 1; %I forgot about beta
%How many experiments for each experiment?
H460NumExperiments = 83;
H1437NumExperiments = 105;
U87NumExperiments = 60;
AGONumExperiments = 66;

% Below is for f(y)

% H460 Cost params
H460AIC = []; H460RMSE = [];

for i = 1:length(H460_combined_fy_cost)
    [H460AIC(i), H460RMSE(i)] = CondensedCostMetrics(H460_combined_fy_cost(i),H460NumExperiments,FittingParamNumbersOrdered(i));
end
H460AIC = max(H460AIC)-H460AIC;

% H1437 Cost params
H1437AIC = []; H1437RMSE = [];

for i = 1:length(H1437_combined_fy_cost)
    [H1437AIC(i), H1437RMSE(i)] = CondensedCostMetrics(H1437_combined_fy_cost(i),H1437NumExperiments,FittingParamNumbersOrdered(i));
end
H1437AIC = max(H1437AIC)-H1437AIC;

% U87 Cost params
U87AIC = []; U87RMSE = [];

for i = 1:length(U87_combined_fy_cost)
    [U87AIC(i), U87RMSE(i)] = CondensedCostMetrics(U87_combined_fy_cost(i),U87NumExperiments,FittingParamNumbersOrdered(i));
end
U87AIC = max(U87AIC)-U87AIC;

% AGO Cost params
AGOAIC = []; AGORMSE = [];

for i = 1:length(AGO_combined_fy_cost)
    [AGOAIC(i), AGORMSE(i)] = CondensedCostMetrics(AGO_combined_fy_cost(i),AGONumExperiments,FittingParamNumbersOrdered(i));
end
AGOAIC = max(AGOAIC)-AGOAIC;

%% Calculate cost function metrics (for LET)
FittingParamNumbersOrdered = [2,3,4,5,6,3,4,4,4,5,4,5,4,5,5]; %I should verify these one more time because they're essential to the analysis
FittingParamNumbersOrdered = FittingParamNumbersOrdered + 1; %I forgot about beta
%How many experiments for each experiment?
H460NumExperiments = 83;
H1437NumExperiments = 105;
U87NumExperiments = 60;
AGONumExperiments = 66;

% Below is for f(y)

% H460 Cost params
H460AIC_LET = []; H460RMSE_LET = [];

for i = 1:length(H460_combined_LETd_cost)
    [H460AIC_LET(i), H460RMSE_LET(i)] = CondensedCostMetrics(H460_combined_LETd_cost(i),H460NumExperiments,FittingParamNumbersOrdered(i));
end
H460AIC_LET = max(H460AIC_LET)-H460AIC_LET;

% H1437 Cost params
H1437AIC_LET = []; H1437RMSE_LET = [];

for i = 1:length(H1437_combined_LETd_cost)
    [H1437AIC_LET(i), H1437RMSE_LET(i)] = CondensedCostMetrics(H1437_combined_LETd_cost(i),H1437NumExperiments,FittingParamNumbersOrdered(i));
end
H1437AIC_LET = max(H1437AIC_LET)-H1437AIC_LET;

% U87 Cost params
U87AIC_LET = []; U87RMSE_LET = [];

for i = 1:length(U87_combined_LETd_cost)
    [U87AIC_LET(i), U87RMSE_LET(i)] = CondensedCostMetrics(U87_combined_LETd_cost(i),U87NumExperiments,FittingParamNumbersOrdered(i));
end
U87AIC_LET = max(U87AIC_LET)-U87AIC_LET;

% AGO Cost params
AGOAIC_LET = []; AGORMSE_LET = [];

for i = 1:length(AGO_combined_LETd_cost)
    [AGOAIC_LET(i), AGORMSE_LET(i)] = CondensedCostMetrics(AGO_combined_LETd_cost(i),AGONumExperiments,FittingParamNumbersOrdered(i));
end
AGOAIC_LET = max(AGOAIC_LET)-AGOAIC_LET;