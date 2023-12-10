%% Configure the script
filePaths = ["H1437_fy/a.csv", "H1437_fy/b.csv" , "H1437_fy/c.csv", "H1437_fy/d.csv", "H1437_fy/e.csv", "H1437_fy/f.csv", "H1437_fy/g.csv", "H1437_fy/h.csv", "H1437_fy/i.csv", "H1437_fy/j.csv" , "H1437_fy/k.csv" , "H1437_fy/l.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated
iterationsPerCyc = 1000000;
numCycles = 1000; %formerly 250
toleranceCycles = 200; %formerly 10

%% Fit alpha and beta
%{
% I need to make it so that the cost function is the same as the ones I develop with my cost function

%A 3d array to hold the experiments data
CPUexperiments = [];

%Loop through the files and concatenate
for i = 1:size(filePaths,2)
    CPUexperiments = cat(3,CPUexperiments, readmatrix(filePaths(i)));
end

experiments = ExperimentData(CPUexperiments);
alphas = zeros(size(experiments.SF,3),1);
betas = zeros(size(experiments.SF,3),1);

%Loop through the experiments
for  i = 1:size(experiments.SF,3)
    %Fill in dose and survivivng fraction
    dose = experiments.Dose(:,1,i);
    survivingFraction = experiments.SF(:,1,i);

    %Cleave off 0 values
    ind = ~isnan(dose);
    dose=dose(ind);
    ind = ~isnan(survivingFraction);
    survivingFraction=survivingFraction(ind);

    %Take the log of the surviving fraction
    survivingFraction = log(survivingFraction);

    % Define Start points, fit-function and fit curve
    x0 = [0.5 0.1]; 
    %For the definition where all doses are weighted equally
    LQModel = fittype( @(a,b,x) -((a.*x)+(b.*x.*x)) );
    %For the conventional definition of the cost function
    %LQModel = fittype( @(a,b,x) exp(-((a.*x)+(b.*x.*x))) );
    [fitted_curve,gof] = fit(dose,survivingFraction,LQModel,'StartPoint',x0);

    % Save the coeffiecient values for a,b,c and d in a vector
    coeffvals = coeffvalues(fitted_curve); 
    alphas(i) = coeffvals(1);
    betas(i) = coeffvals(2);
    
end
betas = transpose(betas);
%}

%% Hardcode alpha-beta
betas = [0.0281740256136273	0.0226969524647535	0.0255232782685447	0.0365045674483453	0.0290274156133928	0.0284500414865049	0.0309737632089621	0.0479575259625511	0.0361651599514227	0.0818185036071344	0.118855397530958	0.283926868945881];

%% Config for cluster
%c = parcluster('Desktop-10700k');
%c = parcluster('GA401');

%configCluster
c = parcluster;

c.AdditionalProperties.WallTime = '60:00';
c.AdditionalProperties.MemUsage = 16.;
c.AdditionalProperties.GpusPerNode = 1;
c.AdditionalProperties.GpuMemUsage = 16.;
c.AdditionalProperties.QueueName = 'egpu-medium';
c.AdditionalProperties.AdditionalSubmitArgs = '-n 10' % -q egpu-medium -gpu num=1:gmem=16'; 
c.saveProfile


%% Linear Fitting
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,betas];

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'linear_H1437_fy_individualbeta', "LinearBWF", 2, "LinearPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');


%% Quadratic Fitting
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,betas];

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'quadratic_H1437_fy_individualbeta', "QuadraticBWF", 3, "QuadraticBWFPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');


%% Cubic Fitting
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.0970009571377085,-0.00701917627545641,0.00147611580658678,1e-6,0.0216038595159644,0.0328240553260001,0.0205797302999214,0.030573507452633,0.0305371165729839,0.0312399416283185,0.0356778857760403,0.0380584011812437,0.041813532863892,0.071726644299789,0.141559381954003,0.264985923582897];

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'cubic_H1437_fy_individualbeta', "CubicBWF", 4,  "CubicBWFPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');


%% Fourth Fitting
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.0970009571377085,-0.00701917627545641,0.00147611580658678,1e-6,1e-6,0.0216038595159644,0.0328240553260001,0.0205797302999214,0.030573507452633,0.0305371165729839,0.0312399416283185,0.0356778857760403,0.0380584011812437,0.041813532863892,0.071726644299789,0.141559381954003,0.264985923582897];

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'fourth_H1437_fy_individualbeta', "FourthBWF", 5,  "FourthBWFPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');


%% Fifth Fitting
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.0970009571377085,-0.00701917627545641,0.00147611580658678,1e-6,1e-6,1e-6,0.0216038595159644,0.0328240553260001,0.0205797302999214,0.030573507452633,0.0305371165729839,0.0312399416283185,0.0356778857760403,0.0380584011812437,0.041813532863892,0.071726644299789,0.141559381954003,0.264985923582897];

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'fifth_H1437_fy_individualbeta', "FifthBWF", 6,  "FifthBWFPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% Q
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,betas]; %Q, 2 params + beta

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'Q_H1437_fy_individualbeta', "QBWF", 2,  "QPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% QE
dynamicTemp = false;
gradientAssist = true;
temps = [];

%Using the Q guess for this
InitialGuess = [0.0846091246837291,0.00117319823745005,1e-6,0.0243895891088498,0.0346687001234848,0.0214917813559579,0.0311866818640105,0.0310048459415791,0.0313244093737393,0.035260387355579,0.0367896856769164,0.0403296704022167,0.0713604002997452,0.143138163034144,0.269432689970128]; %QE, 3 params + beta

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'QE_H1437_fy_individualbeta', "QEBWF", 3, "QEPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% QE2
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,betas]; %QE2, 3 params + beta

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'QE2_H1437_fy_individualbeta', "QE2BWF", 3, "QE2PenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% LE
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,betas]; %LE, 3 params + beta

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'LE_H1437_fy_individualbeta', "LEBWF", 3, "LEPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% LQE
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1,betas]; %LQE, 4 params + beta

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'LQE_H1437_fy_individualbeta', "LQEBWF", 4, "LQEPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% LE2
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,betas];

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'LE2_H1437_fy_individualbeta', "LE2BWF", 3, "LE2PenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% LQE2
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [-0.587405010362349,0.186403552191865,-0.00507476467508616,0.671956601419912,-0.0475019870699855,-0.00570342435568914,0.0108984497308492,0.0283000749629992,0.031150248713354,0.0374567744676976,0.0446187645670803,0.0380813104727193,0.0251454930517618,0.0629971380302777,0.155286703410989, 0.317146932]; %LQE2, 4 params + beta

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'LQE2_H1437_fy_individualbeta', "LQE2BWF", 4, "LQE2PenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% Gaussian Fitting
dynamicTemp = false;
gradientAssist = true;


InitialGuess = [0.119945822344694,0.00113962549534225,0.0320233309031914,-5.79272731419515E-06,0.0120868589024348,0.0249994942328419,0.0143547744321427,0.0249731367595394,0.0252822755297394,0.0268906967984438,0.0312407809636843,0.0345598994970886,0.0514885948113693,0.106968499255572,0.215480417355184, 0.388403124]; %Morstin inspired guess
temps = [1, 5, 10, 10];

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'gaussian_H1437_fy_individualbeta', "GaussianBWF", 4, "GaussianPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting')

%% Skew Gaussian Fitting
dynamicTemp = false;
gradientAssist = true;

InitialGuess = [4.98250460342095,-4.59255546147171,14.857122673449,36.7485105613494,-0.479722314766065,0.0213233845979805,0.032711261233974,0.0206131713913313,0.0306400196611384,0.0306144482081539,0.0313321475807708,0.0357633953063207,0.0378939087290712,0.0409506236644066,0.0713099759251218,0.142618711878007,0.268739116434196];
temps = [1, 1, 5, 5, 1];

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'skewGaussian_H1437_fy_individualbeta', "SkewGaussianBWF", 5, "SkewGaussianPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting')

%% Morstin fitting
%[11460.000000, 2.5*power(10,-6), 2.1*power(10,-5), 2.*power(10,-7), 0.1]; Default guess
dynamicTemp = false;
gradientAssist = true;

InitialGuess = [11020.5773871293,6.22283507969785E-06,-6.99760771818165E-07,1.37863207449753E-07,0.0281773834109236,0.0227018062231596,0.0255194615029132,0.0365068920051629,0.0290235205408289,0.0284454559769801,0.030973636799138,0.0479567789032542,0.0361606016047543,0.081820356068728,0.118855297141842, 0.283928741];
temps = [1000, 1e-3, 1e-3, 1e-5];

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'morstin_H1437_fy_individualbeta', "MorstinBWF", 4, "MorstinPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting')
