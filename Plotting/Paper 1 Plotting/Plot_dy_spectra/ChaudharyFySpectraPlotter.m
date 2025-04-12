%% Plotting Pristine and SOBP d(y)

filesPristine = ["C:\Users\josep\Dropbox\Documents\Work\Projects\MDA_vitro_RBE\Data\Chaudhary\fy\PristineF1y1.1.csv", ...
    "C:\Users\josep\Dropbox\Documents\Work\Projects\MDA_vitro_RBE\Data\Chaudhary\fy\PristineF1y3.9.csv", ...
    "C:\Users\josep\Dropbox\Documents\Work\Projects\MDA_vitro_RBE\Data\Chaudhary\fy\PristineF1y6.7.csv", ...
    "C:\Users\josep\Dropbox\Documents\Work\Projects\MDA_vitro_RBE\Data\Chaudhary\fy\PristineF1y11.6.csv", ...
    "C:\Users\josep\Dropbox\Documents\Work\Projects\MDA_vitro_RBE\Data\Chaudhary\fy\PristineF1y17.7.csv", ...
    "C:\Users\josep\Dropbox\Documents\Work\Projects\MDA_vitro_RBE\Data\Chaudhary\fy\PristineF1y22.5.csv"];

filesSOBP = ["C:\Users\josep\Dropbox\Documents\Work\Projects\MDA_vitro_RBE\Data\Chaudhary\fy\SOBPFy1.27.csv", ...
    "C:\Users\josep\Dropbox\Documents\Work\Projects\MDA_vitro_RBE\Data\Chaudhary\fy\SOBPFy3.csv", ...
    "C:\Users\josep\Dropbox\Documents\Work\Projects\MDA_vitro_RBE\Data\Chaudhary\fy\SOBPFy4.4.csv", ...
    "C:\Users\josep\Dropbox\Documents\Work\Projects\MDA_vitro_RBE\Data\Chaudhary\fy\SOBPFy13.7.csv", ...
    "C:\Users\josep\Dropbox\Documents\Work\Projects\MDA_vitro_RBE\Data\Chaudhary\fy\SOBPFy20.9.csv", ...
    "C:\Users\josep\Dropbox\Documents\Work\Projects\MDA_vitro_RBE\Data\Chaudhary\fy\SOBPFy25.4.csv"];

figLabels = ["1.27 keV/um", "3 keV/um","4.4 keV/um","13.7 keV/um", ...
"20.9 keV/um","25.4 keV/um"];

legend_Title = ["Pristine (1.1)", "SOBP (1.27)", "Pristine (3.9)", "SOBP (3)", "Pristine (6.7)", "SOBP (4.4)", "Pristine (11.6)", "SOBP (13.7)", "Pristine (17.7)", "SOBP (20.9)", "Pristine (22.5)", "SOBP (25.4)"];
    
% "1.27 keV/um", "3 keV/um","4.4 keV/um","13.7 keV/um", ...
% "20.9 keV/um","25.4 keV/um"];

figure('Position', [1.6938e+03 -365.4000 1096 941.6000], 'Color', 'w')
tiledplot = tiledlayout(3,2);
% title(tiledplot, "Chaudhary et al. d(y) spectra of experiments.");

for i = 1:6

    dataPristine = readtable(filesPristine(i));
    dataSOBP = readtable(filesSOBP(i));
    
    %Weight by y, to get y * d(y) for plotting.
    for j = 1:size(dataPristine,1)
        dataPristine{j,2} = dataPristine{j,2} * dataPristine{j,1};
    end

    %Weight by y, to get y * d(y) for plotting.
    for j = 1:size(dataSOBP,1)
        dataSOBP{j,2} = dataSOBP{j,2} * dataSOBP{j,1};
    end


    ax = nexttile;
    hold on;

    pristine_dy = plot(ax, dataPristine{1:end,1},dataPristine{1:end,2});
    pristine_dy.Color = [0.047, 0.31, 0.788];
    pristine_dy.LineWidth = 1.5;

    sobp_dy = plot(ax, dataSOBP{1:end,1},dataSOBP{1:end,2});
    sobp_dy.Color = [0.941, 0.063, 0.063];
    sobp_dy.LineWidth = 1.5;

    set(gca, 'XScale', 'log');
    set(gca, 'XLim', [1e-2 300]);
    xlabel("y $$ [\frac{keV}{\mu m}] $$",'Interpreter','latex','FontSize',15);
    ylabel("$$ y \cdot f(y) $$",'Interpreter','latex','FontSize',15);
    if i == 1
        legend([pristine_dy, sobp_dy],[legend_Title(i*2-1), legend_Title(i*2)],'Location','northeast','FontSize',10);
    else
        legend([pristine_dy, sobp_dy],[legend_Title(i*2-1), legend_Title(i*2)],'Location','northwest','FontSize',10);
    end

end
