%% Let's put down the fit parameters and names of the best BWFs (in terms of AIC)

x = linspace(1e-2,120,300);

% New best:
% H460: Fourth
% H1437: Fourth
% AGO: Fifth
% U87: Linear

params = [0.202517958	0.000697053	0.007274717	-0.001169286 1.92E-05];
H460_Fourth_BWF = gather(GetBWFVals(x, "FourthBWF",params));

params = [0.072414286	-0.0512998	0.025114619	-0.002109749	2.68E-05];
H1437_Fourth_BWF = gather(GetBWFVals(x, "FourthBWF",params));

params = [0.925855400923024,0.00170636047359922,0.0509839076360448,-0.00502354125506419,0.000111026508839398,-6.09469774721704e-07];
AGO_Fifth_BWF = gather(GetBWFVals(x, "FifthBWF",params));

params = [0.222390093	0.034567961	0.04023814];
U87_Linear_BWF = gather(GetBWFVals(x, "LinearBWF",params));

% Out of curiosity
params = [0.892227891	0.166430913	-0.006144203	-0.000340297	6.85E-06	3.25E-06];
AGO_Fourth_BWF = gather(GetBWFVals(x, "FourthBWF",params));

params = [0.30849125	-0.084775438	0.030322123	-0.002172912	4.54E-05	-2.56E-07];
U87_Fifth_BWF = gather(GetBWFVals(x, "FifthBWF",params));

%% Plotting

linewidth = 1;
figure()

a = plot(x, H460_Fourth_BWF);
a.LineWidth = linewidth;
a.LineStyle = '--';

hold on 
a = plot(x, H1437_Fourth_BWF);
a.LineWidth = linewidth;
a.LineStyle = '--';

a = plot(x, AGO_Fifth_BWF);
a.LineWidth = linewidth;
a.LineStyle = '--';

a = plot(x, U87_Linear_BWF);
a.LineWidth = linewidth;
a.LineStyle = '--';

% a = plot(x, AGO_Fourth_BWF);
% a.LineWidth = linewidth;
% a.LineStyle = '--';

% a = plot(x, U87_Fifth_BWF);
% a.LineWidth = linewidth;
% a.LineStyle = '--';

hxtitle = get(gca,'XLabel');
hytitle = get(gca,'YLabel');
htitle = get(gca,'Title');

set(gca,'TickLabelInterpreter','Latex');
set(hxtitle,'Interpreter','Latex');
set(hytitle,'Interpreter','Latex');
set(htitle,'Interpreter','Latex');

set(hxtitle,'String','$y [\frac{keV}{\mu m}]$');
set(hytitle,'String','$r_{\alpha}$');
ax = gca;
ax.FontSize = 12;
set(hxtitle,'Fontsize',18); 
set(hytitle,'Fontsize',18); 

leg = legend(["H460 (Fourth)" "H1437 (Fourth)" "AGO (Fifth)" "U87 (Linear)"]);
leg.Position = [0.1596    0.6682    0.3185    0.2264];
leg.Interpreter = 'Latex';
leg.FontSize = 14;

% f = gcf;
% exportgraphics(f,'Best_BWFs.png','Resolution',600, 'BackgroundColor','white')