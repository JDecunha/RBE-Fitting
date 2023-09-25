function [output] = DirectAlphaBetaPlotter(FuncVals, filePaths)

experiments = [];
%Loop through the files and concatenate
for i = 1:size(filePaths,2)
    experiments = cat(3,experiments, readmatrix(filePaths(i)));
end

GPUExperimentalData = ExperimentData(experiments);

%% Plot
figure('Position', [0 0 900 350], 'Color', 'w')
tiledplot = tiledlayout(2,1);
hold on;
%title(tiledplot, plotitle);

LETsRaw = GPUExperimentalData.LETD(1,1,:);
LETs = zeros(size(GPUExperimentalData.LETD(1,1,:),3),1);
LETs(:) = LETsRaw(1,1,:);
%LETs = zeros,1);
alphas = FuncVals(1:2:end);
betas = FuncVals(2:2:end);

ax = nexttile;
hold on;

survivpredic = plot(ax, LETs, alphas);
survivpredic.Color = [0 0.4470 0.7410];
survivpredic.MarkerSize = 7;
survivpredic.LineWidth = 2;
survivpredic.LineStyle = 'none';
survivpredic.Marker = 'x';
xlabel("$LET_d$",'Interpreter','latex','FontSize',15);
ylabel("$\alpha$",'Interpreter','latex','FontSize',15);

ax = nexttile;
hold on;

survivpredic = plot(ax, LETs, betas);
survivpredic.Color = [0 0.4470 0.7410];
survivpredic.MarkerSize = 7;
survivpredic.LineWidth = 2;
survivpredic.LineStyle = 'none';
survivpredic.Marker = 'x';
xlabel("$LET_d$",'Interpreter','latex','FontSize',15);
ylabel("$\beta$",'Interpreter','latex','FontSize',15);

output = tiledplot;


end

