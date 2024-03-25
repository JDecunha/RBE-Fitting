%% H460 RMSE Bar Chart of Best Models

% Gather several arrays:    
% 1.) Names of models -- Names
% 2.) RMSE of those models -- H460RMSE_smushed
% 3.) AIC of those models -- H460AIC_smushed = [H460AIC, H460AIC_LET];
% 4.) Whether they are f(y) or LET based
Names = {'Linear'; 'Quadratic'; 'Cubic'; 'Fourth';'Fifth';'Q';'QE';'QE2';'LE';'LQE';'LE2';'LQE2';'Gaussian';'Skew Gaussian';'Morstin et al.'}; Names = transpose([Names; Names]);
H460RMSE_smushed = [H460RMSE, H460RMSE_LET];
H460AIC_smushed = [H460AIC, H460AIC_LET];
identifier = zeros(size(H460AIC_smushed));
identifier(16:end) = 1;


% Sort by RMSE
[H460RMSE_smushed, sortIndex] = sort(H460RMSE_smushed,'ascend');
Names = Names(sortIndex);
identifier = identifier(sortIndex);

% Plot
figure('Renderer', 'painters', 'Position', [10 10 750 350])
%See this forum post for why I'm using 'diag'
%It's a silly and messy way to make N bar charts
%Rather than just one bar chart
%And that way I can assign a legend entry for the Nth elements that I want
%to
%https://www.mathworks.com/matlabcentral/answers/871108-legend-in-bar-plot
b = bar(diag(H460RMSE_smushed(1:10),0),'stacked');
hxtitle = get(gca,'XLabel');
hytitle = get(gca,'YLabel');
htitle = get(gca,'Title');
set(gca,'TickLabelInterpreter','Latex');
set(hxtitle,'Interpreter','Latex');
set(hytitle,'Interpreter','Latex');
set(htitle,'Interpreter','Latex');
set(hytitle,'String','RMSE');
set(hytitle,'Fontsize',14); 
set(gca,'XTickLabel', Names(1:10));
%set(gca,'YLim',[-100 100]);

%b.FaceColor = 'flat';
blue1 = [0.18 0.451 0.8];
blue2 = [0.369 0.616 0.929];

orange1 = [0.91 0.369 0.192];
orange2 = [0.929 0.322 0.09];
for i = 1:10
    if identifier(i) > 0
        b(i).FaceColor = blue1;
    else
        b(i).FaceColor = orange2;
    end
end

leg = legend([b(10) b(1)], {'f(y)', 'LET'});
leg.Position = [0.8304 0.8882 0.0978 0.1042];
leg.Interpreter = 'Latex';
leg.FontSize = 11;

f = gcf;
exportgraphics(f,'H460_best_RMSE.png','Resolution',300, 'BackgroundColor','white');

%% H1437 RMSE Bar Chart of Best Models

% Gather several arrays:
% 1.) Names of models -- Names
% 2.) RMSE of those models -- H1437RMSE_smushed
% 3.) AIC of those models -- H1437AIC_smushed = [H1437AIC, H1437AIC_LET];
% 4.) Whether they are f(y) or LET based
Names = {'Linear'; 'Quadratic'; 'Cubic'; 'Fourth';'Fifth';'Q';'QE';'QE2';'LE';'LQE';'LE2';'LQE2';'Gaussian';'Skew Gaussian';'Morstin et al.'}; Names = transpose([Names; Names]);
H1437RMSE_smushed = [H1437RMSE, H1437RMSE_LET];
H1437AIC_smushed = [H1437AIC, H1437AIC_LET];
identifier = zeros(size(H1437AIC_smushed));
identifier(16:end) = 1;


% Sort by RMSE
[H1437RMSE_smushed, sortIndex] = sort(H1437RMSE_smushed,'ascend');
Names = Names(sortIndex);
identifier = identifier(sortIndex);

% Plot
figure('Renderer', 'painters', 'Position', [10 10 750 350])
%See this forum post for why I'm using 'diag'
%It's a silly and messy way to make N bar charts
%Rather than just one bar chart
%And that way I can assign a legend entry for the Nth elements that I want
%to
%https://www.mathworks.com/matlabcentral/answers/871108-legend-in-bar-plot
b = bar(diag(H1437RMSE_smushed(1:10),0),'stacked');
hxtitle = get(gca,'XLabel');
hytitle = get(gca,'YLabel');
htitle = get(gca,'Title');
set(gca,'TickLabelInterpreter','Latex');
set(hxtitle,'Interpreter','Latex');
set(hytitle,'Interpreter','Latex');
set(htitle,'Interpreter','Latex');
set(hytitle,'String','RMSE');
set(hytitle,'Fontsize',14); 
set(gca,'XTickLabel', Names(1:10));
%set(gca,'YLim',[-100 100]);

%b.FaceColor = 'flat';
blue1 = [0.18 0.451 0.8];
blue2 = [0.369 0.616 0.929];

orange1 = [0.91 0.369 0.192];
orange2 = [0.929 0.322 0.09];
for i = 1:10
    if identifier(i) > 0
        b(i).FaceColor = blue1;
    else
        b(i).FaceColor = orange2;
    end
end

leg = legend([b(4) b(1)], {'f(y)', 'LET'});
leg.Position = [0.8304 0.8882 0.0978 0.1042];
leg.Interpreter = 'Latex';
leg.FontSize = 11;

f = gcf;
exportgraphics(f,'H1437_best_RMSE.png','Resolution',300, 'BackgroundColor','white');

