%% Configure the script
filePaths = ["U87_pristine_dy/1.1.csv","U87_pristine_dy/3.9.csv","U87_pristine_dy/6.7.csv","U87_pristine_dy/11.6.csv","U87_pristine_dy/17.7.csv","U87_pristine_dy/22.5.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated
iterationsPerCyc = 250000;
numCycles = 250;
toleranceCycles = 10;

%%
c = parcluster('Desktop-10700k');

%% Linear Fitting
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1];

batch(c, @Scaled_Beta_BWF_RunScript, 1, {'linear_U87_Pristine', "LinearBWF", "LinearPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});


%% Quadratic Fitting
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1];

batch(c, @Scaled_Beta_BWF_RunScript, 1, {'quadratic_U87_Pristine', "QuadraticBWF", "QuadraticBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});


%% Cubic Fitting
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1,0.1];

batch(c, @Scaled_Beta_BWF_RunScript, 1, {'cubic_U87_Pristine', "CubicBWF", "CubicBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});


%% Fourth Fitting
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1,0.1,0.1];

batch(c, @Scaled_Beta_BWF_RunScript, 1, {'fourth_U87_Pristine', "FourthBWF", "FourthBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});


%% Fifth Fitting
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1,0.1,0.1,0.1];

batch(c, @Scaled_Beta_BWF_RunScript, 1, {'fifth_U87_Pristine', "FifthBWF", "FifthBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% Q
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1]; %Q, 2 params + beta

batch(c, @Scaled_Beta_BWF_RunScript, 1, {'Q_U87_Pristine', "QBWF", "QPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% QE
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1]; %QE, 3 params + beta

batch(c, @Scaled_Beta_BWF_RunScript, 1, {'QE_U87_Pristine', "QEBWF", "QEPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% QE2
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1]; %QE2, 3 params + beta

batch(c, @Scaled_Beta_BWF_RunScript, 1, {'QE2_U87_Pristine', "QE2BWF", "QE2PenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% LE
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1]; %LE, 3 params + beta

batch(c, @Scaled_Beta_BWF_RunScript, 1, {'LE_U87_Pristine', "LEBWF", "LEPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% LQE
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1,0.1]; %LQE, 4 params + beta

batch(c, @Scaled_Beta_BWF_RunScript, 1, {'LQE_U87_Pristine', "LQEBWF", "LQEPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% LE2
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1,0.1,0.1,0.1];

batch(c, @Scaled_Beta_BWF_RunScript, 1, {'LE2_U87_Pristine', "LE2BWF", "LE2PenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% LQE2
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1,0.1]; %LQE2, 4 params + beta

batch(c, @Scaled_Beta_BWF_RunScript, 1, {'LQE2_U87_Pristine', "LQE2BWF", "LQE2PenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% Gaussian Fitting
dynamicTemp = false;
gradientAssist = true;


InitialGuess = [0.1, 0.1, 0.1, 0.1, 0.1]; %Morstin inspired guess
temps = [1, 5, 10, 10, 0.05];

batch(c, @Scaled_Beta_BWF_RunScript, 1, {'gaussian_U87_Pristine', "GaussianBWF", "GaussianPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps})

%% Skew Gaussian Fitting
dynamicTemp = false;
gradientAssist = true;

InitialGuess = [0.1, 0.1, 0.1, 0.1, 0.1, 0.1];
temps = [1, 1, 5, 5, 1, 0.05];

batch(c, @Scaled_Beta_BWF_RunScript, 1, {'skewGaussian_U87_Pristine', "SkewGaussianBWF", "SkewGaussianPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps})

%% Morstin fitting
%[11460.000000, 2.5*power(10,-6), 2.1*power(10,-5), 2.*power(10,-7), 0.1]; Default guess
dynamicTemp = false;
gradientAssist = true;

InitialGuess = [11460.000000, 2.5*power(10,-6), 2.1*power(10,-5), 2.*power(10,-7), 0.1];
temps = [1000, 1e-3, 1e-3, 1e-5, 0.1];

batch(c, @Scaled_Beta_BWF_RunScript, 1, {'morstin_U87_Pristine', "MorstinBWF", "MorstinPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps})