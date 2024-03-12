%% LET vs. f(y) for AGO Combined (What's happening with LE2 AGO-LET? Why is it lower cost than recorded elsewhere?)
H460_combined_fy_cost = [2.579440632,
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

%Calc improvement
H460_Fy_anneal_difference = H460_combined_fy_cost./AGO_combined_LETd_cost;
%H460_Dy_anneal_difference = H460_Dy_anneal_difference./H460_Fy_Anneal_Cost;
H460_Fy_anneal_difference = H460_Fy_anneal_difference*100;

%Filter for ones larger than 1000% and for which have no improvement
%H460_Dy_anneal_difference = H460_Dy_anneal_difference.*(H460_Dy_anneal_difference>0);
%idx = H460_Dy_anneal_difference>1000;
%H460_Dy_anneal_difference(idx) = 1000;

figure('Renderer', 'painters', 'Position', [10 10 750 350])
b = bar(H460_Fy_anneal_difference);

%set(gca, 'YScale', 'log');
%set(gca,'YLim',[1e0 5e3]);

hxtitle = get(gca,'XLabel');
hytitle = get(gca,'YLabel');
htitle = get(gca,'Title');
set(gca,'TickLabelInterpreter','Latex');
set(hxtitle,'Interpreter','Latex');
set(hytitle,'Interpreter','Latex');
set(htitle,'Interpreter','Latex');
set(hytitle,'String','Cost Function Ratio f(y)/LET$_d$ [\%]');
set(gca,'YLim',[0 200]);

%set(gca,'YTick',[0 250 500 750]);
%set(gca,'YTickLabel',[1 10 100 1000]);
set(gca,'XTickLabel', {'Linear'; 'Quadratic'; 'Cubic'; 'Fourth';'Fifth';'Q';'QE';'QE2';'LE';'LQE';'LE2';'LQE2';'Gaussian';'Skew Gaussian';'Morstin et al.'});

b.FaceColor = 'flat';
b.CData(1,:) = [.4627 0.7255 0];
b.CData(2,:) = [.4627 0.7255 0];
b.CData(3,:) = [.4627 0.7255 0];
b.CData(4,:) = [.4627 0.7255 0];
b.CData(5,:) = [.4627 0.7255 0];
b.CData(6,:) = [.4627 0.7255 0];
b.CData(7,:) = [.4627 0.7255 0];
b.CData(8,:) = [.4627 0.7255 0];
b.CData(9,:) = [.4627 0.7255 0];
b.CData(10,:) = [.4627 0.7255 0];
b.CData(11,:) = [.4627 0.7255 0];
b.CData(12,:) = [.4627 0.7255 0];
b.CData(13,:) = [.4627 0.7255 0];
b.CData(14,:) = [.4627 0.7255 0];
b.CData(15,:) = [.4627 0.7255 0];
set(hytitle,'Fontsize',14); 

yl = yline(100,'--');
yl.Color = [(243/255) (58/255) (15/255)];
yl.LineWidth = 1;
yl.Alpha = 1;

f = gcf;
exportgraphics(f,'AGOFyvsLETdAnnealing_Feb142024.png','Resolution',300, 'BackgroundColor','white')

%% LET vs. f(y) for U87 Combined
H460_combined_fy_cost = [1.386624667,
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
H460_combined_LETd_cost = [1.408467555,
1.399294529,
1.389799205,
1.318314759,
1.320978673, %Ugh, Fifth is higher cost than fourth. Will need are-run.
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

%Calc improvement
H460_Fy_anneal_difference = H460_combined_fy_cost./H460_combined_LETd_cost;
%H460_Dy_anneal_difference = H460_Dy_anneal_difference./H460_Fy_Anneal_Cost;
H460_Fy_anneal_difference = H460_Fy_anneal_difference*100;

%Filter for ones larger than 1000% and for which have no improvement
%H460_Dy_anneal_difference = H460_Dy_anneal_difference.*(H460_Dy_anneal_difference>0);
%idx = H460_Dy_anneal_difference>1000;
%H460_Dy_anneal_difference(idx) = 1000;

figure('Renderer', 'painters', 'Position', [10 10 750 350])
b = bar(H460_Fy_anneal_difference);

%set(gca, 'YScale', 'log');
%set(gca,'YLim',[1e0 5e3]);

hxtitle = get(gca,'XLabel');
hytitle = get(gca,'YLabel');
htitle = get(gca,'Title');
set(gca,'TickLabelInterpreter','Latex');
set(hxtitle,'Interpreter','Latex');
set(hytitle,'Interpreter','Latex');
set(htitle,'Interpreter','Latex');
set(hytitle,'String','Cost Function Ratio f(y)/LET$_d$ [\%]');

%set(gca,'YTick',[0 250 500 750]);
%set(gca,'YTickLabel',[1 10 100 1000]);
set(gca,'XTickLabel', {'Linear'; 'Quadratic'; 'Cubic'; 'Fourth';'Fifth';'Q';'QE';'QE2';'LE';'LQE';'LE2';'LQE2';'Gaussian';'Skew Gaussian';'Morstin et al.'});

b.FaceColor = 'flat';
b.CData(1,:) = [.4627 0.7255 0];
b.CData(2,:) = [.4627 0.7255 0];
b.CData(3,:) = [.4627 0.7255 0];
b.CData(4,:) = [.4627 0.7255 0];
b.CData(5,:) = [.4627 0.7255 0];
b.CData(6,:) = [.4627 0.7255 0];
b.CData(7,:) = [.4627 0.7255 0];
b.CData(8,:) = [.4627 0.7255 0];
b.CData(9,:) = [.4627 0.7255 0];
b.CData(10,:) = [.4627 0.7255 0];
b.CData(11,:) = [.4627 0.7255 0];
b.CData(12,:) = [.4627 0.7255 0];
b.CData(13,:) = [.4627 0.7255 0];
b.CData(14,:) = [.4627 0.7255 0];
b.CData(15,:) = [.4627 0.7255 0];
set(hytitle,'Fontsize',14); 

yl = yline(100,'--');
yl.Color = [(243/255) (58/255) (15/255)];
yl.LineWidth = 1;
yl.Alpha = 1;

f = gcf;
exportgraphics(f,'U87FyvsLETdAnnealing_Feb142024.png','Resolution',300, 'BackgroundColor','white')

%% LET vs. f(y) for H460 Combined (Good final results)
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

%Calc improvement
H460_Fy_anneal_difference = H460_combined_fy_cost./H460_combined_LETd_cost;
%H460_Dy_anneal_difference = H460_Dy_anneal_difference./H460_Fy_Anneal_Cost;
H460_Fy_anneal_difference = H460_Fy_anneal_difference*100;

%Filter for ones larger than 1000% and for which have no improvement
%H460_Dy_anneal_difference = H460_Dy_anneal_difference.*(H460_Dy_anneal_difference>0);
%idx = H460_Dy_anneal_difference>1000;
%H460_Dy_anneal_difference(idx) = 1000;

figure('Renderer', 'painters', 'Position', [10 10 750 350])
b = bar(H460_Fy_anneal_difference);

%set(gca, 'YScale', 'log');
%set(gca,'YLim',[1e0 5e3]);

hxtitle = get(gca,'XLabel');
hytitle = get(gca,'YLabel');
htitle = get(gca,'Title');
set(gca,'TickLabelInterpreter','Latex');
set(hxtitle,'Interpreter','Latex');
set(hytitle,'Interpreter','Latex');
set(htitle,'Interpreter','Latex');
set(hytitle,'String','Cost Function Ratio f(y)/LET$_d$ [\%]');

%set(gca,'YTick',[0 250 500 750]);
%set(gca,'YTickLabel',[1 10 100 1000]);
set(gca,'XTickLabel', {'Linear'; 'Quadratic'; 'Cubic'; 'Fourth';'Fifth';'Q';'QE';'QE2';'LE';'LQE';'LE2';'LQE2';'Gaussian';'Skew Gaussian';'Morstin et al.'});

b.FaceColor = 'flat';
b.CData(1,:) = [.4627 0.7255 0];
b.CData(2,:) = [.4627 0.7255 0];
b.CData(3,:) = [.4627 0.7255 0];
b.CData(4,:) = [.4627 0.7255 0];
b.CData(5,:) = [.4627 0.7255 0];
b.CData(6,:) = [.4627 0.7255 0];
b.CData(7,:) = [.4627 0.7255 0];
b.CData(8,:) = [.4627 0.7255 0];
b.CData(9,:) = [.4627 0.7255 0];
b.CData(10,:) = [.4627 0.7255 0];
b.CData(11,:) = [.4627 0.7255 0];
b.CData(12,:) = [.4627 0.7255 0];
b.CData(13,:) = [.4627 0.7255 0];
b.CData(14,:) = [.4627 0.7255 0];
b.CData(15,:) = [.4627 0.7255 0];
set(hytitle,'Fontsize',14); 

yl = yline(100,'--');
yl.Color = [(243/255) (58/255) (15/255)];
yl.LineWidth = 1;
yl.Alpha = 1;

f = gcf;
exportgraphics(f,'H460FyvsLETdAnnealing_Feb142024.png','Resolution',300, 'BackgroundColor','white')

%% LET vs. f(y) for H1437 Combined (Good final results)
H460_combined_fy_cost = [2.375919538,
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
H460_combined_LETd_cost = [2.499477982,
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

%Calc improvement
H460_Fy_anneal_difference = H460_combined_fy_cost./H460_combined_LETd_cost;
%H460_Dy_anneal_difference = H460_Dy_anneal_difference./H460_Fy_Anneal_Cost;
H460_Fy_anneal_difference = H460_Fy_anneal_difference*100;

%Filter for ones larger than 1000% and for which have no improvement
%H460_Dy_anneal_difference = H460_Dy_anneal_difference.*(H460_Dy_anneal_difference>0);
%idx = H460_Dy_anneal_difference>1000;
%H460_Dy_anneal_difference(idx) = 1000;

figure('Renderer', 'painters', 'Position', [10 10 750 350])
b = bar(H460_Fy_anneal_difference);

%set(gca, 'YScale', 'log');
%set(gca,'YLim',[1e0 5e3]);

hxtitle = get(gca,'XLabel');
hytitle = get(gca,'YLabel');
htitle = get(gca,'Title');
set(gca,'TickLabelInterpreter','Latex');
set(hxtitle,'Interpreter','Latex');
set(hytitle,'Interpreter','Latex');
set(htitle,'Interpreter','Latex');
set(hytitle,'String','Cost Function Ratio f(y)/LET$_d$ [\%]');

%set(gca,'YTick',[0 250 500 750]);
%set(gca,'YTickLabel',[1 10 100 1000]);
set(gca,'XTickLabel', {'Linear'; 'Quadratic'; 'Cubic'; 'Fourth';'Fifth';'Q';'QE';'QE2';'LE';'LQE';'LE2';'LQE2';'Gaussian';'Skew Gaussian';'Morstin et al.'});

b.FaceColor = 'flat';
b.CData(1,:) = [.4627 0.7255 0];
b.CData(2,:) = [.4627 0.7255 0];
b.CData(3,:) = [.4627 0.7255 0];
b.CData(4,:) = [.4627 0.7255 0];
b.CData(5,:) = [.4627 0.7255 0];
b.CData(6,:) = [.4627 0.7255 0];
b.CData(7,:) = [.4627 0.7255 0];
b.CData(8,:) = [.4627 0.7255 0];
b.CData(9,:) = [.4627 0.7255 0];
b.CData(10,:) = [.4627 0.7255 0];
b.CData(11,:) = [.4627 0.7255 0];
b.CData(12,:) = [.4627 0.7255 0];
b.CData(13,:) = [.4627 0.7255 0];
b.CData(14,:) = [.4627 0.7255 0];
b.CData(15,:) = [.4627 0.7255 0];
set(hytitle,'Fontsize',14); 

yl = yline(100,'--');
yl.Color = [(243/255) (58/255) (15/255)];
yl.LineWidth = 1;
yl.Alpha = 1;

f = gcf;
exportgraphics(f,'H1437FyvsLETdAnnealing_Feb142024.png','Resolution',300, 'BackgroundColor','white')