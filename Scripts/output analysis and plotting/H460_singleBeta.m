%% Linear Fitting
batch(c, @Generic_BWF_RunScript, 1, {'linear_H460_fy', "LinearBWF", "LinearPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');


%% Quadratic Fitting
batch(c, @Generic_BWF_RunScript, 1, {'quadratic_H460_fy', "QuadraticBWF", "QuadraticBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');


%% Cubic Fitting
batch(c, @Generic_BWF_RunScript, 1, {'cubic_H460_fy', "CubicBWF", "CubicBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');


%% Fourth Fitting
batch(c, @Generic_BWF_RunScript, 1, {'fourth_H460_fy', "FourthBWF", "FourthBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');


%% Fifth Fitting
batch(c, @Generic_BWF_RunScript, 1, {'fifth_H460_fy', "FifthBWF", "FifthBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% Q
batch(c, @Generic_BWF_RunScript, 1, {'Q_H460_fy', "QBWF", "QPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% QE
batch(c, @Generic_BWF_RunScript, 1, {'QE_H460_fy', "QEBWF", "QEPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% QE2
batch(c, @Generic_BWF_RunScript, 1, {'QE2_H460_fy', "QE2BWF", "QE2PenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% LE
batch(c, @Generic_BWF_RunScript, 1, {'LE_H460_fy', "LEBWF", "LEPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% LQE
batch(c, @Generic_BWF_RunScript, 1, {'LQE_H460_fy', "LQEBWF", "LQEPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% LE2
batch(c, @Generic_BWF_RunScript, 1, {'LE2_H460_fy', "LE2BWF", "LE2PenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% LQE2
batch(c, @Generic_BWF_RunScript, 1, {'LQE2_H460_fy', "LQE2BWF", "LQE2PenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% Gaussian Analysis

%BWF Plotting
GaussSolution = [365.3855397,	-365.306189,	4.936804267,	-130.9623845]; 
[GaussX,GaussY] = GetBWFVals("GaussianBWF",GaussSolution);
plot(GaussX, GaussY);

%% Skew Gaussian analysis

%BWF Plotting
SkewGaussSolution = [391.6898039,	-391.3083071,	-0.384981504,	135.7874827,	0.049276761]; 
[SkewX,SkewY] = GetBWFVals("SkewGaussianBWF",SkewGaussSolution);
plot(SkewX, SkewY);

%% Morstin analysis

%BWF Plotting
InitialGuess = [18000, 600*power(10,-6), -150*power(10,-7), 8.37*power(10,-7), -10];
MorstinSolution = [-413.8939209,	-0.01829814,	0.000220401,	-1.60E-06,	-7.299325439]; %cost: 0.763955878
[morstX,morstY] = GetBWFVals("MorstinBWF",MorstinSolution);
plot(morstX, morstY);