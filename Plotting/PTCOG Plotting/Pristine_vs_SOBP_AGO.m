%% Let's determine cost of the top 5 pristine models for f(y)-AGO
filePaths = ["AGO_SOBP_fy/1.27.csv","AGO_SOBP_fy/3.csv","AGO_SOBP_fy/4.4.csv","AGO_SOBP_fy/13.7.csv","AGO_SOBP_fy/20.9.csv","AGO_SOBP_fy/25.4.csv"];
%filePaths = ["AGO_pristine_fy/1.1.csv","AGO_pristine_fy/3.9.csv","AGO_pristine_fy/6.7.csv","AGO_pristine_fy/11.6.csv","AGO_pristine_fy/17.7.csv","AGO_pristine_fy/22.5.csv"];

% AGO best models Cubic, LQE, Gaussian, LE, LQE2
CubicParams = [0.98093336, 0.033456255, 0.005455094, -7.44E-05, 0.007166257];
CubicfySOBPCost = DetermineModelCost("CubicBWF", CubicParams, filePaths);

LQEParams = [-0.000101665,0.17265292,-0.001025522,0.167477508,0.008389703];
LQEfySOBPCost = DetermineModelCost("LQEBWF", LQEParams, filePaths);

GaussianParams = [5.649937095,-4.696891626,-2.302087262,-19.64507977,0.008931498];
GaussianfySOBPCost = DetermineModelCost("GaussianBWF", GaussianParams, filePaths);

LEParams = [-0.029141194,0.139346957,0.095690842,0.008930947];
LEfySOBPCost = DetermineModelCost("LEBWF", LEParams, filePaths);

LQE2Params = [-0.105161998,0.216875312,-0.002237173,0.052746444,0.008925439];
LQE2fySOBPCost = DetermineModelCost("LQE2BWF", LQE2Params, filePaths);


%% Let's determine cost of the top 5 pristine models for LETd-AGO
%filePaths = ["AGO_pristine_fy/1.1.csv","AGO_pristine_fy/3.9.csv","AGO_pristine_fy/6.7.csv","AGO_pristine_fy/11.6.csv","AGO_pristine_fy/17.7.csv","AGO_pristine_fy/22.5.csv"];
filePaths = ["AGO_SOBP_fy/1.27.csv","AGO_SOBP_fy/3.csv","AGO_SOBP_fy/4.4.csv","AGO_SOBP_fy/13.7.csv","AGO_SOBP_fy/20.9.csv","AGO_SOBP_fy/25.4.csv"];

CubicParams = [0.918065129, 0.081310112, -0.004191177, 0.000139562, 0.013129616];
CubicfySOBPCostLET = DetermineModelCostLET("CubicBWF", CubicParams, filePaths);

LQEParams = [-0.045404303,0.000568809,-0.004834399,-0.068867363,0.007504162];
LQEfySOBPCostLET = DetermineModelCostLET("LQEBWF", LQEParams, filePaths);

GaussianParams = [25.88410869,-25.25305246,-21.58972498,123.1861815,0.008939898];
GaussianfySOBPCostLET = DetermineModelCostLET("GaussianBWF", GaussianParams, filePaths);

LEParams = [0.016210881,0.003594287,-0.033128467,0.008931322];
LEfySOBPCostLET = DetermineModelCostLET("LEBWF", LEParams, filePaths);

LQE2Params = [-0.042746278,0.063589776,-0.003185576,-0.001770769,0.008904127];
LQE2fySOBPCostLET = DetermineModelCostLET("LQE2BWF", LQE2Params, filePaths);

data = [CubicfySOBPCostLET,CubicfySOBPCost,LQEfySOBPCostLET,LQEfySOBPCost,GaussianfySOBPCostLET,GaussianfySOBPCost,LEfySOBPCostLET,LEfySOBPCost,LQE2fySOBPCostLET,LQE2fySOBPCost];

%% Let's plot them

figure('Renderer', 'painters', 'Position', [10 10 500 350])
b = bar(data);

%set(gca, 'YScale', 'log');
%set(gca,'YLim',[1e0 5e3]);

hxtitle = get(gca,'XLabel');
hytitle = get(gca,'YLabel');
htitle = get(gca,'Title');
set(gca,'TickLabelInterpreter','Latex');
set(hxtitle,'Interpreter','Latex');
set(hytitle,'Interpreter','Latex');
set(htitle,'Interpreter','Latex');
set(hytitle,'String','Cost Function');
%title("H460 LET$_d$, Gradient Descent vs. Simulated Annealing")

%set(gca,'YTick',[0 250 500 750]);
%set(gca,'YTickLabel',[1 10 100 1000]);
set(gca,'XTickLabel', {'Cubic'; ''; 'LQE'; '';'Gaussian';'';'LE';'';'LQE2';''});

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

set(hytitle,'Fontsize',14); 

f = gcf;
exportgraphics(f,'AGO_SOBP_fy_vsLETd.png','Resolution',300, 'BackgroundColor','white')
