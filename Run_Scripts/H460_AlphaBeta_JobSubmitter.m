%% Configure the script
filePaths = ["a.csv", "b.csv" , "c.csv", "d.csv", "e.csv", "f.csv", "g.csv", "h.csv", "i.csv", "j.csv" , "k.csv" , "l.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated
iterationsPerCyc = 1; %250000;
numCycles = 1; %1000;
toleranceCycles = 250;

%%
%c = parcluster('Desktop-10700k');
c = parcluster('GA401');

%% Linear
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = transpose(zeros(4,1)) + 0.1; %Linear, 2 params
batch(c, @AlphaBeta_BWF_RunScript, 1, {'linear_linear_H460', "LinearBWF", 2, "LinearBWF", "LinearPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});
InitialGuess =  transpose(zeros(5,1)) + 0.1; %Linear, 2 params
batch(c, @AlphaBeta_BWF_RunScript, 1, {'linear_quadratic_H460', "LinearBWF", 2, "QuadraticBWF", "LinearPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});
InitialGuess =  transpose(zeros(6,1)) + 0.1; %Linear, 2 params
batch(c, @AlphaBeta_BWF_RunScript, 1, {'linear_cubic_H460', "LinearBWF", 2, "CubicBWF", "LinearPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});


%% Quadratic Fitting
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = transpose(zeros(5,1)) + 0.1; %Quadratic, 3 params
batch(c, @AlphaBeta_BWF_RunScript, 1, {'quadratic_linear_H460', "QuadraticBWF", 3, "LinearBWF", "QuadraticBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});
InitialGuess = transpose(zeros(6,1)) + 0.1; %Quadratic, 3 params
batch(c, @AlphaBeta_BWF_RunScript, 1, {'quadratic_quadratic_H460', "QuadraticBWF", 3, "QuadraticBWF", "QuadraticBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});
InitialGuess = transpose(zeros(7,1)) + 0.1; %Quadratic, 3 params
batch(c, @AlphaBeta_BWF_RunScript, 1, {'quadratic_cubic_H460', "QuadraticBWF", 3, "CubicBWF", "QuadraticBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});


%% Cubic Fitting
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = transpose(zeros(6,1)) + 0.1; %Cubic, 4 params
batch(c, @AlphaBeta_BWF_RunScript, 1, {'cubic_linear_H460', "CubicBWF", 4, "LinearBWF", "CubicBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});
InitialGuess = transpose(zeros(7,1)) + 0.1; %Quadratic, 3 params
batch(c, @AlphaBeta_BWF_RunScript, 1, {'cubic_quadratic_H460', "CubicBWF", 4, "QuadraticBWF", "CubicBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});
InitialGuess = transpose(zeros(8,1)) + 0.1; %Quadratic, 3 params
batch(c, @AlphaBeta_BWF_RunScript, 1, {'cubic_cubic_H460', "CubicBWF", 4, "CubicBWF", "CubicBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});


%% Fourth Fitting
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = transpose(zeros(7,1)) + 0.1; %Fourth, 5 params
batch(c, @AlphaBeta_BWF_RunScript, 1, {'fourth_linear_H460', "FourthBWF", 5, "LinearBWF", "FourthBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});
InitialGuess = transpose(zeros(8,1)) + 0.1; %Fourth, 5 params
batch(c, @AlphaBeta_BWF_RunScript, 1, {'fourth_quadratic_H460', "FourthBWF", 5, "QuadraticBWF", "FourthBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});
InitialGuess = transpose(zeros(9,1)) + 0.1; %Fourth, 5 params
batch(c, @AlphaBeta_BWF_RunScript, 1, {'fourth_cubic_H460', "FourthBWF", 5, "CubicBWF", "FourthBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});


%% Fifth Fitting
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = transpose(zeros(8,1)) + 0.1; %Fifth, 6 params
batch(c, @AlphaBeta_BWF_RunScript, 1, {'fifth_linear_H460', "FifthBWF", 6, "LinearBWF", "FifthBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});
InitialGuess = transpose(zeros(9,1)) + 0.1; %Fifth, 6 params
batch(c, @AlphaBeta_BWF_RunScript, 1, {'fifth_quadratic_H460', "FifthBWF", 6, "QuadraticBWF", "FifthBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});
InitialGuess = transpose(zeros(10,1)) + 0.1; %Fifth, 6 params
batch(c, @AlphaBeta_BWF_RunScript, 1, {'fifth_cubic_H460', "FifthBWF", 6, "CubicBWF", "FifthBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});


%% Q
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = transpose(zeros(4,1)) + 0.1; %Q, 2 params
batch(c, @AlphaBeta_BWF_RunScript, 1, {'Q_linear_H460', "QBWF", 2, "LinearBWF", "QPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});
InitialGuess = transpose(zeros(5,1)) + 0.1;
batch(c, @AlphaBeta_BWF_RunScript, 1, {'Q_quadratic_H460', "QBWF", 2, "QuadraticBWF", "QPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});
InitialGuess = transpose(zeros(6,1)) + 0.1;
batch(c, @AlphaBeta_BWF_RunScript, 1, {'Q_cubic_H460', "QBWF", 2, "CubicBWF", "QPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});


%% QE
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = transpose(zeros(5,1)) + 0.1; %QE, 3 params
batch(c, @AlphaBeta_BWF_RunScript, 1, {'QE_linear_H460', "QEBWF", 3, "LinearBWF", "QEPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});
InitialGuess = transpose(zeros(6,1)) + 0.1; %QE, 3 params
batch(c, @AlphaBeta_BWF_RunScript, 1, {'QE_quadratic_H460', "QEBWF", 3, "QuadraticBWF", "QEPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});
InitialGuess = transpose(zeros(7,1)) + 0.1; %QE, 3 params
batch(c, @AlphaBeta_BWF_RunScript, 1, {'QE_cubic_H460', "QEBWF", 3, "CubicBWF", "QEPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% QE2
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = transpose(zeros(5,1)) + 0.1; %QE2, 3 params 
batch(c, @AlphaBeta_BWF_RunScript, 1, {'QE2_linear_H460', "QE2BWF", 3, "LinearBWF", "QE2PenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});
InitialGuess = transpose(zeros(6,1)) + 0.1; %QE2, 3 params 
batch(c, @AlphaBeta_BWF_RunScript, 1, {'QE2_quadratic_H460', "QE2BWF", 3, "QuadraticBWF", "QE2PenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});
InitialGuess = transpose(zeros(7,1)) + 0.1; %QE2, 3 params 
batch(c, @AlphaBeta_BWF_RunScript, 1, {'QE2_cubic_H460', "QE2BWF", 3, "CubicBWF", "QE2PenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% LE
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = transpose(zeros(5,1)) + 0.1; %LE, 3 params 
batch(c, @AlphaBeta_BWF_RunScript, 1, {'LE_linear_H460', "LEBWF", 3, "LinearBWF", "LEPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});
InitialGuess = transpose(zeros(6,1)) + 0.1; %LE, 3 params 
batch(c, @AlphaBeta_BWF_RunScript, 1, {'LE_quadratic_H460', "LEBWF", 3, "QuadraticBWF", "LEPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});
InitialGuess = transpose(zeros(7,1)) + 0.1; %LE, 3 params 
batch(c, @AlphaBeta_BWF_RunScript, 1, {'LE_cubic_H460', "LEBWF", 3, "CubicBWF", "LEPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% LQE
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = transpose(zeros(6,1)) + 0.1; %LQE, 4 params + beta
batch(c, @AlphaBeta_BWF_RunScript, 1, {'LQE_linear_H460', "LQEBWF", 4, "LinearBWF", "LQEPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});
InitialGuess = transpose(zeros(7,1)) + 0.1; %LQE, 4 params + beta
batch(c, @AlphaBeta_BWF_RunScript, 1, {'LQE_quadratic_H460', "LQEBWF", 4, "QuadraticBWF", "LQEPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});
InitialGuess = transpose(zeros(8,1)) + 0.1; %LQE, 4 params + beta
batch(c, @AlphaBeta_BWF_RunScript, 1, {'LQE_cubic_H460', "LQEBWF", 4, "CubicBWF", "LQEPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% LE2
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = transpose(zeros(5,1)) + 0.1; %LE2, 3 params
batch(c, @AlphaBeta_BWF_RunScript, 1, {'LE2_linear_H460', "LE2BWF", 3, "LinearBWF", "LE2PenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});
InitialGuess = transpose(zeros(6,1)) + 0.1; %LE2, 3 params
batch(c, @AlphaBeta_BWF_RunScript, 1, {'LE2_quadratic_H460', "LE2BWF", 3, "QuadraticBWF", "LE2PenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});
InitialGuess = transpose(zeros(7,1)) + 0.1; %LE2, 3 params
batch(c, @AlphaBeta_BWF_RunScript, 1, {'LE2_cubic_H460', "LE2BWF", 3, "CubicBWF", "LE2PenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% LQE2
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = transpose(zeros(6,1)) + 0.1; %LQE2, 4 params 
batch(c, @AlphaBeta_BWF_RunScript, 1, {'LQE2_linear_H460', "LQE2BWF", 4, "LinearBWF", "LQE2PenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});
InitialGuess = transpose(zeros(6,1)) + 0.1; %LQE2, 4 params 
batch(c, @AlphaBeta_BWF_RunScript, 1, {'LQE2_quadratic_H460', "LQE2BWF", 4, "QuadraticBWF", "LQE2PenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});
InitialGuess = transpose(zeros(6,1)) + 0.1; %LQE2, 4 params 
batch(c, @AlphaBeta_BWF_RunScript, 1, {'LQE2_cubic_H460', "LQE2BWF", 4, "CubicBWF", "LQE2PenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% Gaussian Fitting
dynamicTemp = false;
gradientAssist = true;



%temps = [1, 5, 10, 10, 0.05];
temps = [];

InitialGuess = transpose(zeros(6,1)) + 0.1; %Gaussian, 4 params (?)
batch(c, @AlphaBeta_BWF_RunScript, 1, {'gaussian_linear_H460', "GaussianBWF", 4, "LinearBWF", "GaussianPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});
InitialGuess = transpose(zeros(7,1)) + 0.1; %Gaussian, 4 params (?)
batch(c, @AlphaBeta_BWF_RunScript, 1, {'gaussian_quadratic_H460', "GaussianBWF", 4, "QuadraticBWF", "GaussianPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});
InitialGuess = transpose(zeros(8,1)) + 0.1; %Gaussian, 4 params (?)
batch(c, @AlphaBeta_BWF_RunScript, 1, {'gaussian_cubic_H460', "GaussianBWF", 4, "CubicBWF", "GaussianPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% Skew Gaussian Fitting
dynamicTemp = false;
gradientAssist = true;

%InitialGuess = [0.1, 0.1, 0.1, 0.1, 0.1, 0.1];
%temps = [1, 1, 5, 5, 1, 0.05];
temps = [];

InitialGuess = transpose(zeros(7,1)) + 0.1; %Skew Gaussian, 5 params (?)
batch(c, @AlphaBeta_BWF_RunScript, 1, {'skewGaussian_linear_H460', "SkewGaussianBWF", 5, "LinearBWF", "SkewGaussianPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});
InitialGuess = transpose(zeros(8,1)) + 0.1; %Skew Gaussian, 5 params (?)
batch(c, @AlphaBeta_BWF_RunScript, 1, {'skewGaussian_quadratic_H460', "SkewGaussianBWF", 5, "QuadraticBWF", "SkewGaussianPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});
InitialGuess = transpose(zeros(9,1)) + 0.1; %Skew Gaussian, 5 params (?)
batch(c, @AlphaBeta_BWF_RunScript, 1, {'skewGaussian_cubic_H460', "SkewGaussianBWF", 5, "CubicBWF", "SkewGaussianPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% Morstin fitting
%[11460.000000, 2.5*power(10,-6), 2.1*power(10,-5), 2.*power(10,-7), 0.1]; Default guess
dynamicTemp = false;
gradientAssist = true;

%temps = [1000, 1e-3, 1e-3, 1e-5, 0.1];
temps = [];

InitialGuess = [11460.000000, 2.5*power(10,-6), 2.1*power(10,-5), 2.*power(10,-7), 0.1, 0.1];
batch(c, @AlphaBeta_BWF_RunScript, 1, {'morstin_linear_H460', "MorstinBWF", 4, "LinearBWF", "MorstinPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});
InitialGuess = [11460.000000, 2.5*power(10,-6), 2.1*power(10,-5), 2.*power(10,-7), 0.1, 0.1, 0.1];
batch(c, @AlphaBeta_BWF_RunScript, 1, {'morstin_quadratic_H460', "MorstinBWF", 4, "QuadraticBWF", "MorstinPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});
InitialGuess = [11460.000000, 2.5*power(10,-6), 2.1*power(10,-5), 2.*power(10,-7), 0.1, 0.1, 0.1, 0.1];
batch(c, @AlphaBeta_BWF_RunScript, 1, {'morstin_cubic_H460', "MorstinBWF", 4, "CubicBWF", "MorstinPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});
