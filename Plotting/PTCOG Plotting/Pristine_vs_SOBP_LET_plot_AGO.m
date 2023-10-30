%% Determine "the real" alpha and beta parameters for ALL of the cell studies
filePaths = ["AGO_SOBP_fy/1.27.csv","AGO_SOBP_fy/3.csv","AGO_SOBP_fy/4.4.csv","AGO_SOBP_fy/13.7.csv","AGO_SOBP_fy/20.9.csv","AGO_SOBP_fy/25.4.csv"];
LET_SOBPs = [1.2, 2.6, 4.5,13.4,21.7,25.9];
%A 3d array to hold the experiments data
CPUexperiments = [];

%Loop through the files and concatenate
for i = 1:size(filePaths,2)
    CPUexperiments = cat(3,CPUexperiments, readmatrix(filePaths(i)));
end

experiments = ExperimentData(CPUexperiments);
alphasAGO = zeros(size(experiments.SF,3),1);
betasAGO = zeros(size(experiments.SF,3),1);
dose_05SF_AGO = zeros(size(experiments.SF,3),1);

%Loop through the experiments
for  i = 1:size(experiments.SF,3)
    % Some data - replace it with yours (its from an earlier project)
    dose = experiments.Dose(:,1,i);
    survivingFraction = experiments.SF(:,1,i);
    ind = ~isnan(dose);
    dose=dose(ind);
    ind = ~isnan(survivingFraction);
    survivingFraction=survivingFraction(ind);
    % Define Start points, fit-function and fit curve
    x0 = [0.5 0.1]; 
    LQModel = fittype( @(a,b,x) exp(-a.*x-b.*x.*x) );
    [fitted_curve,gof] = fit(dose,survivingFraction,LQModel,'StartPoint',x0);
    % Save the coeffiecient values for a,b,c and d in a vector
    coeffvals = coeffvalues(fitted_curve); 
    alphasAGO(i) = coeffvals(1);
    betasAGO(i) = coeffvals(2);
end

%Loop through the alphas and calculate the "real" SF dose
for  i = 1:size(alphasAGO,1)
    dose_05SF_AGO(i) = DetermineDoseFor_RBE_SF_alphabeta(alphasAGO(i),betasAGO(i),0.5);
end

%% Let's determine dose for a given  SF of the top 5 pristine models for both LET and  f(y) AGO
filePaths = ["AGO_SOBP_fy/1.27.csv","AGO_SOBP_fy/3.csv","AGO_SOBP_fy/4.4.csv","AGO_SOBP_fy/13.7.csv","AGO_SOBP_fy/20.9.csv","AGO_SOBP_fy/25.4.csv"];
%filePaths = ["AGO_pristine_fy/1.1.csv","AGO_pristine_fy/3.9.csv","AGO_pristine_fy/6.7.csv","AGO_pristine_fy/11.6.csv","AGO_pristine_fy/17.7.csv","AGO_pristine_fy/22.5.csv"];

% Fit Alpha and Beta for AGO photons
dose = [0, 0.5, 1, 2, 3, 4];
SF = [1,0.7542,0.53,0.221,0.0725,0.0214];
alphaAGO = 0.5097;
betaAGO = 0.1219;

doseU87 = [0, 1.5, 3, 4.5, 7];
SFU87 = [1,0.753,0.436,0.205,0.031];
alphaU87 = 0.1089;
betaU87 = 0.0549;

%Figure out 0.5 SF dose for photons
AGOsf05 = DetermineDoseFor_RBE_SF_alphabeta(alphaAGO,betaAGO,0.5)

% AGO best models Cubic, LQE, Gaussian, LE, LQE2
CubicParams = [0.98093336, 0.033456255, 0.005455094, -7.44E-05, 0.007166257];
[LETs, CubicDose05Survivalfy] = DetermineDoseFor_RBE_SF("CubicBWF", CubicParams, filePaths,0.5);
CubicParamsLET = [0.918065129, 0.081310112, -0.004191177, 0.000139562, 0.013129616];
[LETs, CubicDose05SurvivalLET] = DetermineDoseFor_RBE_SF_LET("CubicBWF", CubicParamsLET, filePaths,0.5);
RBECubic05SFfy = AGOsf05./CubicDose05Survivalfy;
RBECubic05SFLETd = AGOsf05./CubicDose05SurvivalLET;

%LQE
LQEParams = [-0.000101665,0.17265292,-0.001025522,0.167477508,0.008389703];
[LETs, LQEDose05Survivalfy] = DetermineDoseFor_RBE_SF("LQEBWF", LQEParams, filePaths,0.5);
LQEParamsLET = [-0.045404303,0.000568809,-0.004834399,-0.068867363,0.007504162];
[LETs, LQEDose05SurvivalLET] = DetermineDoseFor_RBE_SF_LET("LQEBWF", LQEParamsLET, filePaths,0.5);
RBELQE05SFfy = AGOsf05./LQEDose05Survivalfy;
RBELQE05SFLETd = AGOsf05./LQEDose05SurvivalLET;

%Gaussian
GaussianParams = [5.649937095,-4.696891626,-2.302087262,-19.64507977,0.008931498];
[LETs, GaussianDose05Survivalfy] = DetermineDoseFor_RBE_SF("GaussianBWF", GaussianParams, filePaths,0.5);
GaussianParamsLET = [25.88410869,-25.25305246,-21.58972498,123.1861815,0.008939898];
[LETs, GaussianDose05SurvivalLET] = DetermineDoseFor_RBE_SF_LET("GaussianBWF", GaussianParamsLET, filePaths,0.5);
RBEGaussian05SFfy = AGOsf05./GaussianDose05Survivalfy;
RBEGaussian05SFLETd = AGOsf05./GaussianDose05SurvivalLET;

%LE
LEParams = [-0.029141194,0.139346957,0.095690842,0.008930947];
[LETs, LEDose05Survivalfy] = DetermineDoseFor_RBE_SF("LEBWF", LEParams, filePaths,0.5);
LEParamsLET = [0.016210881,0.003594287,-0.033128467,0.008931322];
[LETs, LEDose05SurvivalLET] = DetermineDoseFor_RBE_SF_LET("LEBWF", LEParamsLET, filePaths,0.5);
RBELE05SFfy = AGOsf05./LEDose05Survivalfy;
RBELE05SFLETd = AGOsf05./LEDose05SurvivalLET;

%LQE2
LQE2Params = [-0.105161998,0.216875312,-0.002237173,0.052746444,0.008925439];
[LETs, LQE2Dose05Survivalfy] = DetermineDoseFor_RBE_SF("LQE2BWF", LQE2Params, filePaths,0.5);
LQE2ParamsLET = [-0.042746278,0.063589776,-0.003185576,-0.001770769,0.008904127];
[LETs, LQE2Dose05SurvivalLET] = DetermineDoseFor_RBE_SF_LET("LQE2BWF", LQE2ParamsLET, filePaths,0.5);
RBELQE205SFfy = AGOsf05./LQE2Dose05Survivalfy;
RBELQE205SFLETd = AGOsf05./LQE2Dose05SurvivalLET;


%% Plotting the LET-RBE Curve

%The real RBE

hold on
%Cubic RBE from fy

plot(LET_SOBPs,RBECubic05SFfy,'v','Color',[22/255 149/255 222/255],'MarkerSize',6,'DisplayName','Cubic - f(y)');
%plot(LET_SOBPs,RBELQE05SFfy,'+');
%plot(LET_SOBPs,RBEGaussian05SFfy,'o');
%plot(LET_SOBPs,RBELE05SFfy,'<');
%plot(LET_SOBPs,RBELQE205SFfy,'diamond','Color','blue');


%Cubic RBE from LETd
plot(LET_SOBPs,RBECubic05SFLETd,'x','Color','red','MarkerSize',8,'DisplayName','Cubic - LET$_d$');
%plot(LET_SOBPs,RBELQE05SFLETd,'x','Color','red');
%plot(LET_SOBPs,RBEGaussian05SFLETd,'+','Color','red');%,'MarkerFaceColor','red');
%plot(LET_SOBPs,RBELE05SFLETd,'<','Color','red');%,'MarkerFaceColor','red');
%plot(LET_SOBPs,RBELQE205SFLETd,'diamond','Color','red');%,'MarkerFaceColor','red');

plot(LET_SOBPs,AGOsf05./dose_05SF_AGO,'O','Color','black','MarkerFaceColor','black','MarkerSize',6,'DisplayName','AGO SOBP');

hxtitle = get(gca,'XLabel');
hytitle = get(gca,'YLabel');
htitle = get(gca,'Title');
set(gca,'TickLabelInterpreter','Latex');
set(hxtitle,'Interpreter','Latex');
set(hytitle,'Interpreter','Latex');
set(htitle,'Interpreter','Latex');
set(hytitle,'String','RBE SF=0.5');
set(hxtitle,'String','LET$_d$');
set(hxtitle,'Fontsize',14); 
set(hytitle,'Fontsize',14); 
ax = gca;
ax.FontSize = 12; 
legend('Interpreter','Latex','FontSize',11);
%title("H460 d(y), Gradient Descent vs. Simulated Annealing")
