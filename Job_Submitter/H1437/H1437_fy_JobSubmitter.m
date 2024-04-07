%% Configure the script
filePaths = ["H1437_fy/a.csv", "H1437_fy/b.csv" , "H1437_fy/c.csv", "H1437_fy/d.csv", "H1437_fy/e.csv", "H1437_fy/f.csv", "H1437_fy/g.csv", "H1437_fy/h.csv", "H1437_fy/i.csv", "H1437_fy/j.csv" , "H1437_fy/k.csv" , "H1437_fy/l.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated
iterationsPerCyc = 100000;
numCycles = 500; %formerly 250
toleranceCycles = 50; %formerly 10

%% Config for cluster
%c = parcluster('Desktop-10700k');
%c = parcluster('GA401');

%configCluster
c = parcluster;

c.AdditionalProperties.WallTime = '30:00';
c.AdditionalProperties.MemUsage = 16.;
c.AdditionalProperties.GpusPerNode = 1;
c.AdditionalProperties.GpuMemUsage = 16.;
c.AdditionalProperties.QueueName = 'egpu-medium';
c.AdditionalProperties.AdditionalSubmitArgs = "-n 10 -R 'hname!=edragon057' " % -q egpu-medium -gpu num=1:gmem=16'; 
c.saveProfile;


%% Linear Fitting
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1];

batch(c, @Generic_BWF_RunScript, 1, {'linear_H1437_fy_Pristine', "LinearBWF", "LinearPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');


%% Quadratic Fitting
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1];

batch(c, @Generic_BWF_RunScript, 1, {'quadratic_H1437_fy_Pristine', "QuadraticBWF", "QuadraticBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');


%% Cubic Fitting
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1,0.1];

batch(c, @Generic_BWF_RunScript, 1, {'cubic_H1437_fy_Pristine', "CubicBWF", "CubicBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');


%% Fourth Fitting
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1,0.1,0.1];

batch(c, @Generic_BWF_RunScript, 1, {'fourth_H1437_fy_Pristine', "FourthBWF", "FourthBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');


%% Fifth Fitting
dynamicTemp = true;
gradientAssist = true;
temps = [];

%InitialGuess = [0.1,0.1,0.1,0.1,0.1,0.1,0.1];
InitialGuess = [0.072414286,	-0.0512998,	0.025114619,	-0.002109749,	2.68E-05, 1e-8,	0.03576156];

batch(c, @Generic_BWF_RunScript, 1, {'fifth_H1437_fy_Pristine', "FifthBWF", "FifthBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% Q
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1]; %Q, 2 params + beta

batch(c, @Generic_BWF_RunScript, 1, {'Q_H1437_fy_Pristine', "QBWF", "QPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% QE
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1]; %QE, 3 params + beta

batch(c, @Generic_BWF_RunScript, 1, {'QE_H1437_fy_Pristine', "QEBWF", "QEPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% QE2
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1]; %QE2, 3 params + beta

batch(c, @Generic_BWF_RunScript, 1, {'QE2_H1437_fy_Pristine', "QE2BWF", "QE2PenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% LE
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1]; %LE, 3 params + beta

batch(c, @Generic_BWF_RunScript, 1, {'LE_H1437_fy_Pristine', "LEBWF", "LEPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% LQE
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1,0.1]; %LQE, 4 params + beta

batch(c, @Generic_BWF_RunScript, 1, {'LQE_H1437_fy_Pristine', "LQEBWF", "LQEPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% LE2
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1];

batch(c, @Generic_BWF_RunScript, 1, {'LE2_H1437_fy_Pristine', "LE2BWF", "LE2PenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% LQE2
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1,0.1]; %LQE2, 4 params + beta

batch(c, @Generic_BWF_RunScript, 1, {'LQE2_H1437_fy_Pristine', "LQE2BWF", "LQE2PenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% Gaussian Fitting
dynamicTemp = true;
gradientAssist = true;


InitialGuess = [0.1, 0.1, 0.1, 0.1, 0.1]; %Morstin inspired guess
temps = [];

batch(c, @Generic_BWF_RunScript, 1, {'gaussian_H1437_fy_Pristine', "GaussianBWF", "GaussianPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting')

%% Skew Gaussian Fitting
dynamicTemp = true;
gradientAssist = true;

InitialGuess = [0.1, 0.1, 0.1, 0.1, 0.1, 0.1];
temps = [];

batch(c, @Generic_BWF_RunScript, 1, {'skewGaussian_H1437_fy_Pristine', "SkewGaussianBWF", "SkewGaussianPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting')

%% Morstin fitting
%[11460.000000, 2.5*power(10,-6), 2.1*power(10,-5), 2.*power(10,-7), 0.1]; Default guess
dynamicTemp = true;
gradientAssist = true;

InitialGuess = [18000, 600*power(10,-6), -150*power(10,-7), 8.37*power(10,-7), -10, 0.1];
temps = [];

batch(c, @Generic_BWF_RunScript, 1, {'morstin_H1437_fy_Pristine', "MorstinBWF", "MorstinPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting')