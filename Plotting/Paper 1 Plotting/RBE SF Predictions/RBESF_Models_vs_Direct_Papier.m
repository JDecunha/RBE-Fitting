%% initialize

% f = figure();
% f.Position = [1073 642 932 408];
% tiledlayout(1,2);

%% H460

sf = 0.1;

filePaths = ["H460_fy/a.csv", "H460_fy/b.csv" , "H460_fy/c.csv", "H460_fy/d.csv", "H460_fy/e.csv", "H460_fy/f.csv", "H460_fy/g.csv", "H460_fy/h.csv", "H460_fy/i.csv", "H460_fy/j.csv" , "H460_fy/k.csv" , "H460_fy/l.csv"];


% H460 - RBEs from Fifth BWF model
[LET, RBEH460Fifth] = DetermineDoseFor_RBE_SF("FifthBWF", [0.206743144	0.001179251	0.0018071	6.62E-05	-4.12E-05	5.53E-07	0.114748244], filePaths, sf);
% H460 - RBEs from Cubic LET model
[LET, RBEH460CubicLET] =  DetermineDoseFor_RBE_SF_LET("CubicBWF", [0.193296021	0.016719377	-0.00392727	0.000404675	0.115027692], filePaths, sf);
% H460 - RBEs from directly fitting the data
H460DirectFit = RunScript_Direct_Alpha_SingleBeta("H460_Direct_Fit", filePaths);
H460RBESF_Direct = [];
for i = 1:(size(H460DirectFit{1,1}{1,1})-1)
    H460RBESF_Direct(i) = DetermineDoseFor_RBE_SF_alphabeta(H460DirectFit{1,1}{1,1}(i), H460DirectFit{1,1}{1,1}(end), sf);
end

% Calculating and plotting McNamara RBE
LETsforMcnamara = linspace(0,20,100);
McNamaraRBE = zeros(size(LETsforMcnamara));
ReferenceDose = DetermineDoseFor_RBE_SF_alphabeta(0.29,0.083,0.1); % Think about this more. I think our dose reference should be for photons.
% It's saying, for photons, how much dose is needed to get 10% surviving fraction at LET = 0?
% What we need to do next is normalize McNamara relative to the other curves
% ReferenceDose = DetermineDoseFor_RBE_SF_alphabeta(0.221413900164166,0.117189794443418,0.1);
for i = 1:size(McNamaraRBE,2)
    McNamaraRBE(i) = Find_McNamara_RBESF((0.290/0.083),LETsforMcnamara(i),ReferenceDose);
end

% Normalize all three to get RBE
[normVal, idx] = max(H460RBESF_Direct);
H460RBESF_Direct = normVal./H460RBESF_Direct;
RBEH460Fifth = normVal./RBEH460Fifth;
RBEH460CubicLET = normVal./RBEH460CubicLET;

% How would we normalize McNamara? 
% Find the minimum LET from the proton data (where we normalize RBE = 1)
% Find the closest McNamara RBE to the point
% Normalize relative to that
LET_at_Min_RBE = LET(idx);
diffBetweenLET = abs(LETsforMcnamara - LET_at_Min_RBE);
[~, McNamaraNormIndex] = min(diffBetweenLET);
McNamaraRBE = McNamaraRBE./McNamaraRBE(McNamaraNormIndex);

%Plotfigure()
% tiledlayout(2,2);
% nexttile
f = figure();
f.Position = [1440 809 403 429];

hold on


a = plot(LET, RBEH460Fifth);
a.LineStyle = 'none';
a.Marker = 'diamond';
a.LineWidth = 1;
blue1 = [0.122 0.475 0.82];
blue2 = [0.333 0.631 0.922];
a.MarkerEdgeColor = blue1;
a.MarkerSize = 6;

a = plot(LET, RBEH460CubicLET);
a.LineStyle = 'none';
a.Marker = 'pentagram';
red1 = [0.89 0.227 0.071];
red2 = [0.89 0.094 0.071];
a.MarkerEdgeColor = red2;
a.MarkerSize = 9;

a = plot(LETsforMcnamara,McNamaraRBE);
a.LineStyle = '-';
a.Marker = 'none';
% a.Color = [0.063, 0.38, 0.11];
a.Color = [0.09, 0.459, 0.051];
%a.MarkerSize = 12;
a.LineWidth = 1.3;

a = plot(LET, H460RBESF_Direct);
a.LineStyle = 'none';
a.Marker = '^';
a.Color = [0 0 0];
a.MarkerSize = 4;
a.MarkerFaceColor = [0 0 0];
a.LineWidth = 1;

a = plot(0,0);
a.LineStyle = 'none';
a.LineStyle = 'none';
a.Marker = 'v';
a.Color = [0 0 0];
a.MarkerFaceColor = [0 0 0];
a.MarkerSize = 4;
a.LineWidth = 1;

hxtitle = get(gca,'XLabel');
hytitle = get(gca,'YLabel');
htitle = get(gca,'Title');

set(gca,'TickLabelInterpreter','Latex');
set(hxtitle,'Interpreter','Latex');
set(hytitle,'Interpreter','Latex');
set(htitle,'Interpreter','Latex');

set(hxtitle,'String','LET$_d$ $[\frac{keV}{\mu m}]$');
set(hytitle,'String','RBE (SF = 0.1)');
set(hxtitle,'Fontsize',18); 
set(hytitle,'Fontsize',18); 

leg = legend(["f(y)" "LET" "McNamara" "Measurement (Pristine)" "Measurement (SOBP)"]);
leg.Position = [0.1626 0.6721 0.5380 0.2378];
leg.Interpreter = 'Latex';
leg.FontSize = 12;
set(gca,'YLim',[0.9 3.5]);

% f = gcf;
exportgraphics(f,'H460_RBESF01.png','Resolution',300, 'BackgroundColor','white')

