%% Configure the script
filePaths = ["AGO_pristine_fy/1.1.csv","AGO_pristine_fy/3.9.csv","AGO_pristine_fy/6.7.csv","AGO_pristine_fy/11.6.csv","AGO_pristine_fy/17.7.csv","AGO_pristine_fy/22.5.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated
iterationsPerCyc = 250000;
numCycles =  250;
toleranceCycles = 10;

%%
c = parcluster('Desktop-10700k');
%c = parcluster('GA401');

%% Linear Fitting
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1];

batch(c, @Generic_BWF_RunScript, 1, {'linear_AGO_Pristine_fy', "LinearBWF", "LinearPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});


%% Quadratic Fitting
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1];

batch(c, @Generic_BWF_RunScript, 1, {'quadratic_AGO_Pristine_fy', "QuadraticBWF", "QuadraticBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});


%% Cubic Fitting
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.951998494, 0.063793207, 0.001325588, 0.1, 0.008843962];

batch(c, @Generic_BWF_RunScript, 1, {'cubic_AGO_Pristine_fy', "CubicBWF", "CubicBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});


%% Fourth Fitting
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.951998494, 0.063793207, 0.001325588, 0.1, 0.1, 0.008843962];

batch(c, @Generic_BWF_RunScript, 1, {'fourth_AGO_Pristine_fy', "FourthBWF", "FourthBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});


%% Fifth Fitting
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.951998494, 0.063793207, 0.001325588, 0.1,0.1,0.1, 0.008843962];

batch(c, @Generic_BWF_RunScript, 1, {'fifth_AGO_Pristine_fy', "FifthBWF", "FifthBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% Q
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1]; %Q, 2 params + beta

batch(c, @Generic_BWF_RunScript, 1, {'Q_AGO_Pristine_fy', "QBWF", "QPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% QE
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1]; %QE, 3 params + beta

batch(c, @Generic_BWF_RunScript, 1, {'QE_AGO_Pristine_fy', "QEBWF", "QEPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% QE2
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1]; %QE2, 3 params + beta

batch(c, @Generic_BWF_RunScript, 1, {'QE2_AGO_Pristine_fy', "QE2BWF", "QE2PenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% LE
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1]; %LE, 3 params + beta

batch(c, @Generic_BWF_RunScript, 1, {'LE_AGO_Pristine_fy', "LEBWF", "LEPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% LQE
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1,0.1]; %LQE, 4 params + beta

batch(c, @Generic_BWF_RunScript, 1, {'LQE_AGO_Pristine_fy', "LQEBWF", "LQEPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% LE2
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1,0.1,0.1,0.1];

batch(c, @Generic_BWF_RunScript, 1, {'LE2_AGO_Pristine_fy', "LE2BWF", "LE2PenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% LQE2
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1,0.1]; %LQE2, 4 params + beta

batch(c, @Generic_BWF_RunScript, 1, {'LQE2_AGO_Pristine_fy', "LQE2BWF", "LQE2PenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% Gaussian Fitting
dynamicTemp = false;
gradientAssist = true;


InitialGuess = [0.1, 0.1, 0.1, 0.1, 0.1]; %Morstin inspired guess
temps = [1, 5, 10, 10, 0.05];

batch(c, @Generic_BWF_RunScript, 1, {'gaussian_AGO_Pristine_fy', "GaussianBWF", "GaussianPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps})

%% Skew Gaussian Fitting
dynamicTemp = false;
gradientAssist = true;

InitialGuess = [0.1, 0.1, 0.1, 0.1, 0.1, 0.1];
temps = [1, 1, 5, 5, 1, 0.05];

batch(c, @Generic_BWF_RunScript, 1, {'skewGaussian_AGO_Pristine_fy', "SkewGaussianBWF", "SkewGaussianPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps})

%% Morstin fitting
%[11460.000000, 2.5*power(10,-6), 2.1*power(10,-5), 2.*power(10,-7), 0.1]; Default guess
dynamicTemp = false;
gradientAssist = true;

InitialGuess = [11460.000000, 2.5*power(10,-6), 2.1*power(10,-5), 2.*power(10,-7), 0.1];
temps = [1000, 1e-3, 1e-3, 1e-5, 0.1];

batch(c, @Generic_BWF_RunScript, 1, {'morstin_AGO_Pristine_fy', "MorstinBWF", "MorstinPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps})