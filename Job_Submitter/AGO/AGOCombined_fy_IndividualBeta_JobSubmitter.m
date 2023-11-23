%% Configure the script
filePaths = ["AGO_pristine_fy/1.1.csv","AGO_pristine_fy/3.9.csv","AGO_pristine_fy/6.7.csv","AGO_pristine_fy/11.6.csv","AGO_pristine_fy/17.7.csv","AGO_pristine_fy/22.5.csv", "AGO_SOBP_fy/1.27.csv","AGO_SOBP_fy/3.csv","AGO_SOBP_fy/4.4.csv","AGO_SOBP_fy/13.7.csv","AGO_SOBP_fy/20.9.csv","AGO_SOBP_fy/25.4.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated
iterationsPerCyc = 1000000;
numCycles = 250;
toleranceCycles = 10;

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

%%
c = parcluster('Desktop-10700k');
%c = parcluster('GA401');

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

InitialGuess = [0.1,0.1,0.1,0.1,betas];

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'cubic_AGOCombined_fy_individualbeta', "CubicBWF", 4,  "CubicBWFPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});


%% Fourth Fitting
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1,0.1,betas];

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'fourth_AGOCombined_fy_individualbeta', "FourthBWF", 5,  "FourthBWFPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});


%% Fifth Fitting
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1,0.1,0.1,betas];

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


InitialGuess = [0.1, 0.1, 0.1, 0.1,betas]; %Morstin inspired guess
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

InitialGuess = [11460.000000, 2.5*power(10,-6), 2.1*power(10,-5), 2.*power(10,-7), betas];
temps = [1000, 1e-3, 1e-3, 1e-5];

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'morstin_AGOCombined_fy_individualbeta', "MorstinBWF", 4, "MorstinPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps})