%% Loading data
pristine = readtable("C:\Users\josep\Dropbox\Documents\Work\Projects\MDA_vitro_RBE\Data\Chaudhary\Proton spectra\Pristine.csv");
pristine_rebin = readtable("C:\Users\josep\Dropbox\Documents\Work\Projects\MDA_vitro_RBE\Data\Chaudhary\Proton spectra\Pristine_rebin.csv");

SOBP = readtable("C:\Users\josep\Dropbox\Documents\Work\Projects\MDA_vitro_RBE\Data\Chaudhary\Proton spectra\SOBP.csv");
SOBP_rebin = readtable("C:\Users\josep\Dropbox\Documents\Work\Projects\MDA_vitro_RBE\Data\Chaudhary\Proton spectra\SOBP_rebin.csv");

%% Plotting Pristine
figure('Position', [10 10 900 600])
tiledplot = tiledlayout(3,2);
title(tiledplot, "Chaudhary et al. Pristine Bragg Curve proton spectra.");

for i = 2:7

    ax = nexttile;
    hold on;

    sobp_plot = plot(ax, pristine{2:299,1},pristine{2:299,i});
    sobp_plot.Color = [0.6350 0.0780 0.1840];
    sobp_rebin_plot = plot(ax, pristine_rebin{2:end-1,1},pristine_rebin{2:end-1,i});
    sobp_rebin_plot.Color = [0 0.4470 0.7410];

    set(gca, 'YScale', 'log');
    set(gca, 'XLim', [0,60]);
    xlabel("Energy [MeV]",'Interpreter','latex','FontSize',14);
    ylabel("Fluence [arb]",'Interpreter','latex','FontSize',14);

    legend([sobp_plot, sobp_rebin_plot],{"Original", "Rebinned"});

end

%% Plotting SOBP
figure('Position', [10 10 900 600])
tiledplot = tiledlayout(3,2);
title(tiledplot, "Chaudhary et al. SOBP proton spectra.");

for i = 2:7

    ax = nexttile;
    hold on;

    sobp_plot = plot(ax, SOBP{2:299,1},SOBP{2:299,i});
    sobp_plot.Color = [0.6350 0.0780 0.1840];
    sobp_rebin_plot = plot(ax, SOBP_rebin{2:end-1,1},SOBP_rebin{2:end-1,i});
    sobp_rebin_plot.Color = [0 0.4470 0.7410];

    set(gca, 'YScale', 'log');
    set(gca, 'XLim', [0,60]);
    xlabel("Energy [MeV]",'Interpreter','latex','FontSize',14);
    ylabel("Fluence [arb]",'Interpreter','latex','FontSize',14);

    legend([sobp_plot, sobp_rebin_plot],{"Original", "Rebinned"});

end

%% Comparing Pristine and SOBP

figure('Position', [10 10 900 600])
tiledplot = tiledlayout(3,2);
title(tiledplot, "Chaudhary et al. Pristine vs. SOBP proton spectra.");

for i = 2:7

    ax = nexttile;
    hold on;

    sobp_plot = plot(ax, pristine{2:299,1},pristine{2:299,i});
    sobp_plot.Color = [0.6350 0.0780 0.1840];
    sobp_rebin_plot = plot(ax, SOBP{2:299,1},SOBP{2:299,i});
    sobp_rebin_plot.Color = [0 0.4470 0.7410];

    set(gca, 'YScale', 'log');
    set(gca, 'XLim', [0,60]);
    xlabel("Energy [MeV]",'Interpreter','latex','FontSize',14);
    ylabel("Fluence [arb]",'Interpreter','latex','FontSize',14);

    legend([sobp_plot, sobp_rebin_plot],{"Pristine", "SOBP"});

end