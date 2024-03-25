%% Let's put down the fit parameters and names of the best BWFs (in terms of AIC)

x = linspace(1e-2,100,300);

% H460: QE
params = [-0.835685905	-0.012553733	-0.064049626];
H460_QE_BWF = gather(GetBWFVals(x, "QEBWF",params));
% H460: Fourth
params = [0.19131744	0.023780171	-3.41E-05	-0.000661178	1.33E-05];
H460_Fourth_BWF = gather(GetBWFVals(x, "FourthBWF",params));
% H1437: Fifth
params = [0.012524104	0.041697013	-5.63E-07	-0.000397899	-6.38E-14	9.40E-08];
H1437_Fifth_BWF = gather(GetBWFVals(x, "FifthBWF",params));
% AGO: Fifth
params = [0.925855400923024,0.00170636047359922,0.0509839076360448,-0.00502354125506419,0.000111026508839398,-6.09469774721704e-07];
AGO_Fifth_BWF = gather(GetBWFVals(x, "FifthBWF",params));
% U87: Linear
params = [0.222390093	0.034567961];
U87_Linear_BWF = gather(GetBWFVals(x, "LinearBWF",params));


%% Plotting

linewidth = 1;
figure()

a = plot(x, H460_QE_BWF);
a.LineWidth = linewidth;
a.LineStyle = '--';
hold on

%a = plot(x, H460_Fourth_BWF);
% a = plot(x, H1437_Fifth_BWF);
% a.LineWidth = linewidth;
% a.LineStyle = '--';

a = plot(x, H1437_Fifth_BWF);
a.LineWidth = linewidth;
a.LineStyle = '--';

a = plot(x, AGO_Fifth_BWF);
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

set(hxtitle,'String','$y [\frac{keV}{\mu m}]$');
set(hytitle,'String','$r_{\alpha}$');
set(hxtitle,'Fontsize',14); 
set(hytitle,'Fontsize',14); 

leg = legend(["H460 (QE)" "H1437 (Fifth)" "AGO (Fifth)" "U87 (Linear)"]);
leg.Position = [0.1522    0.7215    0.2493    0.1807];
leg.Interpreter = 'Latex';
leg.FontSize = 11;

% f = gcf;
% exportgraphics(f,'Best_BWFs.png','Resolution',300, 'BackgroundColor','white')

