%% Configure the script
filePaths = ["H1437_dy/a.csv", "H1437_dy/b.csv" , "H1437_dy/c.csv", "H1437_dy/d.csv", "H1437_dy/e.csv", "H1437_dy/f.csv", "H1437_dy/g.csv", "H1437_dy/h.csv", "H1437_dy/i.csv", "H1437_dy/j.csv" , "H1437_dy/k.csv" , "H1437_dy/l.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated
iterationsPerCyc = 250000;
numCycles = 250;
toleranceCycles = 10;

%%
c = parcluster('Desktop-10700k');
%c = parcluster('GA401');

%% Linear Fitting
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1];

batch(c, @RunScript_LETFixedBeta, 1, {'linear_H1437_FixedBeta_LETAnnealing', "LinearBWF", filePaths, InitialGuess,  iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});


%% Quadratic Fitting
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1];

batch(c, @RunScript_LETFixedBeta, 1, {'quadratic_H1437_FixedBeta_LETAnnealing', "QuadraticBWF", filePaths, InitialGuess,  iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});


%% Cubic Fitting
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1,0.1];

batch(c, @RunScript_LETFixedBeta, 1, {'cubic_H1437_FixedBeta_LETAnnealing', "CubicBWF", filePaths, InitialGuess,  iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});


%% Fourth Fitting
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1,0.1,0.1];

batch(c, @RunScript_LETFixedBeta, 1, {'fourth_H1437_FixedBeta_LETAnnealing', "FourthBWF", filePaths, InitialGuess,  iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});


%% Fifth Fitting
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1,0.1,0.1,0.1];

batch(c, @RunScript_LETFixedBeta, 1, {'fifth_H1437_FixedBeta_LETAnnealing', "FifthBWF", filePaths, InitialGuess,  iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% Q
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1]; %Q, 2 params + beta

batch(c, @RunScript_LETFixedBeta, 1, {'Q_H1437_FixedBeta_LETAnnealing', "QBWF", filePaths, InitialGuess,  iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% QE
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1]; %QE, 3 params + beta

batch(c, @RunScript_LETFixedBeta, 1, {'QE_H1437_FixedBeta_LETAnnealing', "QEBWF", filePaths, InitialGuess,  iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% QE2
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1]; %QE2, 3 params + beta

batch(c, @RunScript_LETFixedBeta, 1, {'QE2_H1437_FixedBeta_LETAnnealing', "QE2BWF", filePaths, InitialGuess,  iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% LE
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1]; %LE, 3 params + beta

batch(c, @RunScript_LETFixedBeta, 1, {'LE_H1437_FixedBeta_LETAnnealing', "LEBWF", filePaths, InitialGuess,  iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% LQE
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1,0.1]; %LQE, 4 params + beta

batch(c, @RunScript_LETFixedBeta, 1, {'LQE_H1437_FixedBeta_LETAnnealing', "LQEBWF", filePaths, InitialGuess,  iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% LE2
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1,0.1,0.1,0.1];

batch(c, @RunScript_LETFixedBeta, 1, {'LE2_H1437_FixedBeta_LETAnnealing', "LE2BWF", filePaths, InitialGuess,  iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% LQE2
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1,0.1]; %LQE2, 4 params + beta

batch(c, @RunScript_LETFixedBeta, 1, {'LQE2_H1437_FixedBeta_LETAnnealing', "LQE2BWF", filePaths, InitialGuess,  iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% Gaussian Fitting
dynamicTemp = false;
gradientAssist = true;

InitialGuess = [0.1, 0.1, 0.1, 0.1, 0.1]; %Morstin inspired guess
temps = [1, 5, 10, 10, 0.05];

batch(c, @RunScript_LETFixedBeta, 1, {'gaussian_H1437_FixedBeta_LETAnnealing', "GaussianBWF", filePaths, InitialGuess,  iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps})

%% Skew Gaussian Fitting
dynamicTemp = false;
gradientAssist = true;

InitialGuess = [0.1, 0.1, 0.1, 0.1, 0.1, 0.1];
temps = [1, 1, 5, 5, 1, 0.05];

batch(c, @RunScript_LETFixedBeta, 1, {'skewGaussian_H1437_FixedBeta_LETAnnealing', "SkewGaussianBWF",  filePaths, InitialGuess,  iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps})

%% Morstin fitting
%[11460.000000, 2.5*power(10,-6), 2.1*power(10,-5), 2.*power(10,-7), 0.1]; Default guess
dynamicTemp = false;
gradientAssist = true;

InitialGuess = [11460.000000, 2.5*power(10,-6), 2.1*power(10,-5), 2.*power(10,-7), 0.1];
temps = [1000, 1e-3, 1e-3, 1e-5, 0.1];

batch(c, @RunScript_LETFixedBeta, 1, {'morstin_H1437_FixedBeta_LETAnnealing', "MorstinBWF", filePaths, InitialGuess,  iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps})