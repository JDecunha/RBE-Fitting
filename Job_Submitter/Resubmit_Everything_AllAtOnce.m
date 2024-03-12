%% Configure the script
filePaths = ["H460_fy/a.csv", "H460_fy/b.csv" , "H460_fy/c.csv", "H460_fy/d.csv", "H460_fy/e.csv", "H460_fy/f.csv", "H460_fy/g.csv", "H460_fy/h.csv", "H460_fy/i.csv", "H460_fy/j.csv" , "H460_fy/k.csv" , "H460_fy/l.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated
iterationsPerCyc = 1000000;
numCycles = 4000; %formerly 250
toleranceCycles = 400; %formerly 10
CalculateNumberOfExperiments(filePaths);

%% Config for cluster
%c = parcluster('Desktop-10700k');
%c = parcluster('GA401');

%configCluster
c = parcluster;

c.AdditionalProperties.WallTime = '72:00';
c.AdditionalProperties.MemUsage = 16.;
c.AdditionalProperties.GpusPerNode = 1;
c.AdditionalProperties.GpuMemUsage = 16.;
c.AdditionalProperties.QueueName = 'egpu-medium';
c.AdditionalProperties.AdditionalSubmitArgs = '-n 10' % -q egpu-medium -gpu num=1:gmem=16'; 
c.saveProfile

%% LE2
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1];
RunScript_LETFixedBeta('LE2_H460_Combined_SingleBeta_LETAnnealing', "LE2BWF", filePaths, InitialGuess,  iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps);
batch(c, @RunScript_LETFixedBeta, 1, {'LE2_H460_Combined_SingleBeta_LETAnnealing', "LE2BWF", filePaths, InitialGuess,  iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% Configure the script
filePaths = ["H1437_fy/a.csv", "H1437_fy/b.csv" , "H1437_fy/c.csv", "H1437_fy/d.csv", "H1437_fy/e.csv", "H1437_fy/f.csv", "H1437_fy/g.csv", "H1437_fy/h.csv", "H1437_fy/i.csv", "H1437_fy/j.csv" , "H1437_fy/k.csv" , "H1437_fy/l.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated
iterationsPerCyc = 1000000;
numCycles = 4000; %formerly 250
toleranceCycles = 400; %formerly 10
CalculateNumberOfExperiments(filePaths);

%% LE
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.022185878,	0.03018006,	2.908511599,	0.027290154]; %LE, 3 params + beta

batch(c, @RunScript_LETFixedBeta, 1, {'LE_H1437_SingleBeta_LETAnnealing', "LEBWF", filePaths, InitialGuess,  iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% LE2
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.035784485,	0.029547262,	4.091453371,	0.025834662];

batch(c, @RunScript_LETFixedBeta, 1, {'LE2_H1437_SingleBeta_LETAnnealing', "LE2BWF", filePaths, InitialGuess,  iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');


%% Configure the script
filePaths = ["U87_pristine_fy/1.1.csv","U87_pristine_fy/3.9.csv","U87_pristine_fy/6.7.csv","U87_pristine_fy/11.6.csv","U87_pristine_fy/17.7.csv","U87_pristine_fy/22.5.csv","U87_SOBP_fy/1.27.csv","U87_SOBP_fy/3.csv","U87_SOBP_fy/4.4.csv","U87_SOBP_fy/13.7.csv","U87_SOBP_fy/20.9.csv","U87_SOBP_fy/25.4.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated
iterationsPerCyc = 1000000;
numCycles = 4000; %formerly 250
toleranceCycles = 400; %formerly 10
CalculateNumberOfExperiments(filePaths);


%% Configure the script
filePaths = ["AGO_pristine_fy/1.1.csv","AGO_pristine_fy/3.9.csv","AGO_pristine_fy/6.7.csv","AGO_pristine_fy/11.6.csv","AGO_pristine_fy/17.7.csv","AGO_pristine_fy/22.5.csv", "AGO_SOBP_fy/1.27.csv","AGO_SOBP_fy/3.csv","AGO_SOBP_fy/4.4.csv","AGO_SOBP_fy/13.7.csv","AGO_SOBP_fy/20.9.csv","AGO_SOBP_fy/25.4.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated
iterationsPerCyc = 1000000;
numCycles = 4000; %formerly 250
toleranceCycles = 400; %formerly 10
CalculateNumberOfExperiments(filePaths);

%% Linear Fitting
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [1.021854991,	0.065335599,	3.61E-08];

batch(c, @Generic_BWF_RunScript, 1, {'linear_AGO_Combined_fy', "LinearBWF", "LinearPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% Fifth Fitting
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.927870889,	0.002678241,	0.050528056,	-0.004984061,	0.00011021,	-6.05E-07,	0.009480013];

batch(c, @Generic_BWF_RunScript, 1, {'fifth_AGO_Combined_fy', "FifthBWF", "FifthBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% LE
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.021891264,	0.065328888,	-1.40E-09,	1.35E-08]; %LE, 3 params + beta

batch(c, @Generic_BWF_RunScript, 1, {'LE_AGO_Combined_fy', "LEBWF", "LEPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% Gaussian Fitting
dynamicTemp = true;
gradientAssist = true;


InitialGuess = [3748.73182047285,9.86217357391221,0.00548284348021055,1e-8]; 
temps = [];

batch(c, @Generic_BWF_RunScript, 1, {'gaussian_AGO_Combined_fy', "GaussianBWF", "GaussianPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting')

%% Linear Fitting
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.040524473,	0.02936032,	0.025198583];

batch(c, @RunScript_LETFixedBeta, 1, {'linear_AGO_Combined_SingleBeta_LETAnnealing', "LinearBWF", filePaths, InitialGuess,  iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% LE
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.022185878,	0.03018006,	2.908511599,	0.027290154]; %LE, 3 params + beta

batch(c, @RunScript_LETFixedBeta, 1, {'LE_AGO_Combined_SingleBeta_LETAnnealing', "LEBWF", filePaths, InitialGuess,  iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% LQE
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [-0.977111974,	-0.058524397,	-0.006535253,	-0.087450278,	0.035327856]; %LQE, 4 params + beta

batch(c, @RunScript_LETFixedBeta, 1, {'LQE_AGO_Combined_SingleBeta_LETAnnealing', "LQEBWF", filePaths, InitialGuess,  iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');
%% LE2
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.035784485,	0.029547262,	4.091453371,	0.025834662];

batch(c, @RunScript_LETFixedBeta, 1, {'LE2_AGO_Combined_SingleBeta_LETAnnealing', "LE2BWF", filePaths, InitialGuess,  iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');
