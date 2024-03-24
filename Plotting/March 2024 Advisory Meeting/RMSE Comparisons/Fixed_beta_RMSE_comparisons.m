%% H460 LET vs. f(y) RMSE Comparison

H460_fy_anneal_difference = (H460RMSE-H460RMSE_LET)./H460RMSE_LET;
H460_fy_anneal_difference = H460_fy_anneal_difference*100;

figure('Renderer', 'painters', 'Position', [10 10 750 350])
b = bar(H460_fy_anneal_difference);

hxtitle = get(gca,'XLabel');
hytitle = get(gca,'YLabel');
htitle = get(gca,'Title');
set(gca,'TickLabelInterpreter','Latex');
set(hxtitle,'Interpreter','Latex');
set(hytitle,'Interpreter','Latex');
set(htitle,'Interpreter','Latex');
set(hytitle,'String','Cost Function Ratio f(y)/LET$_d$ [\%]');
set(gca,'YLim',[-125 125]);

set(gca,'XTickLabel', {'Linear'; 'Quadratic'; 'Cubic'; 'Fourth';'Fifth';'Q';'QE';'QE2';'LE';'LQE';'LE2';'LQE2';'Gaussian';'Skew Gaussian';'Morstin et al.'});

b.FaceColor = 'flat';
for i = 1:size(b.CData(:,1))
    if b.YData(i) > 0
        b.CData(i,:) = [.4627 0.7255 0];
    else
        b.CData(i,:) = [(230/255) (56/255) (44/255)];
    end
end
set(hytitle,'Fontsize',14); 

f = gcf;
%exportgraphics(f,'AGOFyvsLETdAnnealing_Feb142024.png','Resolution',300, 'BackgroundColor','white')

%% H1437 LET vs. f(y) RMSE Comparison

H1437_fy_anneal_difference = (H1437RMSE-H1437RMSE_LET)./H1437RMSE_LET;
H1437_fy_anneal_difference = H1437_fy_anneal_difference*100;

figure('Renderer', 'painters', 'Position', [10 10 750 350])
b = bar(H1437_fy_anneal_difference);

hxtitle = get(gca,'XLabel');
hytitle = get(gca,'YLabel');
htitle = get(gca,'Title');
set(gca,'TickLabelInterpreter','Latex');
set(hxtitle,'Interpreter','Latex');
set(hytitle,'Interpreter','Latex');
set(htitle,'Interpreter','Latex');
set(hytitle,'String','Cost Function Ratio f(y)/LET$_d$ [\%]');
set(gca,'YLim',[-125 125]);

set(gca,'XTickLabel', {'Linear'; 'Quadratic'; 'Cubic'; 'Fourth';'Fifth';'Q';'QE';'QE2';'LE';'LQE';'LE2';'LQE2';'Gaussian';'Skew Gaussian';'Morstin et al.'});

b.FaceColor = 'flat';
for i = 1:size(b.CData(:,1))
    if b.YData(i) > 0
        b.CData(i,:) = [.4627 0.7255 0];
    else
        b.CData(i,:) = [(230/255) (56/255) (44/255)];
    end
end
set(hytitle,'Fontsize',14); 

f = gcf;
%exportgraphics(f,'AGOFyvsLETdAnnealing_Feb142024.png','Resolution',300, 'BackgroundColor','white')

%% AGO LET vs. f(y) RMSE Comparison

AGO_fy_anneal_difference = (AGORMSE-AGORMSE_LET)./AGORMSE_LET;
AGO_fy_anneal_difference = AGO_fy_anneal_difference*100;

figure('Renderer', 'painters', 'Position', [10 10 750 350])
b = bar(AGO_fy_anneal_difference);

hxtitle = get(gca,'XLabel');
hytitle = get(gca,'YLabel');
htitle = get(gca,'Title');
set(gca,'TickLabelInterpreter','Latex');
set(hxtitle,'Interpreter','Latex');
set(hytitle,'Interpreter','Latex');
set(htitle,'Interpreter','Latex');
set(hytitle,'String','Cost Function Ratio f(y)/LET$_d$ [\%]');
set(gca,'YLim',[-125 125]);

set(gca,'XTickLabel', {'Linear'; 'Quadratic'; 'Cubic'; 'Fourth';'Fifth';'Q';'QE';'QE2';'LE';'LQE';'LE2';'LQE2';'Gaussian';'Skew Gaussian';'Morstin et al.'});

b.FaceColor = 'flat';
for i = 1:size(b.CData(:,1))
    if b.YData(i) > 0
        b.CData(i,:) = [.4627 0.7255 0];
    else
        b.CData(i,:) = [(230/255) (56/255) (44/255)];
    end
end
set(hytitle,'Fontsize',14); 

f = gcf;
%exportgraphics(f,'AGOFyvsLETdAnnealing_Feb142024.png','Resolution',300, 'BackgroundColor','white')

%% U87 LET vs. f(y) RMSE Comparison

U87_fy_anneal_difference = (U87RMSE-U87RMSE_LET)./U87RMSE_LET;
U87_fy_anneal_difference = U87_fy_anneal_difference*100;

figure('Renderer', 'painters', 'Position', [10 10 750 350])
b = bar(U87_fy_anneal_difference);

hxtitle = get(gca,'XLabel');
hytitle = get(gca,'YLabel');
htitle = get(gca,'Title');
set(gca,'TickLabelInterpreter','Latex');
set(hxtitle,'Interpreter','Latex');
set(hytitle,'Interpreter','Latex');
set(htitle,'Interpreter','Latex');
set(hytitle,'String','Cost Function Ratio f(y)/LET$_d$ [\%]');
set(gca,'YLim',[-125 125]);

set(gca,'XTickLabel', {'Linear'; 'Quadratic'; 'Cubic'; 'Fourth';'Fifth';'Q';'QE';'QE2';'LE';'LQE';'LE2';'LQE2';'Gaussian';'Skew Gaussian';'Morstin et al.'});

b.FaceColor = 'flat';
for i = 1:size(b.CData(:,1))
    if b.YData(i) > 0
        b.CData(i,:) = [.4627 0.7255 0];
    else
        b.CData(i,:) = [(230/255) (56/255) (44/255)];
    end
end
set(hytitle,'Fontsize',14); 

f = gcf;
%exportgraphics(f,'AGOFyvsLETdAnnealing_Feb142024.png','Resolution',300, 'BackgroundColor','white')