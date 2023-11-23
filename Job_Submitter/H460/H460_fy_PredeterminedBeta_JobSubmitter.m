%% Configure the script
filePaths = ["H460_fy/a.csv", "H460_fy/b.csv" , "H460_fy/c.csv", "H460_fy/d.csv", "H460_fy/e.csv", "H460_fy/f.csv", "H460_fy/g.csv", "H460_fy/h.csv", "H460_fy/i.csv", "H460_fy/j.csv" , "H460_fy/k.csv" , "H460_fy/l.csv"];
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

InitialGuess = [0.1,0.1];

batch(c, @Generic_BWF_PredeterminedBeta_RunScript, 1, {'linear_H460_fy_predeterminedbeta', "LinearBWF",  "LinearPenaltyFunction", filePaths, InitialGuess, betas, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});


%% Quadratic Fitting
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1];

batch(c, @Generic_BWF_PredeterminedBeta_RunScript, 1, {'quadratic_H460_fy_predeterminedbeta', "QuadraticBWF",  "QuadraticBWFPenaltyFunction", filePaths, InitialGuess, betas, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});


%% Cubic Fitting
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1];

batch(c, @Generic_BWF_PredeterminedBeta_RunScript, 1, {'cubic_H460_fy_predeterminedbeta', "CubicBWF",  "CubicBWFPenaltyFunction", filePaths, InitialGuess, betas, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});


%% Fourth Fitting
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1,0.1];

batch(c, @Generic_BWF_PredeterminedBeta_RunScript, 1, {'fourth_H460_fy_predeterminedbeta', "FourthBWF",  "FourthBWFPenaltyFunction", filePaths, InitialGuess, betas, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});


%% Fifth Fitting
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1,0.1,0.1];

batch(c, @Generic_BWF_PredeterminedBeta_RunScript, 1, {'fifth_H460_fy_predeterminedbeta', "FifthBWF",  "FifthBWFPenaltyFunction", filePaths, InitialGuess, betas, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% Q
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1]; %Q, 2 params + beta

batch(c, @Generic_BWF_PredeterminedBeta_RunScript, 1, {'Q_H460_fy_predeterminedbeta', "QBWF",  "QPenaltyFunction", filePaths, InitialGuess, betas, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% QE
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1]; %QE, 3 params + beta

batch(c, @Generic_BWF_PredeterminedBeta_RunScript, 1, {'QE_H460_fy_predeterminedbeta', "QEBWF",  "QEPenaltyFunction", filePaths, InitialGuess, betas, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% QE2
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1]; %QE2, 3 params + beta

batch(c, @Generic_BWF_PredeterminedBeta_RunScript, 1, {'QE2_H460_fy_predeterminedbeta', "QE2BWF",  "QE2PenaltyFunction", filePaths, InitialGuess, betas, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% LE
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1]; %LE, 3 params + beta

batch(c, @Generic_BWF_PredeterminedBeta_RunScript, 1, {'LE_H460_fy_predeterminedbeta', "LEBWF",  "LEPenaltyFunction", filePaths, InitialGuess, betas, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% LQE
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1]; %LQE, 4 params + beta

batch(c, @Generic_BWF_PredeterminedBeta_RunScript, 1, {'LQE_H460_fy_predeterminedbeta', "LQEBWF",  "LQEPenaltyFunction", filePaths, InitialGuess, betas, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% LE2
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1];

batch(c, @Generic_BWF_PredeterminedBeta_RunScript, 1, {'LE2_H460_fy_predeterminedbeta', "LE2BWF",  "LE2PenaltyFunction", filePaths, InitialGuess, betas, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% LQE2
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1]; %LQE2, 4 params + beta

batch(c, @Generic_BWF_PredeterminedBeta_RunScript, 1, {'LQE2_H460_fy_predeterminedbeta', "LQE2BWF",  "LQE2PenaltyFunction", filePaths, InitialGuess, betas, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% Gaussian Fitting
dynamicTemp = false;
gradientAssist = true;


InitialGuess = [0.1, 0.1, 0.1, 0.1]; %Morstin inspired guess
temps = [1, 5, 10, 10, 0.05];

batch(c, @Generic_BWF_PredeterminedBeta_RunScript, 1, {'gaussian_H460_fy_predeterminedbeta', "GaussianBWF",  "GaussianPenaltyFunction", filePaths, InitialGuess, betas, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps})

%% Skew Gaussian Fitting
dynamicTemp = false;
gradientAssist = true;

InitialGuess = [0.1, 0.1, 0.1, 0.1, 0.1];
temps = [1, 1, 5, 5, 1, 0.05];

batch(c, @Generic_BWF_PredeterminedBeta_RunScript, 1, {'skewGaussian_H460_fy_predeterminedbeta', "SkewGaussianBWF",  "SkewGaussianPenaltyFunction", filePaths, InitialGuess, betas, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps})

%% Morstin fitting
%[11460.000000, 2.5*power(10,-6), 2.1*power(10,-5), 2.*power(10,-7), 0.1]; Default guess
dynamicTemp = false;
gradientAssist = true;

InitialGuess = [11460.000000, 2.5*power(10,-6), 2.1*power(10,-5), 2.*power(10,-7)];
temps = [1000, 1e-3, 1e-3, 1e-5, 0.1];

batch(c, @Generic_BWF_PredeterminedBeta_RunScript, 1, {'morstin_H460_fy_predeterminedbeta', "MorstinBWF",  "MorstinPenaltyFunction", filePaths, InitialGuess, betas, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps})