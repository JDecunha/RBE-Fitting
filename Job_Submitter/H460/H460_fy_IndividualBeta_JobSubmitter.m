%% Configure the script
filePaths = ["H460_fy/a.csv", "H460_fy/b.csv" , "H460_fy/c.csv", "H460_fy/d.csv", "H460_fy/e.csv", "H460_fy/f.csv", "H460_fy/g.csv", "H460_fy/h.csv", "H460_fy/i.csv", "H460_fy/j.csv" , "H460_fy/k.csv" , "H460_fy/l.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated
iterationsPerCyc = 1000000;
numCycles = 1000; %formerly 250
toleranceCycles = 200; %formerly 10

%% Fit alpha and beta
% I need to make it so that the cost function is the same as the ones I develop with my cost function
%{
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
betas = [0.103759974936465	0.115325390701951	0.109776946319893	0.122902727249570	0.119652273535850	0.112061248723116	0.0877149675135953	0.150620431674224	0.113166228112791	0.296057617618820	0.567572327119187	0.609656027810132];

%% Config for cluster
%c = parcluster('Desktop-10700k');
%c = parcluster('GA401');

%configCluster
c = parcluster;

c.AdditionalProperties.WallTime = '48:00';
c.AdditionalProperties.MemUsage = 16.;
c.AdditionalProperties.GpusPerNode = 1;
c.AdditionalProperties.GpuMemUsage = 16.;
c.AdditionalProperties.QueueName = 'gpu';
c.AdditionalProperties.AdditionalSubmitArgs = '-n 10' % -q egpu-medium -gpu num=1:gmem=16'; 
c.saveProfile

%% Linear Fitting
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,betas];

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'linear_H460_fy_individualbeta', "LinearBWF", 2, "LinearPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');


%% Quadratic Fitting
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,betas];

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'quadratic_H460_fy_individualbeta', "QuadraticBWF", 3, "QuadraticBWFPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');


%% Cubic Fitting
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.252156540372324,-0.036106363579109,0.00472246152720456,1e-6,0.111894712631205,0.111898375457223,0.110568588663614,0.113210234247365,0.117060940532386,0.114805348436532,0.110828652134428,0.125065408975503,0.122191237794374,0.238265977013736,0.488464405854114,0.765713582849715];

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'cubic_H460_fy_individualbeta', "CubicBWF", 4,  "CubicBWFPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');


%% Fourth Fitting
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.252156540372324,-0.036106363579109,0.00472246152720456,1e-6,1e-6,0.111894712631205,0.111898375457223,0.110568588663614,0.113210234247365,0.117060940532386,0.114805348436532,0.110828652134428,0.125065408975503,0.122191237794374,0.238265977013736,0.488464405854114,0.765713582849715];

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'fourth_H460_fy_individualbeta', "FourthBWF", 5,  "FourthBWFPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');


%% Fifth Fitting
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.252156540372324,-0.036106363579109,0.00472246152720456,1e-6,1e-6,1e-6,0.111894712631205,0.111898375457223,0.110568588663614,0.113210234247365,0.117060940532386,0.114805348436532,0.110828652134428,0.125065408975503,0.122191237794374,0.238265977013736,0.488464405854114,0.765713582849715];

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'fifth_H460_fy_individualbeta', "FifthBWF", 6,  "FifthBWFPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% Q
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,betas]; %Q, 2 params + beta

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'Q_H460_fy_individualbeta', "QBWF", 2,  "QPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% QE
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,betas]; %QE, 3 params + beta

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'QE_H460_fy_individualbeta', "QEBWF", 3, "QEPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% QE2
dynamicTemp = false;
gradientAssist = true;
temps = [];

%Using QE2 guess for QE
InitialGuess = [-0.753793715221951,0.00393793863542611,0.0291454607535319,0.112456416664517,0.112145557931023,0.110113914151411,0.112403918216643,0.116043823133311,0.112314838082434,0.108837927532941,0.121780198998101,0.121371591218902,0.245120715027053,0.507996652978297,0.803694812991374]; %QE2, 3 params + beta

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'QE2_H460_fy_individualbeta', "QE2BWF", 3, "QE2PenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% LE
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,betas]; %LE, 3 params + beta

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'LE_H460_fy_individualbeta', "LEBWF", 3, "LEPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% LQE
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1,betas]; %LQE, 4 params + beta

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'LQE_H460_fy_individualbeta', "LQEBWF", 4, "LQEPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% LE2
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,betas];

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'LE2_H460_fy_individualbeta', "LE2BWF", 3, "LE2PenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% LQE2
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [-0.603464699207994,0.21130811664248,-0.00401532446829982,0.466374418766929,0.0745713227805571,0.0921122888767769,0.10832511405672,0.11621139544765,0.122218247161985,0.12862410747971,0.123242081235969,0.120679998546933,0.0954511603018396,0.235052662051597,0.549239818221393,0.92957902897868]; %LQE2, 4 params + beta

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'LQE2_H460_fy_individualbeta', "LQE2BWF", 4, "LQE2PenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% Gaussian Fitting
dynamicTemp = false;
gradientAssist = true;


InitialGuess = [0.1, 0.1, 0.1, 0.1,betas]; %Morstin inspired guess
temps = [1, 5, 10, 10];

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'gaussian_H460_fy_individualbeta', "GaussianBWF", 4, "GaussianPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting')

%% Skew Gaussian Fitting
dynamicTemp = false;
gradientAssist = true;

InitialGuess = [0.1, 0.1, 0.1, 0.1, 0.1,betas];
temps = [1, 1, 5, 5, 1];

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'skewGaussian_H460_fy_individualbeta', "SkewGaussianBWF", 5, "SkewGaussianPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting')

%% Morstin fitting
%[11460.000000, 2.5*power(10,-6), 2.1*power(10,-5), 2.*power(10,-7), 0.1]; Default guess
dynamicTemp = false;
gradientAssist = true;

InitialGuess = [11681.1730587803,1.38701494017747E-05,-3.89130703860672E-06,4.41126350151234E-07,0.103761549609672,0.115327831194301,0.109780869962175,0.12289828330815,0.119648180352417,0.112066410296402,0.0877115599942726,0.15063098165207,0.113162376265075,0.296053767332406,0.56756763624544,0.609659058201345];
temps = [1000, 1e-3, 1e-3, 1e-5];

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'morstin_H460_fy_individualbeta', "MorstinBWF", 4, "MorstinPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting')