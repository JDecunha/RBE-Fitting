%% H460
H460_Fy_Anneal_Cost = [4.993870712,1.009334306,0.672504141,0.672601168,0.644931189,1.896280701,1.087490991,0.921482813,2.610480283,0.661456813,2.084037992,0.905676562,1.03746808,0.747325365,1.061410637];

%Filter for ones larger than 1000% and for which have no improvement
%H460_Dy_anneal_difference = H460_Dy_anneal_difference.*(H460_Dy_anneal_difference>0);
%idx = H460_Dy_anneal_difference>1000;
%H460_Dy_anneal_difference(idx) = 1000;

figure('Renderer', 'painters', 'Position', [10 10 750 350])
b = bar(H460_Fy_Anneal_Cost);

%set(gca, 'YScale', 'log');
%set(gca,'YLim',[1e0 5e3]);

hxtitle = get(gca,'XLabel');
hytitle = get(gca,'YLabel');
htitle = get(gca,'Title');
set(gca,'TickLabelInterpreter','Latex');
set(hxtitle,'Interpreter','Latex');
set(hytitle,'Interpreter','Latex');
set(htitle,'Interpreter','Latex');
set(hytitle,'String','Cost Function [Arb]');
%title("")

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

%yl = yline(100,'--');
%yl.Color = [(243/255) (58/255) (15/255)];
%yl.LineWidth = 1;
%yl.Alpha = 1;

f = gcf;
exportgraphics(f,'H460FyCost.png','Resolution',300, 'BackgroundColor','white')

%% H1437

H1437_fy_cost = [2.375919538,1.09545178,0.808042145,0.804608018,5.04608018,1.232880476,1.231434231,1.233185791,1.415134509,1.095452235,2.185871725,0.974991129,1.105149522,2.475375692,1.117208594];

%Filter for ones larger than 1000% and for which have no improvement
%H460_Dy_anneal_difference = H460_Dy_anneal_difference.*(H460_Dy_anneal_difference>0);
%idx = H460_Dy_anneal_difference>1000;
%H460_Dy_anneal_difference(idx) = 1000;

figure('Renderer', 'painters', 'Position', [10 10 750 350])
b = bar(H1437_fy_cost);

%set(gca, 'YScale', 'log');
%set(gca,'YLim',[1e0 5e3]);

hxtitle = get(gca,'XLabel');
hytitle = get(gca,'YLabel');
htitle = get(gca,'Title');
set(gca,'TickLabelInterpreter','Latex');
set(hxtitle,'Interpreter','Latex');
set(hytitle,'Interpreter','Latex');
set(htitle,'Interpreter','Latex');
set(hytitle,'String','Cost Function [Arb]');
%title("")

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

%yl = yline(100,'--');
%yl.Color = [(243/255) (58/255) (15/255)];
%yl.LineWidth = 1;
%yl.Alpha = 1;

f = gcf;
%exportgraphics(f,'H1437FyCost.png','Resolution',300, 'BackgroundColor','white')

%% AGO Pristine

AGO_pristine_fy_cost = [0.166388216,0.110147536,0.10639408,0.108851615,0.108851615,0.276573485,0.167030026,0.276572845,0.107004312,0.105004655,0.121755583,0.108621161,0.105745525,0.10574624,0.260954712];


%Filter for ones larger than 1000% and for which have no improvement
%H460_Dy_anneal_difference = H460_Dy_anneal_difference.*(H460_Dy_anneal_difference>0);
%idx = H460_Dy_anneal_difference>1000;
%H460_Dy_anneal_difference(idx) = 1000;

figure('Renderer', 'painters', 'Position', [10 10 750 350])
b = bar(AGO_pristine_fy_cost);

%set(gca, 'YScale', 'log');
%set(gca,'YLim',[1e0 5e3]);

hxtitle = get(gca,'XLabel');
hytitle = get(gca,'YLabel');
htitle = get(gca,'Title');
set(gca,'TickLabelInterpreter','Latex');
set(hxtitle,'Interpreter','Latex');
set(hytitle,'Interpreter','Latex');
set(htitle,'Interpreter','Latex');
set(hytitle,'String','Cost Function [Arb]');
%title("")

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

%yl = yline(100,'--');
%yl.Color = [(243/255) (58/255) (15/255)];
%yl.LineWidth = 1;
%yl.Alpha = 1;

f = gcf;
exportgraphics(f,'AGOPristineFyCost.png','Resolution',300, 'BackgroundColor','white')

%% U87 Pristine

U87_pristine_fy_cost = [0.464282331,0.447735592,0.36851846,0.36851846,0.36851846,0.699414053,0.471255182,0.69941399,0.443792044,0.447734002,0.451079206,0.374657029,0.442787942,0.485610934,0.497475537];



%Filter for ones larger than 1000% and for which have no improvement
%H460_Dy_anneal_difference = H460_Dy_anneal_difference.*(H460_Dy_anneal_difference>0);
%idx = H460_Dy_anneal_difference>1000;
%H460_Dy_anneal_difference(idx) = 1000;

figure('Renderer', 'painters', 'Position', [10 10 750 350])
b = bar(U87_pristine_fy_cost);

%set(gca, 'YScale', 'log');
%set(gca,'YLim',[1e0 5e3]);

hxtitle = get(gca,'XLabel');
hytitle = get(gca,'YLabel');
htitle = get(gca,'Title');
set(gca,'TickLabelInterpreter','Latex');
set(hxtitle,'Interpreter','Latex');
set(hytitle,'Interpreter','Latex');
set(htitle,'Interpreter','Latex');
set(hytitle,'String','Cost Function [Arb]');
%title("")

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

%yl = yline(100,'--');
%yl.Color = [(243/255) (58/255) (15/255)];
%yl.LineWidth = 1;
%yl.Alpha = 1;

f = gcf;
exportgraphics(f,'U87PristineFyCost.png','Resolution',300, 'BackgroundColor','white')
