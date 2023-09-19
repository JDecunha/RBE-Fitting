function [output] = SurvivalVsBWFplotter(kernelName, filePaths, FuncVals, maxDose)

%% Setup environment
addpath(genpath("."));

kernel = parallel.gpu.CUDAKernel(kernelName+".ptx", kernelName+".cu");
kernel.ThreadBlockSize = 1024;

%% Import the survival data
%A 3d array to hold the GPUExperimentalData data
GPUExperimentalData = [];

%Loop through the files and concatenate
for i = 1:size(filePaths,2)
    GPUExperimentalData = cat(3,GPUExperimentalData, readmatrix(filePaths(i)));
end

GPUExperimentalData = ExperimentData(GPUExperimentalData);
gpuBufferArray = gpuArray(zeros(size(GPUExperimentalData.BinCenter,1)-1,1));

%% Plot

figure('Position', [0 0 1800 750], 'Color', 'w')
numFigs = size(GPUExperimentalData,3);
rows = ceil(numFigs/3);
tiledplot = tiledlayout(rows,3);
hold on;
%title(tiledplot, plotitle);

%Loop through each d(y) spectrum
for i = 1:size(GPUExperimentalData.SF,3)

    gpuBufferArray = feval(kernel,GPUExperimentalData.BinWidth(:,1,i),GPUExperimentalData.BinCenter(:,1,i),GPUExperimentalData.BinValue(:,1,i),size(GPUExperimentalData.BinValue(:,1,i),1), FuncVals(1:end-1), gpuBufferArray);
    alphaPredicted = gather(sum(gpuBufferArray));
    betaPredicted = FuncVals(end); %last param of FuncVals is beta

    ax = nexttile;
    hold on;

    dosePlot = GPUExperimentalData.Dose(1:GPUExperimentalData.sizeDose(1,1,i),1,i);
    survivingFractionPlot = GPUExperimentalData.SF(1:GPUExperimentalData.sizeDose(1,1,i),1,i);
    sfPredictedPlot = [];

    %Loop through each dose and surviving fraction
    for j = 1:GPUExperimentalData.sizeDose(1,1,i)

        dose = GPUExperimentalData.Dose(j,1,i);
        survivingFraction = GPUExperimentalData.SF(j,1,i);
        
        %Calculate surviving fraction
        sfPredicted = (alphaPredicted*dose)+(betaPredicted*dose*dose);
        sfPredicted = -sfPredicted;
        sfPredicted = exp(sfPredicted);
        sfPredictedPlot = [sfPredictedPlot sfPredicted];

    end

    survivpredic = plot(ax, dosePlot, sfPredictedPlot);
    survivpredic.Color = [1 0.4470 0.7410];
    survivpredic.MarkerSize = 7;
    survivpredic.LineWidth = 2;
    survivpredic.LineStyle = 'none';
    survivpredic.Marker = '+';
    
    survivdata = plot(ax, dosePlot, survivingFractionPlot);
    survivdata.Color = [0 0.4470 0.7410];
    survivdata.MarkerSize = 7;
    survivdata.LineWidth = 2;
    survivdata.LineStyle = 'none';
    survivdata.Marker = 'x';
 
    set(gca, 'YScale', 'log');
    %Give a little buffer on the y axis limits
    yl = ylim;
    yl(1) = yl(1)*0.75;
    ylim(yl);
    %Make x axis consistent
    xlim([0, maxDose]);
    xlabel("Dose [Gy]",'Interpreter','latex','FontSize',15);
    ylabel("SF [\%]",'Interpreter','latex','FontSize',15);

end

theLegend = legend([survivdata,survivpredic],["Data", "Prediction"]);%, "Location" , "east");
theLegend.Layout.Tile = 'East';

output = tiledplot;


end

