%% Loading data
files = ["C:\Users\josep\Dropbox\Documents\Work\Projects\MDA_vitro_RBE\Data\Chaudhary\dy\PristineDy1.1.csv", ...
    "C:\Users\josep\Dropbox\Documents\Work\Projects\MDA_vitro_RBE\Data\Chaudhary\dy\PristineDy3.9.csv", ...
    "C:\Users\josep\Dropbox\Documents\Work\Projects\MDA_vitro_RBE\Data\Chaudhary\dy\PristineDy6.7.csv", ...
    "C:\Users\josep\Dropbox\Documents\Work\Projects\MDA_vitro_RBE\Data\Chaudhary\dy\PristineDy11.6.csv", ...
    "C:\Users\josep\Dropbox\Documents\Work\Projects\MDA_vitro_RBE\Data\Chaudhary\dy\PristineDy17.7.csv", ...
    "C:\Users\josep\Dropbox\Documents\Work\Projects\MDA_vitro_RBE\Data\Chaudhary\dy\PristineDy22.5.csv"]

figLabels = ["1.1 keV/um", "3.9 keV/um","6.7 keV/um","11.6 keV/um", ...
"17.7 keV/um","22.5 keV/um"];

%% Plotting Pristine d(y)
figure('Position', [10 10 1500 900], 'Color', 'w')
tiledplot = tiledlayout(3,2);
title(tiledplot, "Chaudhary et al. d(y) spectra of pristine Bragg curves.");

for i = 1:6

    data = readtable(files(i));
    
    %Weight by y, to get y * d(y) for plotting.
    for j = 1:size(data,1)
        data{j,2} = data{j,2} * data{j,1};
    end

    ax = nexttile;
    hold on;

    sobp_dy = plot(ax, data{1:end,1},data{1:end,2});
    sobp_dy.Color = [0 0.4470 0.7410];
    sobp_dy.LineWidth = 1.5;

    set(gca, 'XScale', 'log');
    xlabel("y $$ [\frac{keV}{\mu m}] $$",'Interpreter','latex','FontSize',15);
    ylabel("$$ y \cdot d(y) $$",'Interpreter','latex','FontSize',15);

    legend(sobp_dy,figLabels(i),'Location','northwest','FontSize',12);

end

%% Loading data
files = ["C:\Users\josep\Dropbox\Documents\Work\Projects\MDA_vitro_RBE\Data\Chaudhary\dy\SOBPDy1.27.csv", ...
    "C:\Users\josep\Dropbox\Documents\Work\Projects\MDA_vitro_RBE\Data\Chaudhary\dy\SOBPDy3.csv", ...
    "C:\Users\josep\Dropbox\Documents\Work\Projects\MDA_vitro_RBE\Data\Chaudhary\dy\SOBPDy4.4.csv", ...
    "C:\Users\josep\Dropbox\Documents\Work\Projects\MDA_vitro_RBE\Data\Chaudhary\dy\SOBPDy13.7.csv", ...
    "C:\Users\josep\Dropbox\Documents\Work\Projects\MDA_vitro_RBE\Data\Chaudhary\dy\SOBPDy20.9.csv", ...
    "C:\Users\josep\Dropbox\Documents\Work\Projects\MDA_vitro_RBE\Data\Chaudhary\dy\SOBPDy25.4.csv"]

figLabels = ["1.27 keV/um", "3 keV/um","4.4 keV/um","13.7 keV/um", ...
"20.9 keV/um","25.4 keV/um"];

%% Plotting Pristine d(y)
figure('Position', [10 10 1500 900], 'Color', 'w')
tiledplot = tiledlayout(3,2);
title(tiledplot, "Chaudhary et al. d(y) spectra of SOBPs.");

for i = 1:6

    data = readtable(files(i));
    
    %Weight by y, to get y * d(y) for plotting.
    for j = 1:size(data,1)
        data{j,2} = data{j,2} * data{j,1};
    end

    ax = nexttile;
    hold on;

    sobp_dy = plot(ax, data{1:end,1},data{1:end,2});
    sobp_dy.Color = [0 0.4470 0.7410];
    sobp_dy.LineWidth = 1.5;

    set(gca, 'XScale', 'log');
    xlabel("y $$ [\frac{keV}{\mu m}] $$",'Interpreter','latex','FontSize',15);
    ylabel("$$ y \cdot d(y) $$",'Interpreter','latex','FontSize',15);

    legend(sobp_dy,figLabels(i),'Location','northwest','FontSize',12);

end


