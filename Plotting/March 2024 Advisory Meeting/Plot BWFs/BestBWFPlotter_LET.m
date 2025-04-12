%% Let's put down the fit parameters and names of the best BWFs (in terms of AIC)

x = linspace(1e-2,30,300);

% New best:
% H460: Cubic
% H1437: Cubic
% AGO: Fourth
% U87: Linear

params = [0.193296021	0.016719377	-0.00392727	0.000404675];
H460_Cubic_BWF = gather(GetBWFVals(x, "CubicBWF",params));

params = [0.012597029	0.038322427	-0.004810266	0.000263291];
H1437_Cubic_BWF = gather(GetBWFVals(x, "CubicBWF",params));

params = [0.894193233	0.130716686	-0.013578168	0.000746335	-1.40E-05];
AGO_Fourth_BWF = gather(GetBWFVals(x, "FourthBWF",params));

params = [0.247948161	0.018271588];
U87_Linear_BWF = gather(GetBWFVals(x, "LinearBWF",params));

%% Plotting

linewidth = 1;
figure()

a = plot(x, H460_Cubic_BWF);
a.LineWidth = linewidth;
a.LineStyle = '--';

hold on 
a = plot(x, H1437_Cubic_BWF);
a.LineWidth = linewidth;
a.LineStyle = '--';

a = plot(x, AGO_Fourth_BWF);
a.LineWidth = linewidth;
a.LineStyle = '--';

a = plot(x, U87_Linear_BWF);
a.LineWidth = linewidth;
a.LineStyle = '--';

hxtitle = get(gca,'XLabel');
hytitle = get(gca,'YLabel');
htitle = get(gca,'Title');

set(gca,'TickLabelInterpreter','Latex');
set(hxtitle,'Interpreter','Latex');
set(hytitle,'Interpreter','Latex');
set(htitle,'Interpreter','Latex');

set(hxtitle,'String','LET$_d$ $[\frac{keV}{\mu m}]$');
set(hytitle,'String','$r_{\alpha}$');
ax = gca;
ax.FontSize = 12;
set(hxtitle,'Fontsize',18); 
set(hytitle,'Fontsize',18); 

leg = legend(["H460 (Cubic)" "H1437 (Cubic)" "AGO (Fourth)" "U87 (Linear)"]);
leg.Position = [0.1596    0.6682    0.3185    0.2264];
leg.Interpreter = 'Latex';
leg.FontSize = 12;

f = gcf;
exportgraphics(f,'Best_BWFs_LET.png','Resolution',600, 'BackgroundColor','white')