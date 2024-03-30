%% H460
filePaths = ["H460_fy/a.csv", "H460_fy/b.csv" , "H460_fy/c.csv", "H460_fy/d.csv", "H460_fy/e.csv", "H460_fy/f.csv", "H460_fy/g.csv", "H460_fy/h.csv", "H460_fy/i.csv", "H460_fy/j.csv" , "H460_fy/k.csv" , "H460_fy/l.csv"];
dose = 2; % Gy

% H460 - Alphas from directly fitting the data
H460DirectFit = RunScript_Direct_Alpha_SingleBeta("H460_Direct_Fit", filePaths);
% H460 - Alphas from Fifth BWF model
[LET, alphaH460Fifth] = Retrieve_Alpha_from_model("FifthBWF", [0.206743144	0.001179251	0.0018071	6.62E-05	-4.12E-05	5.53E-07	0.114748244], filePaths);
% H460 - Alphas from Cubic LET model
[LET, alphaH460CubicLET] =  Retrieve_Alpha_from_LET_model("CubicBWF", [0.193296021	0.016719377	-0.00392727	0.000404675	0.115027692], filePaths);

%Convert to Surviving Fraction
PhotonSF = zeros(size(alphaH460Fifth,2),1);
H460DirectFitSF = zeros(size(H460DirectFit{1,1}{1,1},1)-1,1);
alphaH460FifthSF = zeros(size(alphaH460Fifth,2),1);
alphaH460CubicLETSF = zeros(size(alphaH460CubicLET,2),1);
for i = 1:size(H460DirectFitSF)
    H460DirectFitSF(i) = LQ_Model(H460DirectFit{1,1}{1,1}(i),H460DirectFit{1,1}{1,1}(end),dose);
    alphaH460FifthSF(i) = LQ_Model(alphaH460Fifth(i),0.114748244,dose);
    alphaH460CubicLETSF(i) = LQ_Model(alphaH460CubicLET(i),0.115027692,dose);
    PhotonSF(i) = LQ_Model(0.29,0.083,dose);
end

%Convert to RBE by determining equivalent photon dose
H460DirectFitRBE = zeros(size(H460DirectFit{1,1}{1,1},1)-1,1);
alphaH460FifthRBE = zeros(size(alphaH460Fifth,2),1);
alphaH460CubicLETRBE = zeros(size(alphaH460CubicLET,2),1);
for i = 1:size(H460DirectFitSF)
    H460DirectFitRBE(i) = DetermineDoseFor_RBE_SF_alphabeta(0.29,0.083,H460DirectFitSF(i));
    alphaH460FifthRBE(i) = DetermineDoseFor_RBE_SF_alphabeta(0.29,0.083,alphaH460FifthSF(i));
    alphaH460CubicLETRBE(i) = DetermineDoseFor_RBE_SF_alphabeta(0.29,0.083,alphaH460CubicLETSF(i));
end

H460DirectFitRBE = H460DirectFitRBE./2;
alphaH460FifthRBE = alphaH460FifthRBE./2;
alphaH460CubicLETRBE = alphaH460CubicLETRBE./2;

%Calculate McNamara RBE
LETsforMcnamara = linspace(0,20,100);
McNamaraRBE = zeros(size(LETsforMcnamara));
for i = 1:size(McNamaraRBE,2)
    McNamaraRBE(i) = McNamara(2,(0.290/0.083),LETsforMcnamara(i));
end
 
%Plot
figure();
hold on

a = plot(LET, alphaH460FifthRBE);
a.LineStyle = 'none';
a.Marker = '^';
a.LineWidth = 1;
blue1 = [0.122 0.475 0.82];
blue2 = [0.333 0.631 0.922];
%a.MarkerFaceColor = [0.122 0.475 0.82];
a.MarkerEdgeColor = blue1;
a.MarkerSize = 6;

a = plot(LET, alphaH460CubicLETRBE);
a.LineStyle = 'none';
a.Marker = 'pentagram';
red1 = [0.89 0.227 0.071];
red2 = [0.89 0.094 0.071];
a.MarkerEdgeColor = red2;
a.MarkerSize = 8;

a = plot(LET, H460DirectFitRBE);
a.LineStyle = 'none';
a.Marker = '.';
a.Color = [0 0 0];
a.MarkerSize = 12;
a.LineWidth = 1;

hxtitle = get(gca,'XLabel');
hytitle = get(gca,'YLabel');
htitle = get(gca,'Title');

set(gca,'TickLabelInterpreter','Latex');
set(hxtitle,'Interpreter','Latex');
set(hytitle,'Interpreter','Latex');
set(htitle,'Interpreter','Latex');

set(hxtitle,'String','LET$_d$ $[\frac{keV}{\mu m}]$');
set(hytitle,'String','$\alpha$');
set(hxtitle,'Fontsize',14); 
set(hytitle,'Fontsize',14); 

leg = legend(["Fifth - f(y)" "Cubic - LET" "Measurement"]);
leg.Position = [0.1512 0.7722 0.2441 0.1376];
leg.Interpreter = 'Latex';
leg.FontSize = 11;

a = plot(LETsforMcnamara, McNamaraRBE);

% f = gcf;
% exportgraphics(f,'H460_bestAlpha.png','Resolution',300, 'BackgroundColor','white')

%% H1437
filePaths = ["H1437_fy/a.csv", "H1437_fy/b.csv" , "H1437_fy/c.csv", "H1437_fy/d.csv", "H1437_fy/e.csv", "H1437_fy/f.csv", "H1437_fy/g.csv", "H1437_fy/h.csv", "H1437_fy/i.csv", "H1437_fy/j.csv" , "H1437_fy/k.csv" , "H1437_fy/l.csv"];

% H1437 - Alphas from directly fitting the data
H1437DirectFit = RunScript_Direct_Alpha_SingleBeta("H1437_Direct_Fit", filePaths);
% H1437 - Alphas from Fifth BWF model
[LET, alphaH1437Fifth] = Retrieve_Alpha_from_model("FifthBWF", [0.012524104	0.041697013	-5.63E-07	-0.000397899	-6.38E-14	9.40E-08	0.03475491], filePaths);
% H1437 - Alphas from Cubic LET model
[LET, alphaH1437CubicLET] =  Retrieve_Alpha_from_LET_model("CubicBWF", [0.012597029	0.038322427	-0.004810266	0.000263291	0.035104747], filePaths);

%Plot
figure();
hold on

a = plot(LET, alphaH1437Fifth);
a.LineStyle = 'none';
a.Marker = '^';
a.LineWidth = 1;
blue1 = [0.122 0.475 0.82];
blue2 = [0.333 0.631 0.922];
%a.MarkerFaceColor = [0.122 0.475 0.82];
a.MarkerEdgeColor = blue1;
a.MarkerSize = 6;

a = plot(LET, alphaH1437CubicLET);
a.LineStyle = 'none';
a.Marker = 'pentagram';
red1 = [0.89 0.227 0.071];
red2 = [0.89 0.094 0.071];
a.MarkerEdgeColor = red2;
a.MarkerSize = 8;

a = plot(LET, H1437DirectFit{1,1}{1,1}(1:end-1));
a.LineStyle = 'none';
a.Marker = '.';
a.Color = [0 0 0];
a.MarkerSize = 12;
a.LineWidth = 1;

hxtitle = get(gca,'XLabel');
hytitle = get(gca,'YLabel');
htitle = get(gca,'Title');

set(gca,'TickLabelInterpreter','Latex');
set(hxtitle,'Interpreter','Latex');
set(hytitle,'Interpreter','Latex');
set(htitle,'Interpreter','Latex');

set(hxtitle,'String','LET$_d$ $[\frac{keV}{\mu m}]$');
set(hytitle,'String','$\alpha$');
set(hxtitle,'Fontsize',14); 
set(hytitle,'Fontsize',14); 

leg = legend(["Fifth - f(y)" "Cubic - LET" "Measurement"]);
leg.Position = [0.1512 0.7722 0.2441 0.1376];
leg.Interpreter = 'Latex';
leg.FontSize = 11;

f = gcf;
exportgraphics(f,'H1437_bestAlpha.png','Resolution',300, 'BackgroundColor','white')

