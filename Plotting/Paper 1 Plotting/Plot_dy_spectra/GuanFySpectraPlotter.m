%% Plotting Pristine and SOBP d(y)

filesPristine = ["C:\Users\josep\Dropbox\Documents\Work\Projects\MDA_vitro_RBE\Data\fyCSV\Guan_fy\fySpectrum_a.csv", ...
"C:\Users\josep\Dropbox\Documents\Work\Projects\MDA_vitro_RBE\Data\fyCSV\Guan_fy\fySpectrum_b.csv", ...
"C:\Users\josep\Dropbox\Documents\Work\Projects\MDA_vitro_RBE\Data\fyCSV\Guan_fy\fySpectrum_c.csv", ...
"C:\Users\josep\Dropbox\Documents\Work\Projects\MDA_vitro_RBE\Data\fyCSV\Guan_fy\fySpectrum_d.csv", ...
"C:\Users\josep\Dropbox\Documents\Work\Projects\MDA_vitro_RBE\Data\fyCSV\Guan_fy\fySpectrum_e.csv", ...
"C:\Users\josep\Dropbox\Documents\Work\Projects\MDA_vitro_RBE\Data\fyCSV\Guan_fy\fySpectrum_f.csv", ...
"C:\Users\josep\Dropbox\Documents\Work\Projects\MDA_vitro_RBE\Data\fyCSV\Guan_fy\fySpectrum_g.csv", ...
"C:\Users\josep\Dropbox\Documents\Work\Projects\MDA_vitro_RBE\Data\fyCSV\Guan_fy\fySpectrum_h.csv", ...
"C:\Users\josep\Dropbox\Documents\Work\Projects\MDA_vitro_RBE\Data\fyCSV\Guan_fy\fySpectrum_i.csv", ...
"C:\Users\josep\Dropbox\Documents\Work\Projects\MDA_vitro_RBE\Data\fyCSV\Guan_fy\fySpectrum_j.csv", ...
"C:\Users\josep\Dropbox\Documents\Work\Projects\MDA_vitro_RBE\Data\fyCSV\Guan_fy\fySpectrum_k.csv", ...
"C:\Users\josep\Dropbox\Documents\Work\Projects\MDA_vitro_RBE\Data\fyCSV\Guan_fy\fySpectrum_l.csv", ...
];

figLabels = ["1.27 keV/um", "3 keV/um","4.4 keV/um","13.7 keV/um", ...
"20.9 keV/um","25.4 keV/um"];

legend_Title = ["0.92", "1.16", "1.61", "1.81", "1.93", "2.34", "3.01", "5.08", "10.8", "15.2", "17.7", "19.0"];
    
% "1.27 keV/um", "3 keV/um","4.4 keV/um","13.7 keV/um", ...
% "20.9 keV/um","25.4 keV/um"];

figure('Position', [1.6938e+03 -464.6000 821.6000 1.0408e+03], 'Color', 'w')
tiledplot = tiledlayout(6,2);
% title(tiledplot, "Chaudhary et al. d(y) spectra of experiments.");

for i = 1:12

    dataPristine = readtable(filesPristine(i));
    
    %Weight by y, to get y * d(y) for plotting.
    for j = 1:size(dataPristine,1)
        dataPristine{j,2} = dataPristine{j,2} * dataPristine{j,1};
    end

    ax = nexttile;
    hold on;

    pristine_dy = plot(ax, dataPristine{1:end,1},dataPristine{1:end,2});
    pristine_dy.Color = [0.047, 0.31, 0.788];
    pristine_dy.LineWidth = 1.5;

    set(gca, 'XScale', 'log');
    set(gca, 'XLim', [1e-2 300]);
    xlabel("y $$ [\frac{keV}{\mu m}] $$",'Interpreter','latex','FontSize',13);
    ylabel("$$ y \cdot f(y) $$",'Interpreter','latex','FontSize',13);
    
    [hh,icons,plots,txt] = legend([pristine_dy],legend_Title(i),'Location','northwest','FontSize',10);
    p1 = icons(1).Position;
    hh.Position(3) = 0.057;
    % hh.Position = [0.6005 0.1524 0.0406 0.0200];

    icons(1).Position = [0.3 p1(2) 0];
    icons(2).XData = [0.05 0.2];
    % if i == 1
    %     legend([pristine_dy, sobp_dy],[legend_Title(i*2-1), legend_Title(i*2)],'Location','northeast','FontSize',10);
    % else
    %     legend([pristine_dy, sobp_dy],[legend_Title(i*2-1), legend_Title(i*2)],'Location','northwest','FontSize',10);
    % end

end