%% AGO RMSE Bar Chart of Best Models

% Gather several arrays:
% 1.) Names of models -- Names
% 2.) RMSE of those models -- AGORMSE_smushed
% 3.) AIC of those models -- AGOAIC_smushed = [AGOAIC, AGOAIC_LET];
% 4.) Whether they are f(y) or LET based
Names = {'Linear'; 'Quadratic'; 'Cubic'; 'Fourth';'Fifth';'Q';'QE';'QE2';'LE';'LQE';'LE2';'LQE2';'Gaussian';'Skew Gaussian';'Morstin et al.'}; Names = transpose([Names; Names]);
AGORMSE_smushed = [AGORMSE, AGORMSE_LET];
AGOAIC_smushed = [AGOAIC, AGOAIC_LET];
identifier = zeros(size(AGOAIC_smushed));
identifier(16:end) = 1;


% Sort by RMSE
[AGORMSE_smushed, sortIndex] = sort(AGORMSE_smushed,'ascend');
Names = Names(sortIndex);
identifier = identifier(sortIndex);

% Plot
figure('Renderer', 'painters', 'Position', [10 10 750 350])
%See this forum post for why I'm using 'diag'
%It's a silly and messy way to make N bar charts
%Rather than just one bar chart
%And that way I can assign a legend entry for the Nth elements that I want
%to
%https://www.mathworks.com/matlabcentral/answers/871108-legend-in-bar-plot
b = bar(diag(AGORMSE_smushed(1:10),0),'stacked');
hxtitle = get(gca,'XLabel');
hytitle = get(gca,'YLabel');
htitle = get(gca,'Title');
set(gca,'TickLabelInterpreter','Latex');
set(hxtitle,'Interpreter','Latex');
set(hytitle,'Interpreter','Latex');
set(htitle,'Interpreter','Latex');
set(hytitle,'String','RMSE');
set(hytitle,'Fontsize',14); 
set(gca,'XTickLabel', Names(1:10));
%set(gca,'YLim',[-100 100]);

%b.FaceColor = 'flat';
blue1 = [0.18 0.451 0.8];
blue2 = [0.369 0.616 0.929];

orange1 = [0.91 0.369 0.192];
orange2 = [0.929 0.322 0.09];
for i = 1:10
    if identifier(i) > 0
        b(i).FaceColor = blue1;
    else
        b(i).FaceColor = orange2;
    end
end

leg = legend([b(10) b(4)], {'f(y)', 'LET'});
leg.Position = [0.8304 0.8882 0.0978 0.1042];
leg.Interpreter = 'Latex';
leg.FontSize = 11;

f = gcf;
exportgraphics(f,'AGO_best_RMSE.png','Resolution',300, 'BackgroundColor','white');

%% U87 RMSE Bar Chart of Best Models

% Gather several arrays:
% 1.) Names of models -- Names
% 2.) RMSE of those models -- U87RMSE_smushed
% 3.) AIC of those models -- U87AIC_smushed = [U87AIC, U87AIC_LET];
% 4.) Whether they are f(y) or LET based
Names = {'Linear'; 'Quadratic'; 'Cubic'; 'Fourth';'Fifth';'Q';'QE';'QE2';'LE';'LQE';'LE2';'LQE2';'Gaussian';'Skew Gaussian';'Morstin et al.'}; Names = transpose([Names; Names]);
U87RMSE_smushed = [U87RMSE, U87RMSE_LET];
U87AIC_smushed = [U87AIC, U87AIC_LET];
identifier = zeros(size(U87AIC_smushed));
identifier(16:end) = 1;


% Sort by RMSE
[U87RMSE_smushed, sortIndex] = sort(U87RMSE_smushed,'ascend');
Names = Names(sortIndex);
identifier = identifier(sortIndex);

% Plot
figure('Renderer', 'painters', 'Position', [10 10 750 350])
%See this forum post for why I'm using 'diag'
%It's a silly and messy way to make N bar charts
%Rather than just one bar chart
%And that way I can assign a legend entry for the Nth elements that I want
%to
%https://www.mathworks.com/matlabcentral/answers/871108-legend-in-bar-plot
b = bar(diag(U87RMSE_smushed(1:10),0),'stacked');
hxtitle = get(gca,'XLabel');
hytitle = get(gca,'YLabel');
htitle = get(gca,'Title');
set(gca,'TickLabelInterpreter','Latex');
set(hxtitle,'Interpreter','Latex');
set(hytitle,'Interpreter','Latex');
set(htitle,'Interpreter','Latex');
set(hytitle,'String','RMSE');
set(hytitle,'Fontsize',14); 
set(gca,'XTickLabel', Names(1:10));
%set(gca,'YLim',[-100 100]);

%b.FaceColor = 'flat';
blue1 = [0.18 0.451 0.8];
blue2 = [0.369 0.616 0.929];

orange1 = [0.91 0.369 0.192];
orange2 = [0.929 0.322 0.09];
for i = 1:10
    if identifier(i) > 0
        b(i).FaceColor = blue1;
    else
        b(i).FaceColor = orange2;
    end
end

leg = legend([b(10) b(1)], {'f(y)', 'LET'});
leg.Position = [0.8304 0.8882 0.0978 0.1042];
leg.Interpreter = 'Latex';
leg.FontSize = 11;

f = gcf;
exportgraphics(f,'U87_best_RMSE.png','Resolution',300, 'BackgroundColor','white');