%% AGO
filePaths = ["AGO_pristine_fy/1.1.csv","AGO_pristine_fy/3.9.csv","AGO_pristine_fy/6.7.csv","AGO_pristine_fy/11.6.csv","AGO_pristine_fy/17.7.csv","AGO_pristine_fy/22.5.csv", "AGO_SOBP_fy/1.27.csv","AGO_SOBP_fy/3.csv","AGO_SOBP_fy/4.4.csv","AGO_SOBP_fy/13.7.csv","AGO_SOBP_fy/20.9.csv","AGO_SOBP_fy/25.4.csv"];

% AGO - Alphas from directly fitting the data
AGODirectFit = RunScript_Direct_Alpha_SingleBeta("AGO_Direct_Fit", filePaths);
% AGO - Alphas from Fifth BWF model
[LET, alphaAGOFifth] = Retrieve_Alpha_from_model("FifthBWF", [0.925855400923024 0.00170636047359922 0.0509839076360448 -0.00502354125506419 0.000111026508839398 -6.09469774721704e-07 0.0101201662483984], filePaths);
% AGO - Alphas from Fourth LET model
[LET, alphaAGOFourthLET] =  Retrieve_Alpha_from_LET_model("FourthBWF", [0.894193233	0.130716686	-0.013578168	0.000746335	-1.40E-05	0.000139543], filePaths);

%Plot
figure();
hold on

a = plot(LET, alphaAGOFifth);
a.LineStyle = 'none';
a.Marker = '^';
a.LineWidth = 1;
blue1 = [0.122 0.475 0.82];
blue2 = [0.333 0.631 0.922];
a.MarkerEdgeColor = blue1;
a.MarkerSize = 6;

a = plot(LET, alphaAGOFourthLET);
a.LineStyle = 'none';
a.Marker = 'pentagram';
red1 = [0.89 0.227 0.071];
red2 = [0.89 0.094 0.071];
a.MarkerEdgeColor = red2;
a.MarkerSize = 8;

AGODirectPristine = AGODirectFit{1,1}{1,1}(1:6);
LETPristine = LET(1:6);
a = plot(LETPristine, AGODirectPristine);
a.LineStyle = 'none';
a.Marker = '.';
a.Color = [0 0 0];
a.MarkerSize = 12;
a.LineWidth = 1;

AGODirectSOBP = AGODirectFit{1,1}{1,1}(7:end-1);
LETSOBP = LET(7:end);
a = plot(LETSOBP, AGODirectSOBP);
a.LineStyle = 'none';
a.Marker = 'diamond';
a.Color = [0 0 0];
%a.MarkerFaceColor = [0 0 0];
a.MarkerSize = 5;
a.LineWidth = 1;

%Best fit lines I created with CFTool
x1 = linspace(0,30,100);
y1 = (0.0535*x)+0.9153;
a = plot(x1,y1);
a.LineStyle = '--';
a.LineWidth = 0.8;
a.Marker = 'none';
a.Color = [0 0 0];

x2 = linspace(0,30,100);
y2 = (0.0289*x)+0.9970;
a = plot(x2,y2);
a.LineStyle = '--';
a.LineWidth = 0.8;
a.Marker = 'none';
a.Color = [0 0 0];

hxtitle = get(gca,'XLabel');
hytitle = get(gca,'YLabel');
htitle = get(gca,'Title');

set(gca,'TickLabelInterpreter','Latex');
set(hxtitle,'Interpreter','Latex');
set(hytitle,'Interpreter','Latex');
set(htitle,'Interpreter','Latex');

set(hxtitle,'String','LET$_d$ $[\frac{keV}{\mu m}]$');
set(hytitle,'String','$\alpha$');
set(hxtitle,'Fontsize',14); 
set(hytitle,'Fontsize',14); 

leg = legend(["Fifth - f(y)" "Fourth - LET" "Measurement Pristine" "Measurement SOBP"]);
leg.Position = [0.1474    0.7310    0.3421    0.1807];
% leg = legend(["Measurement Pristine" "Measurement SOBP"]);
% leg.Position = [0.1502    0.8153    0.3421    0.0945];
leg.Interpreter = 'Latex';
leg.FontSize = 11;

f = gcf;
% exportgraphics(f,'AGO_withintermdiateBestFit.png','Resolution',300, 'BackgroundColor','white')
% exportgraphics(f,'AGO_bestAlpha_withintermediateBestFit.png','Resolution',300, 'BackgroundColor','white')

