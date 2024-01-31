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

%% Gaussian Fitting (H460)
dynamicTemp = true;
gradientAssist = true;

InitialGuess = [458.7904128	-458.7098926	4.941826807	-147.2746558	0.110917848]; 
temps = [];

batch(c, @Generic_BWF_RunScript, 1, {'gaussian_H460_fy', "GaussianBWF", "GaussianPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting')

%% Skew Gaussian Fitting (H460)
dynamicTemp = true;
gradientAssist = true;

InitialGuess = [428.789837,	-428.4073007,	-0.387080488,	142.1516424,	0.047175568,	0.11080882];
temps = [];

batch(c, @Generic_BWF_RunScript, 1, {'skewGaussian_H460_fy', "SkewGaussianBWF", "SkewGaussianPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting')

%% Morstin fitting (H460)
%[11460.000000, 2.5*power(10,-6), 2.1*power(10,-5), 2.*power(10,-7), 0.1]; Default guess
dynamicTemp = true;
gradientAssist = true;

%This guess is based on H460-LQE
InitialGuess = [18000, 600*power(10,-6), -150*power(10,-7), 8.37*power(10,-7), -10, 0.1];
temps = [];

batch(c, @Generic_BWF_RunScript, 1, {'morstin_H460_fy', "MorstinBWF", "MorstinPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting')

%% Configure the script
filePaths = ["H1437_fy/a.csv", "H1437_fy/b.csv" , "H1437_fy/c.csv", "H1437_fy/d.csv", "H1437_fy/e.csv", "H1437_fy/f.csv", "H1437_fy/g.csv", "H1437_fy/h.csv", "H1437_fy/i.csv", "H1437_fy/j.csv" , "H1437_fy/k.csv" , "H1437_fy/l.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated
iterationsPerCyc = 1000000;
numCycles = 4000; %formerly 250
toleranceCycles = 400; %formerly 10

%% Gaussian (H1437)
dynamicTemp = true;
gradientAssist = true;

InitialGuess = [221.7873807,	-221.7390922,	3.65552245,	-168.4871907,	0.035619545]; 
temps = [];

batch(c, @Generic_BWF_RunScript, 1, {'gaussian_H1437_fy_Pristine', "GaussianBWF", "GaussianPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting')

%% Configure the script
filePaths = ["AGO_pristine_fy/1.1.csv","AGO_pristine_fy/3.9.csv","AGO_pristine_fy/6.7.csv","AGO_pristine_fy/11.6.csv","AGO_pristine_fy/17.7.csv","AGO_pristine_fy/22.5.csv", "AGO_SOBP_fy/1.27.csv","AGO_SOBP_fy/3.csv","AGO_SOBP_fy/4.4.csv","AGO_SOBP_fy/13.7.csv","AGO_SOBP_fy/20.9.csv","AGO_SOBP_fy/25.4.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated
iterationsPerCyc = 1000000;
numCycles = 4000; %formerly 250
toleranceCycles = 400; %formerly 10

%% Fifth (AGO)
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.965845701,	0.001925516,	0.049615107,	-0.004880982,	0.000107975,	-5.94E-07,	-0.001325147];

batch(c, @Generic_BWF_RunScript, 1, {'fifth_AGO_Combined_fy', "FifthBWF", "FifthBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

