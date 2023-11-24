%% Configure the script
filePaths = ["AGO_pristine_fy/1.1.csv","AGO_pristine_fy/3.9.csv","AGO_pristine_fy/6.7.csv","AGO_pristine_fy/11.6.csv","AGO_pristine_fy/17.7.csv","AGO_pristine_fy/22.5.csv", "AGO_SOBP_fy/1.27.csv","AGO_SOBP_fy/3.csv","AGO_SOBP_fy/4.4.csv","AGO_SOBP_fy/13.7.csv","AGO_SOBP_fy/20.9.csv","AGO_SOBP_fy/25.4.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated
iterationsPerCyc = 1000000;
numCycles = 1000; %formerly 250
toleranceCycles = 200; %formerly 10

%% Fit alpha and beta
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

%% Hardcode alpha-beta
betas = [0.115511302813622	0.0806797846761335	0.0103870317654177	-0.0704755908212221	-0.0113049847616823	-0.0712095819503400	0.116641038250929	0.0702698714388184	0.0440282728746121	0.0530727145970709	-0.00788720063161925	-0.113384891963237];

%% Config for cluster
%c = parcluster('Desktop-10700k');
%c = parcluster('GA401');

configCluster
c = parcluster;

c.AdditionalProperties.WallTime = '72:00';
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

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'linear_AGOCombined_fy_individualbeta', "LinearBWF", 2, "LinearPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});


%% Quadratic Fitting
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,betas];

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'quadratic_AGOCombined_fy_individualbeta', "QuadraticBWF", 3, "QuadraticBWFPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});


%% Cubic Fitting
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.685759538034054,0.103116104578885,7.50114130837657E-05, 1e-6, 0.102114113625834,0.054489971702446,0.0539832302143297,0.0552230445684734,0.0453365941250816,0.0592265810008612,0.0762773106062309,0.0708885465753476,0.102408437892785,-0.00391794669891576,-0.0827574891526281,-0.0916849924002491];

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'cubic_AGOCombined_fy_individualbeta', "CubicBWF", 4,  "CubicBWFPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});


%% Fourth Fitting
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.685759538034054,0.103116104578885,7.50114130837657E-05,1e-6,1e-6,0.102114113625834,0.054489971702446,0.0539832302143297,0.0552230445684734,0.0453365941250816,0.0592265810008612,0.0762773106062309,0.0708885465753476,0.102408437892785,-0.00391794669891576,-0.0827574891526281,-0.0916849924002491];

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'fourth_AGOCombined_fy_individualbeta', "FourthBWF", 5,  "FourthBWFPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});


%% Fifth Fitting
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.685759538034054,0.103116104578885,7.50114130837657E-05,1e-6,1e-6,1e-6,0.102114113625834,0.054489971702446,0.0539832302143297,0.0552230445684734,0.0453365941250816,0.0592265810008612,0.0762773106062309,0.0708885465753476,0.102408437892785,-0.00391794669891576,-0.0827574891526281,-0.0916849924002491];

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'fifth_AGOCombined_fy_individualbeta', "FifthBWF", 6,  "FifthBWFPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% Q
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,betas]; %Q, 2 params + beta

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'Q_AGOCombined_fy_individualbeta', "QBWF", 2,  "QPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% QE
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,betas]; %QE, 3 params + beta

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'QE_AGOCombined_fy_individualbeta', "QEBWF", 3, "QEPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% QE2
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,betas]; %QE2, 3 params + beta

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'QE2_AGOCombined_fy_individualbeta', "QE2BWF", 3, "QE2PenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% LE
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,betas]; %LE, 3 params + beta

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'LE_AGOCombined_fy_individualbeta', "LEBWF", 3, "LEPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% LQE
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1,betas]; %LQE, 4 params + beta

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'LQE_AGOCombined_fy_individualbeta', "LQEBWF", 4, "LQEPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% LE2
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,betas];

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'LE2_AGOCombined_fy_individualbeta', "LE2BWF", 3, "LE2PenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% LQE2
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1,betas]; %LQE2, 4 params + beta

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'LQE2_AGOCombined_fy_individualbeta', "LQE2BWF", 4, "LQE2PenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% Gaussian Fitting
dynamicTemp = false;
gradientAssist = true;


InitialGuess = [3.83161820474326,-1.76267346160711,11.6406048619151,-1015.92582972504,0.100416214970445,0.0579801010887344,0.0526851968167279,0.048526068613858,0.0387841428880323,0.0652420895828771,0.0752134986033072,0.0724252738103675,0.104831614184165,-0.0103380911474391,-0.0831984950816656,-0.0858845951922908];
temps = [1, 5, 10, 10];

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'gaussian_AGOCombined_fy_individualbeta', "GaussianBWF", 4, "GaussianPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps})

%% Skew Gaussian Fitting
dynamicTemp = false;
gradientAssist = true;

InitialGuess = [0.1, 0.1, 0.1, 0.1, 0.1,betas];
temps = [1, 1, 5, 5, 1];

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'skewGaussian_AGOCombined_fy_individualbeta', "SkewGaussianBWF", 5, "SkewGaussianPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps})

%% Morstin fitting
%[11460.000000, 2.5*power(10,-6), 2.1*power(10,-5), 2.*power(10,-7), 0.1]; Default guess
dynamicTemp = false;
gradientAssist = true;

InitialGuess = [11375.1892307461,4.80047786744075E-05,1.02398601100359E-05,-3.15994529443954E-08,0.115507430941661,0.0806774118110641,0.0103832799517214,-0.0704801392323279,-0.0113019602575821,-0.0712118580706545,0.116637597980369,0.0702659923961015,0.0440296182440478,0.053076257854946,-0.00788346960503343,-0.113377302631393];
temps = [1000, 1e-3, 1e-3, 1e-5];

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'morstin_AGOCombined_fy_individualbeta', "MorstinBWF", 4, "MorstinPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps})