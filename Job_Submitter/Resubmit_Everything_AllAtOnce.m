%% Configure the script
filePaths = ["H460_fy/a.csv", "H460_fy/b.csv" , "H460_fy/c.csv", "H460_fy/d.csv", "H460_fy/e.csv", "H460_fy/f.csv", "H460_fy/g.csv", "H460_fy/h.csv", "H460_fy/i.csv", "H460_fy/j.csv" , "H460_fy/k.csv" , "H460_fy/l.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated
iterationsPerCyc = 1000000;
numCycles = 4000; %formerly 250
toleranceCycles = 400; %formerly 10

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

InitialGuess = [-0.073383743,	0.061204505,	18.22642843,	0.029432727]; %LE2, 3 params + beta

batch(c, @Generic_BWF_RunScript, 1, {'LE2_H460_fy', "LE2BWF", "LE2PenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% Configure the script
filePaths = ["H1437_fy/a.csv", "H1437_fy/b.csv" , "H1437_fy/c.csv", "H1437_fy/d.csv", "H1437_fy/e.csv", "H1437_fy/f.csv", "H1437_fy/g.csv", "H1437_fy/h.csv", "H1437_fy/i.csv", "H1437_fy/j.csv" , "H1437_fy/k.csv" , "H1437_fy/l.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated
iterationsPerCyc = 1000000;
numCycles = 4000; %formerly 250
toleranceCycles = 400; %formerly 10

%% Configure the script
filePaths = ["AGO_pristine_fy/1.1.csv","AGO_pristine_fy/3.9.csv","AGO_pristine_fy/6.7.csv","AGO_pristine_fy/11.6.csv","AGO_pristine_fy/17.7.csv","AGO_pristine_fy/22.5.csv", "AGO_SOBP_fy/1.27.csv","AGO_SOBP_fy/3.csv","AGO_SOBP_fy/4.4.csv","AGO_SOBP_fy/13.7.csv","AGO_SOBP_fy/20.9.csv","AGO_SOBP_fy/25.4.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated
iterationsPerCyc = 1000000;
numCycles = 4000; %formerly 250
toleranceCycles = 400; %formerly 10

%% Linear Fitting (AGO)
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [1.021890469,	0.06532889,	2.70E-07];

batch(c, @Generic_BWF_RunScript, 1, {'linear_AGO_Combined_fy', "LinearBWF", "LinearPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% LE (AGO)
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.021891274,	0.065328885,	-5.13E-09,	1.08E-08]; %LE, 3 params + beta

batch(c, @Generic_BWF_RunScript, 1, {'LE_AGO_Combined_fy', "LEBWF", "LEPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');


%% Fifth (AGO)
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.965845701,	0.001925516,	0.049615107,	-0.004880982,	0.000107975,	-5.94E-07,	-0.001325147];

%batch(c, @Generic_BWF_RunScript, 1, {'fifth_AGO_Combined_fy', "FifthBWF", "FifthBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% Configure the script
filePaths = ["AGO_pristine_fy/1.1.csv","AGO_pristine_fy/3.9.csv","AGO_pristine_fy/6.7.csv","AGO_pristine_fy/11.6.csv","AGO_pristine_fy/17.7.csv","AGO_pristine_fy/22.5.csv", "AGO_SOBP_fy/1.27.csv","AGO_SOBP_fy/3.csv","AGO_SOBP_fy/4.4.csv","AGO_SOBP_fy/13.7.csv","AGO_SOBP_fy/20.9.csv","AGO_SOBP_fy/25.4.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated
iterationsPerCyc = 1000000;
numCycles = 4000; %formerly 250
toleranceCycles = 400; %formerly 10

%% Linear Fitting (AGO-LET)
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [1.06978497,	0.033974762,	7.02E-09];

batch(c, @RunScript_LETFixedBeta, 1, {'linear_AGO_Combined_SingleBeta_LETAnnealing', "LinearBWF", filePaths, InitialGuess,  iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% LE (AGO-LET)
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.069784549,	0.033974758,	-1.00E-08,	1.39E-07]; %LE, 3 params + beta

batch(c, @RunScript_LETFixedBeta, 1, {'LE_AGO_Combined_SingleBeta_LETAnnealing', "LEBWF", filePaths, InitialGuess,  iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');


%% LQE (AGO-LET)
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [-0.004706622,	0.074824113,	-0.001027411,	0.017851669,	2.90E-07]; %LQE, 4 params + beta

batch(c, @RunScript_LETFixedBeta, 1, {'LQE_AGO_Combined_SingleBeta_LETAnnealing', "LQEBWF", filePaths, InitialGuess,  iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

