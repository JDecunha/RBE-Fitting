%% LET vs. f(y) for H460
H460_LET_Anneal_Cost = [4.837073344, 0.894480504, 0.622155759, 0.617689132, 0.616452608, 1.935096312, 0.93931998,1.904922701,2.181517544,0.618728614,4.687137684,0.896217015,0.908642179,0.617308591,0.906528745];
H460_Fy_Anneal_Cost = [4.993870712,1.009334306,0.672504141,0.672601168,0.644931189,1.896280701,1.087490991,0.921482813,2.610480283,0.661456813,2.084037992,0.905676562,1.03746808,0.747325365,1.061410637];

%Calc improvement
H460_Fy_anneal_difference = H460_Fy_Anneal_Cost./H460_LET_Anneal_Cost;
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
%title("H460 f(y) vs LET$_d$ Based models")

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
exportgraphics(f,'H460FyvsLETdAnnealing.png','Resolution',300, 'BackgroundColor','white')

%% LET vs. f(y) for H1437
H1437_fy_cost = [2.375919538,1.09545178,0.808042145,0.804608018,0.804608018,1.232880476,1.231434231,1.233185791,1.415134509,1.095452235,2.185871725,0.974991129,1.105149522,1.105149522,1.117208594];
H1437_LET_cost = [2.499477982,1.091269682,0.777781769,0.777771871,0.764500795,1.309487502,1.309850613,1.309516273,2.472274738,1.091265514,2.49326739,1.091733214,1.100513233,1.101469255,1.097577852];

%Calc improvement
H460_Fy_anneal_difference = H1437_fy_cost./H1437_LET_cost;
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
%title("H460 f(y) vs LET$_d$ Based models")

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
exportgraphics(f,'H1437FyvsLETdAnnealing.png','Resolution',300, 'BackgroundColor','white')

%% LET vs. f(y) for AGO
AGO_pristine_fy_cost = [0.166388216,0.110147536,0.10639408,0.108851615,0.108851615,0.276573485,0.167030026,0.276572845,0.107004312,0.105004655,0.121755583,0.108621161,0.105745525,0.10574624,0.260954712];
AGO_pristine_LETd_cost = [0.187104788,0.142021218,0.101025656,0.096670976,0.09695884,0.308598715,0.098039976,0.308598715,0.136398601,0.098020047,0.115089448,0.09649126,0.143212648,0.143218159,0.142911035];

%Calc improvement
H460_Fy_anneal_difference = AGO_pristine_fy_cost./AGO_pristine_LETd_cost;
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
exportgraphics(f,'AGOFyvsLETdAnnealing.png','Resolution',300, 'BackgroundColor','white')

%% LET vs. f(y) for U87

U87_pristine_fy_cost = [0.464282331,0.447735592,0.36851846,0.36851846,0.36851846,0.699414053,0.471255182,0.69941399,0.443792044,0.447734002,0.451079206,0.374657029,0.442787942,0.485610934,0.497475537];
U87_pristine_LETd_cost = [0.375080078,0.369403981,0.369274242,0.366701928,0.362591404,0.6558306,0.36960515,0.657090078,0.369356934,0.369461618,0.372118265,0.409088853,0.369273975,0.369274582,0.370861837];

%Calc improvement
H460_Fy_anneal_difference = U87_pristine_fy_cost./U87_pristine_LETd_cost;
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
exportgraphics(f,'U87FyvsLETdAnnealing.png','Resolution',300, 'BackgroundColor','white')