%% H1437
filePaths = ["H1437_fy/a.csv", "H1437_fy/b.csv" , "H1437_fy/c.csv", "H1437_fy/d.csv", "H1437_fy/e.csv", "H1437_fy/f.csv", "H1437_fy/g.csv", "H1437_fy/h.csv", "H1437_fy/i.csv", "H1437_fy/j.csv" , "H1437_fy/k.csv" , "H1437_fy/l.csv"];

% H1437 - RBEs from Fifth BWF model
[LET, RBEH1437Fifth] = DetermineDoseFor_RBE_SF("FifthBWF", [0.012524104	0.041697013	-5.63E-07	-0.000397899	-6.38E-14	9.40E-08	0.03475491], filePaths, sf);
% H1437 - RBEs from Cubic LET model
[LET, RBEH1437CubicLET] =  DetermineDoseFor_RBE_SF_LET("CubicBWF", [0.012597029	0.038322427	-0.004810266	0.000263291	0.035104747], filePaths, sf);

% H460 - RBEs from directly fitting the data
H1437DirectFit = RunScript_Direct_Alpha_SingleBeta("H1437_Direct_Fit", filePaths);
H1437RBESF_Direct = [];
for i = 1:(size(H1437DirectFit{1,1}{1,1})-1)
    H1437RBESF_Direct(i) = DetermineDoseFor_RBE_SF_alphabeta(H1437DirectFit{1,1}{1,1}(i), H1437DirectFit{1,1}{1,1}(end), sf);
end

% Calculating and plotting McNamara RBE
LETsforMcnamara = linspace(0,20,100);
McNamaraRBE = zeros(size(LETsforMcnamara));
ReferenceDose = DetermineDoseFor_RBE_SF_alphabeta(0.05,0.041,0.1);
for i = 1:size(McNamaraRBE,2)
    McNamaraRBE(i) = Find_McNamara_RBESF((0.05/0.041),LETsforMcnamara(i),ReferenceDose);
end

%Normalize all three to get RBE
[normVal, idx] = max(H1437RBESF_Direct);
H1437RBESF_Direct = normVal./H1437RBESF_Direct;
RBEH1437Fifth = normVal./RBEH1437Fifth;
RBEH1437CubicLET = normVal./RBEH1437CubicLET;

% How would we normalize McNamara? 
% Find the minimum LET from the proton data (where we normalize RBE = 1)
% Find the closest McNamara RBE to the point
% Normalize relative to that
LET_at_Min_RBE = LET(idx);
diffBetweenLET = abs(LETsforMcnamara - LET_at_Min_RBE);
[~, McNamaraNormIndex] = min(diffBetweenLET);
McNamaraRBE = McNamaraRBE./McNamaraRBE(McNamaraNormIndex);

%Plot
% figure();
f = figure();
f.Position = [1440 809 403 429];
hold on

a = plot(LET, RBEH1437Fifth);
a.LineStyle = 'none';
a.Marker = '^';
a.LineWidth = 1;
blue1 = [0.122 0.475 0.82];
blue2 = [0.333 0.631 0.922];
%a.MarkerFaceColor = [0.122 0.475 0.82];
a.MarkerEdgeColor = blue1;
a.MarkerSize = 6;

a = plot(LET, RBEH1437CubicLET);
a.LineStyle = 'none';
a.Marker = 'pentagram';
red1 = [0.89 0.227 0.071];
red2 = [0.89 0.094 0.071];
a.MarkerEdgeColor = red2;
a.MarkerSize = 8;

a = plot(LET, H1437RBESF_Direct);
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
set(hytitle,'String','RBE (SF = 0.1)');
set(hxtitle,'Fontsize',18); 
set(hytitle,'Fontsize',18); 

a = plot(LETsforMcnamara,McNamaraRBE);
a.LineStyle = '-';
a.Marker = 'none';
% a.Color = [0.063, 0.38, 0.11];
a.Color = [0.09, 0.459, 0.051];
%a.MarkerSize = 12;
a.LineWidth = 1.3;

% leg = legend(["f(y)" "LET" "Measurement" "McNamara"]);
% leg.Position = [0.1634 0.7157 0.3585 0.1918];
% leg.Interpreter = 'Latex';
% leg.FontSize = 12;
set(gca,'YLim',[0.9 3.5]);

% f = gcf;
exportgraphics(f,'H1437_RBESF01.png','Resolution',300, 'BackgroundColor','white')

%% AGO
filePaths = ["AGO_pristine_fy/1.1.csv","AGO_pristine_fy/3.9.csv","AGO_pristine_fy/6.7.csv","AGO_pristine_fy/11.6.csv","AGO_pristine_fy/17.7.csv","AGO_pristine_fy/22.5.csv", "AGO_SOBP_fy/1.27.csv","AGO_SOBP_fy/3.csv","AGO_SOBP_fy/4.4.csv","AGO_SOBP_fy/13.7.csv","AGO_SOBP_fy/20.9.csv","AGO_SOBP_fy/25.4.csv"];

% AGO - RBEs from Fifth BWF model
[LET, RBEAGOFifth] = DetermineDoseFor_RBE_SF("FifthBWF", [0.925855400923024 0.00170636047359922 0.0509839076360448 -0.00502354125506419 0.000111026508839398 -6.09469774721704e-07 0.0101201662483984], filePaths, sf);
% AGO - RBEs from Fourth LET model
[LET, RBEAGOFourthLET] =  DetermineDoseFor_RBE_SF_LET("FourthBWF", [0.894193233	0.130716686	-0.013578168	0.000746335	-1.40E-05	0.000139543], filePaths, sf);

% H460 - RBEs from directly fitting the data
AGODirectFit = RunScript_Direct_Alpha_SingleBeta("AGO_Direct_Fit", filePaths);
AGORBESF_Direct = [];
for i = 1:(size(AGODirectFit{1,1}{1,1})-1)
    AGORBESF_Direct(i) = DetermineDoseFor_RBE_SF_alphabeta(AGODirectFit{1,1}{1,1}(i), AGODirectFit{1,1}{1,1}(end), sf);
end

%Normalize all three to get RBE
[normVal, idx] = max(AGORBESF_Direct);
AGORBESF_Direct = normVal./AGORBESF_Direct;
RBEAGOFifth = normVal./RBEAGOFifth;
RBEAGOFourthLET = normVal./RBEAGOFourthLET;

% Calculating and plotting McNamara RBE
LETsforMcnamara = linspace(0,30,100);
McNamaraRBE = zeros(size(LETsforMcnamara));
ReferenceDose = DetermineDoseFor_RBE_SF_alphabeta(0.54,0.062,0.1);
for i = 1:size(McNamaraRBE,2)
    McNamaraRBE(i) = Find_McNamara_RBESF((0.54/0.062),LETsforMcnamara(i),ReferenceDose);
end

% How would we normalize McNamara? 
% Find the minimum LET from the proton data (where we normalize RBE = 1)
% Find the closest McNamara RBE to the point
% Normalize relative to that
LET_at_Min_RBE = LET(idx);
diffBetweenLET = abs(LETsforMcnamara - LET_at_Min_RBE);
[~, McNamaraNormIndex] = min(diffBetweenLET);
McNamaraRBE = McNamaraRBE./McNamaraRBE(McNamaraNormIndex);


% Plot
f = figure();
f.Position = [1440 809 403 429];
% nexttile
hold on

AGODirectPristine = AGORBESF_Direct(1:6);
LETPristine = LET(1:6);
a = plot(LETPristine, AGODirectPristine);
a.LineStyle = 'none';
a.Marker = '^';
a.Color = [0 0 0];
a.MarkerSize = 4;
a.MarkerFaceColor = [0 0 0];
a.LineWidth = 1;

AGODirectSOBP = AGORBESF_Direct(7:end);
LETSOBP = LET(7:end);
a = plot(LETSOBP, AGODirectSOBP);
a.LineStyle = 'none';
a.Marker = 'v';
a.Color = [0 0 0];
a.MarkerFaceColor = [0 0 0];
a.MarkerSize = 4;
a.LineWidth = 1;

a = plot(LET, RBEAGOFifth);
a.LineStyle = 'none';
a.Marker = 'diamond';
a.LineWidth = 1;
blue1 = [0.122 0.475 0.82];
blue2 = [0.333 0.631 0.922];
a.MarkerEdgeColor = blue1;
% a.MarkerFaceColor = blue1;
a.MarkerSize = 6;

a = plot(LET, RBEAGOFourthLET);
a.LineStyle = 'none';
a.Marker = 'pentagram';
red1 = [0.89 0.227 0.071];
red2 = [0.89 0.094 0.071];
a.MarkerEdgeColor = red2;
a.MarkerSize = 9;

a = plot(LETsforMcnamara,McNamaraRBE);
a.LineStyle = '-';
a.Marker = 'none';
% a.Color = [0.063, 0.38, 0.11];
a.Color = [0.09, 0.459, 0.051];
%a.MarkerSize = 12;
a.LineWidth = 1;

%Best fit lines I created with CFTool
x = linspace(0,30,100);
y1 = (0.0517*x)+0.9551;
a = plot(x,y1);
a.LineStyle = '--';
a.LineWidth = 1;
a.Marker = 'none';
a.Color = [0 0 0];

y2 = (0.0277*x)+1.0357;
a = plot(x,y2);
a.LineStyle = '--';
a.LineWidth = 1.2;
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
set(hytitle,'String','RBE (SF = 0.1)');
set(hxtitle,'Fontsize',18); 
set(hytitle,'Fontsize',18); 

set(gca,'YLim',[0.9 2.3]);

% leg = legend(["Measurement (Pristine)" "Measurement (SOBP)" "f(y)" "LET" "McNamara" ]);
% leg.Position = [0.0141 0.7440 0.5380 0.2378];
% % leg.Position = [0.5388    0.1653    0.3421    0.1807];
% 
% % leg = legend(["Measurement Pristine" "Measurement SOBP"]);
% % leg.Position = [0.1502    0.8153    0.3421    0.0945];
% leg.Interpreter = 'Latex';
% leg.FontSize = 12;

% f = gcf;
exportgraphics(f,'AGO_RBE01SF_newaxis.png','Resolution',300, 'BackgroundColor','white')
% exportgraphics(f,'AGO_bestRBE_withintermediateBestFit.png','Resolution',300, 'BackgroundColor','white')

%% U87
filePaths = ["U87_pristine_fy/1.1.csv","U87_pristine_fy/3.9.csv","U87_pristine_fy/6.7.csv","U87_pristine_fy/11.6.csv","U87_pristine_fy/17.7.csv","U87_pristine_fy/22.5.csv","U87_SOBP_fy/1.27.csv","U87_SOBP_fy/3.csv","U87_SOBP_fy/4.4.csv","U87_SOBP_fy/13.7.csv","U87_SOBP_fy/20.9.csv","U87_SOBP_fy/25.4.csv"];

% U87 - RBEs from Linear BWF model
[LET, RBEU87Linear] = DetermineDoseFor_RBE_SF("LinearBWF", [0.222390093	0.034567961	0.04023814], filePaths, sf);
% U87 - RBEs from Fourth LET model
[LET, RBEU87LinearLET] =  DetermineDoseFor_RBE_SF_LET("LinearBWF", [0.247948161	0.018271588	0.040238499], filePaths, sf);

% H460 - RBEs from directly fitting the data
U87DirectFit = RunScript_Direct_Alpha_SingleBeta("U87_Direct_Fit", filePaths);
U87RBESF_Direct = [];
for i = 1:(size(U87DirectFit{1,1}{1,1})-1)
    U87RBESF_Direct(i) = DetermineDoseFor_RBE_SF_alphabeta(U87DirectFit{1,1}{1,1}(i), U87DirectFit{1,1}{1,1}(end), sf);
end

% Normalize all three to get RBE
% What is this normalization doing? It's taking the highest dose needed, to 
[normVal, idx] = max(U87RBESF_Direct);
U87RBESF_Direct = normVal./U87RBESF_Direct;
RBEU87Linear = normVal./RBEU87Linear;
RBEU87LinearLET = normVal./RBEU87LinearLET;

% Calculating and plotting McNamara RBE
LETsforMcnamara = linspace(0,30,100);
McNamaraRBE = zeros(size(LETsforMcnamara));
ReferenceDose = DetermineDoseFor_RBE_SF_alphabeta(0.264028849279883,0.0402380724759335,0.1);
for i = 1:size(McNamaraRBE,2)
    McNamaraRBE(i) = Find_McNamara_RBESF((0.11/0.06),LETsforMcnamara(i),normVal);
end

% How would we normalize McNamara? 
% Find the minimum LET from the proton data (where we normalize RBE = 1)
% Find the closest McNamara RBE to the point
% Normalize relative to that
LET_at_Min_RBE = LET(idx);
diffBetweenLET = abs(LETsforMcnamara - LET_at_Min_RBE);
[~, McNamaraNormIndex] = min(diffBetweenLET);
McNamaraRBE = McNamaraRBE./McNamaraRBE(McNamaraNormIndex);

%Plot
f = figure();
f.Position = [1440 809 403 429];
% nexttile
hold on

U87DirectPristine = U87RBESF_Direct(1:6);
LETPristine = LET(1:6);
a = plot(LETPristine, U87DirectPristine);
a.LineStyle = 'none';
a.Marker = '^';
a.Color = [0 0 0];
a.MarkerSize = 4;
a.MarkerFaceColor = [0 0 0];
a.LineWidth = 1;

U87DirectSOBP = U87RBESF_Direct(7:end);
LETSOBP = LET(7:end);
a = plot(LETSOBP, U87DirectSOBP);
a.LineStyle = 'none';
a.Marker = 'v';
a.Color = [0 0 0];
a.MarkerFaceColor = [0 0 0];
a.MarkerSize = 4;
a.LineWidth = 1;

a = plot(LET, RBEU87Linear);
a.LineStyle = 'none';
a.Marker = 'diamond';
a.LineWidth = 1;
blue1 = [0.122 0.475 0.82];
blue2 = [0.333 0.631 0.922];
a.MarkerEdgeColor = blue1;
a.MarkerSize = 6;

a = plot(LET, RBEU87LinearLET);
a.LineStyle = 'none';
a.Marker = 'pentagram';
red1 = [0.89 0.227 0.071];
red2 = [0.89 0.094 0.071];
a.MarkerEdgeColor = red2;
a.MarkerSize = 9;

a = plot(LETsforMcnamara,McNamaraRBE);
a.LineStyle = '-';
a.Marker = 'none';
% a.Color = [0.063, 0.38, 0.11];
a.Color = [0.09, 0.459, 0.051];
%a.MarkerSize = 12;
a.LineWidth = 1.3;



%Best fit lines I created with CFTool
x1 = linspace(0,30,100);
y1 = (0.0384*x)+0.9441;
a = plot(x1,y1);
a.LineStyle = '--';
a.LineWidth = 0.8;
a.Marker = 'none';
a.Color = [0 0 0];

x2 = linspace(0,30,100);
y2 = (0.0283*x)+0.9739;
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
set(hytitle,'String','RBE (SF = 0.1)');
set(hxtitle,'Fontsize',18); 
set(hytitle,'Fontsize',18); 

% leg = legend(["Measurement (Pristine)" "Measurement (SOBP)" "f(y)" "LET" "McNamara"]);
% leg.Position = [0.5229    0.1452    0.3625    0.2238];
% % leg = legend(["Measurement Pristine" "Measurement SOBP"]);
% % leg.Position = [0.1502    0.8153    0.3421    0.0945];
% leg.Interpreter = 'Latex';
% leg.FontSize = 12;
% set(gca,'YLim',[0.9 2]);
set(gca,'YLim',[0.9 2]);

f = gcf;
exportgraphics(f,'U87_RBE01SF.png','Resolution',300, 'BackgroundColor','white')
% exportgraphics(f,'U87_withIntermediateBestFit.png','Resolution',300, 'BackgroundColor','white')

% 
% 
% %% H460
% 
% sf = 0.1;
% 
% filePaths = ["H460_fy/a.csv", "H460_fy/b.csv" , "H460_fy/c.csv", "H460_fy/d.csv", "H460_fy/e.csv", "H460_fy/f.csv", "H460_fy/g.csv", "H460_fy/h.csv", "H460_fy/i.csv", "H460_fy/j.csv" , "H460_fy/k.csv" , "H460_fy/l.csv"];
% 
% 
% % H460 - RBEs from Fifth BWF model
% [LET, RBEH460Fifth] = DetermineDoseFor_RBE_SF("FifthBWF", [0.206743144	0.001179251	0.0018071	6.62E-05	-4.12E-05	5.53E-07	0.114748244], filePaths, sf);
% % H460 - RBEs from Cubic LET model
% [LET, RBEH460CubicLET] =  DetermineDoseFor_RBE_SF_LET("CubicBWF", [0.193296021	0.016719377	-0.00392727	0.000404675	0.115027692], filePaths, sf);
% % H460 - RBEs from directly fitting the data
% H460DirectFit = RunScript_Direct_Alpha_SingleBeta("H460_Direct_Fit", filePaths);
% H460RBESF_Direct = [];
% for i = 1:(size(H460DirectFit{1,1}{1,1})-1)
%     H460RBESF_Direct(i) = DetermineDoseFor_RBE_SF_alphabeta(H460DirectFit{1,1}{1,1}(i), H460DirectFit{1,1}{1,1}(end), sf);
% end
% 
% % Calculating and plotting McNamara RBE
% LETsforMcnamara = linspace(0,20,100);
% McNamaraRBE = zeros(size(LETsforMcnamara));
% ReferenceDose = DetermineDoseFor_RBE_SF_alphabeta(0.29,0.083,0.1); % Think about this more. I think our dose reference should be for photons.
% % It's saying, for photons, how much dose is needed to get 10% surviving fraction at LET = 0?
% % What we need to do next is normalize McNamara relative to the other curves
% % ReferenceDose = DetermineDoseFor_RBE_SF_alphabeta(0.221413900164166,0.117189794443418,0.1);
% for i = 1:size(McNamaraRBE,2)
%     McNamaraRBE(i) = Find_McNamara_RBESF((0.290/0.083),LETsforMcnamara(i),ReferenceDose);
% end
% 
% % Normalize all three to get RBE
% [normVal, idx] = max(H460RBESF_Direct);
% H460RBESF_Direct = normVal./H460RBESF_Direct;
% RBEH460Fifth = normVal./RBEH460Fifth;
% RBEH460CubicLET = normVal./RBEH460CubicLET;
% 
% % How would we normalize McNamara? 
% % Find the minimum LET from the proton data (where we normalize RBE = 1)
% % Find the closest McNamara RBE to the point
% % Normalize relative to that
% LET_at_Min_RBE = LET(idx);
% diffBetweenLET = abs(LETsforMcnamara - LET_at_Min_RBE);
% [~, McNamaraNormIndex] = min(diffBetweenLET);
% McNamaraRBE = McNamaraRBE./McNamaraRBE(McNamaraNormIndex);
% 
% %Plot
% % tiledlayout(2,2)
% hold off
% 
% a = plot(LET, RBEH460Fifth);
% a.LineStyle = 'none';
% a.Marker = '^';
% a.LineWidth = 1;
% blue1 = [0.122 0.475 0.82];
% blue2 = [0.333 0.631 0.922];
% %a.MarkerFaceColor = [0.122 0.475 0.82];
% a.MarkerEdgeColor = blue1;
% a.MarkerSize = 6;
% 
% hold on
% 
% a = plot(LET, RBEH460CubicLET);
% a.LineStyle = 'none';
% a.Marker = 'pentagram';
% red1 = [0.89 0.227 0.071];
% red2 = [0.89 0.094 0.071];
% a.MarkerEdgeColor = red2;
% a.MarkerSize = 8;
% 
% a = plot(LET, H460RBESF_Direct);
% a.LineStyle = 'none';
% a.Marker = '.';
% a.Color = [0 0 0];
% a.MarkerSize = 12;
% a.LineWidth = 1;
% 
% a = plot(LETsforMcnamara,McNamaraRBE);
% a.LineStyle = ':';
% a.Marker = 'none';
% a.Color = [0.063, 0.38, 0.11];
% %a.MarkerSize = 12;
% a.LineWidth = 1.6;
% 
% hxtitle = get(gca,'XLabel');
% hytitle = get(gca,'YLabel');
% htitle = get(gca,'Title');
% 
% set(gca,'TickLabelInterpreter','Latex');
% set(hxtitle,'Interpreter','Latex');
% set(hytitle,'Interpreter','Latex');
% set(htitle,'Interpreter','Latex');
% 
% set(hxtitle,'String','LET$_d$ $[\frac{keV}{\mu m}]$');
% set(hytitle,'String','RBE (SF = 0.1)');
% set(hxtitle,'Fontsize',14); 
% set(hytitle,'Fontsize',14); 
% 
% set(gca,'YLim',[0 3.5]);
% 
% leg = legend(["Fifth - f(y)" "Cubic - LET" "Measurement" "McNamara"]);
% leg.Position = [0.1512 0.7722 0.2441 0.1376];
% leg.Interpreter = 'Latex';
% leg.FontSize = 11;
% 
% % f = gcf;
% % exportgraphics(f,'H460_RBESF01.png','Resolution',300, 'BackgroundColor','white')
% 
% %% H1437
% filePaths = ["H1437_fy/a.csv", "H1437_fy/b.csv" , "H1437_fy/c.csv", "H1437_fy/d.csv", "H1437_fy/e.csv", "H1437_fy/f.csv", "H1437_fy/g.csv", "H1437_fy/h.csv", "H1437_fy/i.csv", "H1437_fy/j.csv" , "H1437_fy/k.csv" , "H1437_fy/l.csv"];
% 
% % H1437 - RBEs from Fifth BWF model
% [LET, RBEH1437Fifth] = DetermineDoseFor_RBE_SF("FifthBWF", [0.012524104	0.041697013	-5.63E-07	-0.000397899	-6.38E-14	9.40E-08	0.03475491], filePaths, sf);
% % H1437 - RBEs from Cubic LET model
% [LET, RBEH1437CubicLET] =  DetermineDoseFor_RBE_SF_LET("CubicBWF", [0.012597029	0.038322427	-0.004810266	0.000263291	0.035104747], filePaths, sf);
% 
% % H460 - RBEs from directly fitting the data
% H1437DirectFit = RunScript_Direct_Alpha_SingleBeta("H1437_Direct_Fit", filePaths);
% H1437RBESF_Direct = [];
% for i = 1:(size(H1437DirectFit{1,1}{1,1})-1)
%     H1437RBESF_Direct(i) = DetermineDoseFor_RBE_SF_alphabeta(H1437DirectFit{1,1}{1,1}(i), H1437DirectFit{1,1}{1,1}(end), sf);
% end
% 
% % Calculating and plotting McNamara RBE
% LETsforMcnamara = linspace(0,20,100);
% McNamaraRBE = zeros(size(LETsforMcnamara));
% ReferenceDose = DetermineDoseFor_RBE_SF_alphabeta(0.05,0.041,0.1);
% for i = 1:size(McNamaraRBE,2)
%     McNamaraRBE(i) = Find_McNamara_RBESF((0.05/0.041),LETsforMcnamara(i),ReferenceDose);
% end
% 
% %Normalize all three to get RBE
% [normVal, idx] = max(H1437RBESF_Direct);
% H1437RBESF_Direct = normVal./H1437RBESF_Direct;
% RBEH1437Fifth = normVal./RBEH1437Fifth;
% RBEH1437CubicLET = normVal./RBEH1437CubicLET;
% 
% % How would we normalize McNamara? 
% % Find the minimum LET from the proton data (where we normalize RBE = 1)
% % Find the closest McNamara RBE to the point
% % Normalize relative to that
% LET_at_Min_RBE = LET(idx);
% diffBetweenLET = abs(LETsforMcnamara - LET_at_Min_RBE);
% [~, McNamaraNormIndex] = min(diffBetweenLET);
% McNamaraRBE = McNamaraRBE./McNamaraRBE(McNamaraNormIndex);
% 
% %Plot
% figure();
% hold on
% 
% a = plot(LET, RBEH1437Fifth);
% a.LineStyle = 'none';
% a.Marker = '^';
% a.LineWidth = 1;
% blue1 = [0.122 0.475 0.82];
% blue2 = [0.333 0.631 0.922];
% %a.MarkerFaceColor = [0.122 0.475 0.82];
% a.MarkerEdgeColor = blue1;
% a.MarkerSize = 6;
% 
% a = plot(LET, RBEH1437CubicLET);
% a.LineStyle = 'none';
% a.Marker = 'pentagram';
% red1 = [0.89 0.227 0.071];
% red2 = [0.89 0.094 0.071];
% a.MarkerEdgeColor = red2;
% a.MarkerSize = 8;
% 
% a = plot(LET, H1437RBESF_Direct);
% a.LineStyle = 'none';
% a.Marker = '.';
% a.Color = [0 0 0];
% a.MarkerSize = 12;
% a.LineWidth = 1;
% 
% hxtitle = get(gca,'XLabel');
% hytitle = get(gca,'YLabel');
% htitle = get(gca,'Title');
% 
% set(gca,'TickLabelInterpreter','Latex');
% set(hxtitle,'Interpreter','Latex');
% set(hytitle,'Interpreter','Latex');
% set(htitle,'Interpreter','Latex');
% 
% set(hxtitle,'String','LET$_d$ $[\frac{keV}{\mu m}]$');
% set(hytitle,'String','RBE (SF = 0.1)');
% set(hxtitle,'Fontsize',14); 
% set(hytitle,'Fontsize',14); 
% 
% set(gca,'YLim',[0 3.5]);
% 
% a = plot(LETsforMcnamara,McNamaraRBE);
% a.LineStyle = ':';
% a.Marker = 'none';
% a.Color = [0.063, 0.38, 0.11];
% %a.MarkerSize = 12;
% a.LineWidth = 1.6;
% 
% leg = legend(["Fifth - f(y)" "Cubic - LET" "Measurement" "McNamara"]);
% leg.Position = [0.1512 0.7722 0.2441 0.1376];
% leg.Interpreter = 'Latex';
% leg.FontSize = 11;
% 
% 
% 
% % f = gcf;
% % exportgraphics(f,'H1437_RBESF01.png','Resolution',300, 'BackgroundColor','white')
% 
% %% AGO
% filePaths = ["AGO_pristine_fy/1.1.csv","AGO_pristine_fy/3.9.csv","AGO_pristine_fy/6.7.csv","AGO_pristine_fy/11.6.csv","AGO_pristine_fy/17.7.csv","AGO_pristine_fy/22.5.csv", "AGO_SOBP_fy/1.27.csv","AGO_SOBP_fy/3.csv","AGO_SOBP_fy/4.4.csv","AGO_SOBP_fy/13.7.csv","AGO_SOBP_fy/20.9.csv","AGO_SOBP_fy/25.4.csv"];
% 
% % AGO - RBEs from Fifth BWF model
% [LET, RBEAGOFifth] = DetermineDoseFor_RBE_SF("FifthBWF", [0.925855400923024 0.00170636047359922 0.0509839076360448 -0.00502354125506419 0.000111026508839398 -6.09469774721704e-07 0.0101201662483984], filePaths, sf);
% % AGO - RBEs from Fourth LET model
% [LET, RBEAGOFourthLET] =  DetermineDoseFor_RBE_SF_LET("FourthBWF", [0.894193233	0.130716686	-0.013578168	0.000746335	-1.40E-05	0.000139543], filePaths, sf);
% 
% % H460 - RBEs from directly fitting the data
% AGODirectFit = RunScript_Direct_Alpha_SingleBeta("AGO_Direct_Fit", filePaths);
% AGORBESF_Direct = [];
% for i = 1:(size(AGODirectFit{1,1}{1,1})-1)
%     AGORBESF_Direct(i) = DetermineDoseFor_RBE_SF_alphabeta(AGODirectFit{1,1}{1,1}(i), AGODirectFit{1,1}{1,1}(end), sf);
% end
% 
% %Normalize all three to get RBE
% [normVal, idx] = max(AGORBESF_Direct);
% AGORBESF_Direct = normVal./AGORBESF_Direct;
% RBEAGOFifth = normVal./RBEAGOFifth;
% RBEAGOFourthLET = normVal./RBEAGOFourthLET;
% 
% % Calculating and plotting McNamara RBE
% LETsforMcnamara = linspace(0,30,100);
% McNamaraRBE = zeros(size(LETsforMcnamara));
% ReferenceDose = DetermineDoseFor_RBE_SF_alphabeta(0.54,0.062,0.1);
% for i = 1:size(McNamaraRBE,2)
%     McNamaraRBE(i) = Find_McNamara_RBESF((0.54/0.062),LETsforMcnamara(i),ReferenceDose);
% end
% 
% % How would we normalize McNamara? 
% % Find the minimum LET from the proton data (where we normalize RBE = 1)
% % Find the closest McNamara RBE to the point
% % Normalize relative to that
% LET_at_Min_RBE = LET(idx);
% diffBetweenLET = abs(LETsforMcnamara - LET_at_Min_RBE);
% [~, McNamaraNormIndex] = min(diffBetweenLET);
% McNamaraRBE = McNamaraRBE./McNamaraRBE(McNamaraNormIndex);
% 
% 
% %% Plot
% figure();
% hold on
% 
% AGODirectPristine = AGORBESF_Direct(1:6);
% LETPristine = LET(1:6);
% a = plot(LETPristine, AGODirectPristine);
% a.LineStyle = 'none';
% a.Marker = '^';
% a.Color = [0 0 0];
% a.MarkerSize = 4;
% a.MarkerFaceColor = [0 0 0];
% a.LineWidth = 1;
% 
% AGODirectSOBP = AGORBESF_Direct(7:end);
% LETSOBP = LET(7:end);
% a = plot(LETSOBP, AGODirectSOBP);
% a.LineStyle = 'none';
% a.Marker = 'v';
% a.Color = [0 0 0];
% a.MarkerFaceColor = [0 0 0];
% a.MarkerSize = 4;
% a.LineWidth = 1;
% 
% a = plot(LET, RBEAGOFifth);
% a.LineStyle = 'none';
% a.Marker = 'diamond';
% a.LineWidth = 1;
% blue1 = [0.122 0.475 0.82];
% blue2 = [0.333 0.631 0.922];
% a.MarkerEdgeColor = blue1;
% % a.MarkerFaceColor = blue1;
% a.MarkerSize = 6;
% 
% a = plot(LET, RBEAGOFourthLET);
% a.LineStyle = 'none';
% a.Marker = 'pentagram';
% red1 = [0.89 0.227 0.071];
% red2 = [0.89 0.094 0.071];
% a.MarkerEdgeColor = red2;
% a.MarkerSize = 9;
% 
% a = plot(LETsforMcnamara,McNamaraRBE);
% a.LineStyle = '-';
% a.Marker = 'none';
% % a.Color = [0.063, 0.38, 0.11];
% a.Color = [0.09, 0.459, 0.051];
% %a.MarkerSize = 12;
% a.LineWidth = 1.3;
% 
% %Best fit lines I created with CFTool
% x = linspace(0,30,100);
% y1 = (0.0517*x)+0.9551;
% a = plot(x,y1);
% a.LineStyle = '--';
% a.LineWidth = 1.2;
% a.Marker = 'none';
% a.Color = [0 0 0];
% 
% y2 = (0.0277*x)+1.0357;
% a = plot(x,y2);
% a.LineStyle = '--';
% a.LineWidth = 1.2;
% a.Marker = 'none';
% a.Color = [0 0 0];
% 
% hxtitle = get(gca,'XLabel');
% hytitle = get(gca,'YLabel');
% htitle = get(gca,'Title');
% 
% set(gca,'TickLabelInterpreter','Latex');
% set(hxtitle,'Interpreter','Latex');
% set(hytitle,'Interpreter','Latex');
% set(htitle,'Interpreter','Latex');
% 
% set(hxtitle,'String','LET$_d$ $[\frac{keV}{\mu m}]$');
% set(hytitle,'String','RBE (SF = 0.1)');
% set(hxtitle,'Fontsize',14); 
% set(hytitle,'Fontsize',14); 
% 
% set(gca,'YLim',[0.9 2.5]);
% 
% leg = legend(["Measurement (Pristine)" "Measurement (SOBP)" "f(y)" "LET" "McNamara" ]);
% leg.Position = [0.1515    0.6809    0.3625    0.2238];
% % leg.Position = [0.5388    0.1653    0.3421    0.1807];
% 
% % leg = legend(["Measurement Pristine" "Measurement SOBP"]);
% % leg.Position = [0.1502    0.8153    0.3421    0.0945];
% leg.Interpreter = 'Latex';
% leg.FontSize = 11;
% 
% f = gcf;
% % exportgraphics(f,'AGO_RBE01SF_newaxis.png','Resolution',300, 'BackgroundColor','white')
% % exportgraphics(f,'AGO_bestRBE_withintermediateBestFit.png','Resolution',300, 'BackgroundColor','white')
% 
% %% U87
% filePaths = ["U87_pristine_fy/1.1.csv","U87_pristine_fy/3.9.csv","U87_pristine_fy/6.7.csv","U87_pristine_fy/11.6.csv","U87_pristine_fy/17.7.csv","U87_pristine_fy/22.5.csv","U87_SOBP_fy/1.27.csv","U87_SOBP_fy/3.csv","U87_SOBP_fy/4.4.csv","U87_SOBP_fy/13.7.csv","U87_SOBP_fy/20.9.csv","U87_SOBP_fy/25.4.csv"];
% 
% % U87 - RBEs from Linear BWF model
% [LET, RBEU87Linear] = DetermineDoseFor_RBE_SF("LinearBWF", [0.222390093	0.034567961	0.04023814], filePaths, sf);
% % U87 - RBEs from Fourth LET model
% [LET, RBEU87LinearLET] =  DetermineDoseFor_RBE_SF_LET("LinearBWF", [0.247948161	0.018271588	0.040238499], filePaths, sf);
% 
% % H460 - RBEs from directly fitting the data
% U87DirectFit = RunScript_Direct_Alpha_SingleBeta("U87_Direct_Fit", filePaths);
% U87RBESF_Direct = [];
% for i = 1:(size(U87DirectFit{1,1}{1,1})-1)
%     U87RBESF_Direct(i) = DetermineDoseFor_RBE_SF_alphabeta(U87DirectFit{1,1}{1,1}(i), U87DirectFit{1,1}{1,1}(end), sf);
% end
% 
% % Normalize all three to get RBE
% % What is this normalization doing? It's taking the highest dose needed, to 
% [normVal, idx] = max(U87RBESF_Direct);
% U87RBESF_Direct = normVal./U87RBESF_Direct;
% RBEU87Linear = normVal./RBEU87Linear;
% RBEU87LinearLET = normVal./RBEU87LinearLET;
% 
% % Calculating and plotting McNamara RBE
% LETsforMcnamara = linspace(0,30,100);
% McNamaraRBE = zeros(size(LETsforMcnamara));
% ReferenceDose = DetermineDoseFor_RBE_SF_alphabeta(0.264028849279883,0.0402380724759335,0.1);
% for i = 1:size(McNamaraRBE,2)
%     McNamaraRBE(i) = Find_McNamara_RBESF((0.11/0.06),LETsforMcnamara(i),normVal);
% end
% 
% % How would we normalize McNamara? 
% % Find the minimum LET from the proton data (where we normalize RBE = 1)
% % Find the closest McNamara RBE to the point
% % Normalize relative to that
% LET_at_Min_RBE = LET(idx);
% diffBetweenLET = abs(LETsforMcnamara - LET_at_Min_RBE);
% [~, McNamaraNormIndex] = min(diffBetweenLET);
% McNamaraRBE = McNamaraRBE./McNamaraRBE(McNamaraNormIndex);
% 
% %Plot
% figure();
% hold on
% 
% U87DirectPristine = U87RBESF_Direct(1:6);
% LETPristine = LET(1:6);
% a = plot(LETPristine, U87DirectPristine);
% a.LineStyle = 'none';
% a.Marker = '^';
% a.Color = [0 0 0];
% a.MarkerSize = 4;
% a.MarkerFaceColor = [0 0 0];
% a.LineWidth = 1;
% 
% U87DirectSOBP = U87RBESF_Direct(7:end);
% LETSOBP = LET(7:end);
% a = plot(LETSOBP, U87DirectSOBP);
% a.LineStyle = 'none';
% a.Marker = 'v';
% a.Color = [0 0 0];
% a.MarkerFaceColor = [0 0 0];
% a.MarkerSize = 4;
% a.LineWidth = 1;
% 
% a = plot(LET, RBEU87Linear);
% a.LineStyle = 'none';
% a.Marker = 'diamond';
% a.LineWidth = 1;
% blue1 = [0.122 0.475 0.82];
% blue2 = [0.333 0.631 0.922];
% a.MarkerEdgeColor = blue1;
% a.MarkerSize = 6;
% 
% a = plot(LET, RBEU87LinearLET);
% a.LineStyle = 'none';
% a.Marker = 'pentagram';
% red1 = [0.89 0.227 0.071];
% red2 = [0.89 0.094 0.071];
% a.MarkerEdgeColor = red2;
% a.MarkerSize = 9;
% 
% a = plot(LETsforMcnamara,McNamaraRBE);
% a.LineStyle = '-';
% a.Marker = 'none';
% % a.Color = [0.063, 0.38, 0.11];
% a.Color = [0.09, 0.459, 0.051];
% %a.MarkerSize = 12;
% a.LineWidth = 1.3;
% 
% 
% 
% %Best fit lines I created with CFTool
% x1 = linspace(0,30,100);
% y1 = (0.0384*x)+0.9441;
% a = plot(x1,y1);
% a.LineStyle = '--';
% a.LineWidth = 0.8;
% a.Marker = 'none';
% a.Color = [0 0 0];
% 
% x2 = linspace(0,30,100);
% y2 = (0.0283*x)+0.9739;
% a = plot(x2,y2);
% a.LineStyle = '--';
% a.LineWidth = 0.8;
% a.Marker = 'none';
% a.Color = [0 0 0];
% 
% hxtitle = get(gca,'XLabel');
% hytitle = get(gca,'YLabel');
% htitle = get(gca,'Title');
% 
% set(gca,'TickLabelInterpreter','Latex');
% set(hxtitle,'Interpreter','Latex');
% set(hytitle,'Interpreter','Latex');
% set(htitle,'Interpreter','Latex');
% 
% set(hxtitle,'String','LET$_d$ $[\frac{keV}{\mu m}]$');
% set(hytitle,'String','RBE (SF = 0.1)');
% set(hxtitle,'Fontsize',14); 
% set(hytitle,'Fontsize',14); 
% 
% leg = legend(["Measurement (Pristine)" "Measurement (SOBP)" "f(y)" "LET" "McNamara"]);
% leg.Position = [0.5229    0.1452    0.3625    0.2238];
% % leg = legend(["Measurement Pristine" "Measurement SOBP"]);
% % leg.Position = [0.1502    0.8153    0.3421    0.0945];
% leg.Interpreter = 'Latex';
% leg.FontSize = 11;
% set(gca,'YLim',[0.9 2]);
% 
% f = gcf;
% % exportgraphics(f,'U87_RBE01SF.png','Resolution',300, 'BackgroundColor','white')
% % exportgraphics(f,'U87_withIntermediateBestFit.png','Resolution',300, 'BackgroundColor','white')

