%% Import cost
% H460
H460_combined_fy_cost = [4.993870712
1.009334306,
0.672485474,
0.651099238,
0.64343701,
1.8962807,
0.663094518,
0.921482813,
0.768129235,
1.009334322,
2.084037992,
0.905676507,
1.636931454,
1.090643376,
0.806539699
];

H460_combined_LETd_cost = [4.837073344,
0.894480466,
0.62210814,
0.617564431,
0.615905408,
1.935096312,
0.939319989,
0.636889702,
0.690057751,
0.894481284,
0.63419549,
0.894480468,
1.123770997,
1.141894814,
0.643310728,
];

% H1437
H1437_combined_fy_cost = [2.375919538,
1.095451664,
0.807944593,
0.792738887,
0.771751744,
1.232880417,
1.231434231,
1.233185791,
0.973939527,
1.095452235,
2.185871724,
0.974991128,
1.152615627,
0.94079381,
0.914618259
];

H1437_combined_LETd_cost = [2.499477982,
1.091265551,
0.777777897,
0.765817766,
0.764472633,
1.309487489,
1.309487747,
1.30948793,
2.472274738,
0.767990972,
2.49326739,
1.09126551,
0.878982327,
0.878978391,
0.775230065
];

% U87
U87_combined_fy_cost = [1.386624667,
1.352185338,
1.34894959,
1.347940629,
1.334599833,
1.663848385,
1.350101862,
1.663848501,
1.351495557,
1.350080635,
1.383064843,
1.342795267,
1.360813078,
1.357189039,
1.359104427
];

U87_combined_LETd_cost = [1.408467555,
1.399294529,
1.389799205,
1.318314759,
1.318318529,
2.204598727,
1.402960682,
2.204600151,
1.408467555,
1.39370076,
1.408467576,
1.399333448,
1.387358238,
1.392593372,
1.400661506
];


% AGO
AGO_combined_fy_cost = [2.579440632,
2.561399439,
2.419038945,
2.386248114,
1.971202573,
3.251389559,
3.250990565,
3.251389559,
2.579440457,
2.562154817,
2.539305735,
2.526368654,
3.922913748,
2.573936436,
2.563283878
];

AGO_combined_LETd_cost = [2.915509918,
2.610024387,
2.609234988,
2.442914779,
2.42917595,
4.359656618,
2.910051972,
4.359656618,
2.915515917,
2.609960586,
2.677678462, %Why is this ONE lower cost than in the results table?
2.610023878,
2.619584858,
2.625886934,
2.620527639,
];

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

%% LET vs. f(y) for AGO Combined (What's happening with LE2 AGO-LET? Why is it lower cost than recorded elsewhere?)

% figure('Renderer', 'painters', 'Position', [10 10 750 350])
% b = bar(H1437AIC);
% 
% %set(gca, 'YScale', 'log');
% %set(gca,'YLim',[1e0 5e3]);
% 
% hxtitle = get(gca,'XLabel');
% hytitle = get(gca,'YLabel');
% htitle = get(gca,'Title');
% set(gca,'TickLabelInterpreter','Latex');
% set(hxtitle,'Interpreter','Latex');
% set(hytitle,'Interpreter','Latex');
% set(htitle,'Interpreter','Latex');
% set(hytitle,'String','$\Delta$ AIC');
% lim = get(gca,'YLim')
% set(gca,'YLim',[lim(1) lim(2)*1.2]);
% 
% %set(gca,'YTick',[0 250 500 750]);
% %set(gca,'YTickLabel',[1 10 100 1000]);
% set(gca,'XTickLabel', {'Linear'; 'Quadratic'; 'Cubic'; 'Fourth';'Fifth';'Q';'QE';'QE2';'LE';'LQE';'LE2';'LQE2';'Gaussian';'Skew Gaussian';'Morstin et al.'});
% 
% b.FaceColor = 'flat';
% b.CData(1,:) = [.4627 0.7255 0];
% b.CData(2,:) = [.4627 0.7255 0];
% b.CData(3,:) = [.4627 0.7255 0];
% b.CData(4,:) = [.4627 0.7255 0];
% b.CData(5,:) = [.4627 0.7255 0];
% b.CData(6,:) = [.4627 0.7255 0];
% b.CData(7,:) = [.4627 0.7255 0];
% b.CData(8,:) = [.4627 0.7255 0];
% b.CData(9,:) = [.4627 0.7255 0];
% b.CData(10,:) = [.4627 0.7255 0];
% b.CData(11,:) = [.4627 0.7255 0];
% b.CData(12,:) = [.4627 0.7255 0];
% b.CData(13,:) = [.4627 0.7255 0];
% b.CData(14,:) = [.4627 0.7255 0];
% b.CData(15,:) = [.4627 0.7255 0];
% set(hytitle,'Fontsize',14); 
% 
% f = gcf;
% exportgraphics(f,'H1437_fy_AIC.png','Resolution',300, 'BackgroundColor','white')