%% LET, Grad Descent vs. Simul Anneal for H460
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
title("H460 f(y) vs LET$_d$ Based models")

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

%% LET, Grad Descent vs. Simul Anneal for H460
H460_Dy_Anneal_Cost = [4.490686956,1.588643646,0.766013861,0.666272943,0.666217059,2.720681454,1.769560482,1.514759593,1.588641906,2.754110372,2.321134319,1.445402952,2.024315523,2.025448543,1.677023214];

H460_Fy_Anneal_Cost = [4.993870712,1.009334306,0.672504141,0.672601168,0.644931189,1.896280701,1.087490991,0.921482813,2.610480283,0.661456813,2.084037992,0.905676562,1.03746808,0.747325365,1.061410637];

%Calc improvement
H460_Dy_anneal_difference = H460_Fy_Anneal_Cost./H460_Dy_Anneal_Cost;
%H460_Dy_anneal_difference = H460_Dy_anneal_difference./H460_Fy_Anneal_Cost;
H460_Dy_anneal_difference = H460_Dy_anneal_difference*100;

%Filter for ones larger than 1000% and for which have no improvement
%H460_Dy_anneal_difference = H460_Dy_anneal_difference.*(H460_Dy_anneal_difference>0);
%idx = H460_Dy_anneal_difference>1000;
%H460_Dy_anneal_difference(idx) = 1000;

figure('Renderer', 'painters', 'Position', [10 10 750 350])
b = bar(H460_Dy_anneal_difference);

%set(gca, 'YScale', 'log');
%set(gca,'YLim',[1e0 5e3]);

hxtitle = get(gca,'XLabel');
hytitle = get(gca,'YLabel');
htitle = get(gca,'Title');
set(gca,'TickLabelInterpreter','Latex');
set(hxtitle,'Interpreter','Latex');
set(hytitle,'Interpreter','Latex');
set(htitle,'Interpreter','Latex');
set(hytitle,'String','Cost Function Ratio f(y)/d(y) [\%]');
title("H460 f(y) vs d(y) Based models")

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
exportgraphics(f,'H460FyvsDyAnnealing.png','Resolution',300, 'BackgroundColor','white')