%% U87
filePaths = ["U87_pristine_fy/1.1.csv","U87_pristine_fy/3.9.csv","U87_pristine_fy/6.7.csv","U87_pristine_fy/11.6.csv","U87_pristine_fy/17.7.csv","U87_pristine_fy/22.5.csv","U87_SOBP_fy/1.27.csv","U87_SOBP_fy/3.csv","U87_SOBP_fy/4.4.csv","U87_SOBP_fy/13.7.csv","U87_SOBP_fy/20.9.csv","U87_SOBP_fy/25.4.csv"];

% U87 - Alphas from directly fitting the data
U87DirectFit = RunScript_Direct_Alpha_SingleBeta("U87_Direct_Fit", filePaths);
% U87 - Alphas from Linear BWF model
[LET, alphaU87Linear] = Retrieve_Alpha_from_model("LinearBWF", [0.222390093	0.034567961	0.04023814], filePaths);
% U87 - Alphas from Fourth LET model
[LET, alphaU87LinearLET] =  Retrieve_Alpha_from_LET_model("LinearBWF", [0.247948161	0.018271588	0.040238499], filePaths);

%Plot
figure();
hold on

a = plot(LET, alphaU87Linear);
a.LineStyle = 'none';
a.Marker = '^';
a.LineWidth = 1;
blue1 = [0.122 0.475 0.82];
blue2 = [0.333 0.631 0.922];
a.MarkerEdgeColor = blue1;
a.MarkerSize = 6;

a = plot(LET, alphaU87LinearLET);
a.LineStyle = 'none';
a.Marker = 'pentagram';
red1 = [0.89 0.227 0.071];
red2 = [0.89 0.094 0.071];
a.MarkerEdgeColor = red2;
a.MarkerSize = 8;

U87DirectPristine = U87DirectFit{1,1}{1,1}(1:6);
LETPristine = LET(1:6);
a = plot(LETPristine, U87DirectPristine);
a.LineStyle = 'none';
a.Marker = '.';
a.Color = [0 0 0];
a.MarkerSize = 12;
a.LineWidth = 1;

U87DirectSOBP = U87DirectFit{1,1}{1,1}(7:end-1);
LETSOBP = LET(7:end);
a = plot(LETSOBP, U87DirectSOBP);
a.LineStyle = 'none';
a.Marker = 'diamond';
a.Color = [0 0 0];
%a.MarkerFaceColor = [0 0 0];
a.MarkerSize = 5;
a.LineWidth = 1;

%Best fit lines I created with CFTool
x1 = linspace(0,30,100);
y1 = (0.0162*x)+0.2479;
a = plot(x1,y1);
a.LineStyle = '--';
a.LineWidth = 0.8;
a.Marker = 'none';
a.Color = [0 0 0];

x2 = linspace(0,30,100);
y2 = (0.0218*x)+0.2334;
a = plot(x2,y2);
a.LineStyle = '--';
a.LineWidth = 0.8;
a.Marker = 'none';
a.Color = [0 0 0];

hxtitle = get(gca,'XLabel');
hytitle = get(gca,'YLabel');
htitle = get(gca,'Title');

set(gca,'TickLabelInterpreter','Latex');
set(hxtitle,'Interpreter','Latex');
set(hytitle,'Interpreter','Latex');
set(htitle,'Interpreter','Latex');

set(hxtitle,'String','LET$_d$ $[\frac{keV}{\mu m}]$');
set(hytitle,'String','$\alpha$');
set(hxtitle,'Fontsize',14); 
set(hytitle,'Fontsize',14); 

leg = legend(["Linear - f(y)" "Linear - LET" "Measurement Pristine" "Measurement SOBP"]);
leg.Position = [0.1474    0.7310    0.3421    0.1807];
% leg = legend(["Measurement Pristine" "Measurement SOBP"]);
% leg.Position = [0.1502    0.8153    0.3421    0.0945];
leg.Interpreter = 'Latex';
leg.FontSize = 11;

f = gcf;
% exportgraphics(f,'U87_bestaAlpha_withintermediateBestFit.png','Resolution',300, 'BackgroundColor','white')
% exportgraphics(f,'U87_withIntermediateBestFit.png','Resolution',300, 'BackgroundColor','white')

