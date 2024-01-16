%% Configure the script
filePaths = ["H460_fy/a.csv", "H460_fy/b.csv" , "H460_fy/c.csv", "H460_fy/d.csv", "H460_fy/e.csv", "H460_fy/f.csv", "H460_fy/g.csv", "H460_fy/h.csv", "H460_fy/i.csv", "H460_fy/j.csv" , "H460_fy/k.csv" , "H460_fy/l.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated
iterationsPerCyc = 1000000;
numCycles = 2000; %formerly 250
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
gradientAssist = false;

InitialGuess = [365.3855397,	-365.306189,	4.936804267,	-130.9623845,	0.111088012]; 
temps = [];

batch(c, @Generic_BWF_RunScript, 1, {'gaussian_H460_fy', "GaussianBWF", "GaussianPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting')

%% Skew Gaussian Fitting (H460)
dynamicTemp = true;
gradientAssist = false;

InitialGuess = [391.6898039, -391.3083071,	-0.384981504,	135.7874827,	0.049276761,	0.110958507];
temps = [];

batch(c, @Generic_BWF_RunScript, 1, {'skewGaussian_H460_fy', "SkewGaussianBWF", "SkewGaussianPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting')

%% Configure the script
filePaths = ["H1437_fy/a.csv", "H1437_fy/b.csv" , "H1437_fy/c.csv", "H1437_fy/d.csv", "H1437_fy/e.csv", "H1437_fy/f.csv", "H1437_fy/g.csv", "H1437_fy/h.csv", "H1437_fy/i.csv", "H1437_fy/j.csv" , "H1437_fy/k.csv" , "H1437_fy/l.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated
iterationsPerCyc = 1000000;
numCycles = 2000; %formerly 250
toleranceCycles = 400; %formerly 10

%% Gaussian (H1437)
dynamicTemp = true;
gradientAssist = true;

InitialGuess = [176.941651,	-176.8937992,	3.673499028,	-149.9077311,	0.035632101]; 
temps = [1, 5, 10, 10, 0.05];

batch(c, @Generic_BWF_RunScript, 1, {'gaussian_H1437_fy_Pristine', "GaussianBWF", "GaussianPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting')

%% Configure the script
filePaths = ["U87_pristine_fy/1.1.csv","U87_pristine_fy/3.9.csv","U87_pristine_fy/6.7.csv","U87_pristine_fy/11.6.csv","U87_pristine_fy/17.7.csv","U87_pristine_fy/22.5.csv","U87_SOBP_fy/1.27.csv","U87_SOBP_fy/3.csv","U87_SOBP_fy/4.4.csv","U87_SOBP_fy/13.7.csv","U87_SOBP_fy/20.9.csv","U87_SOBP_fy/25.4.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated
iterationsPerCyc = 1000000;
numCycles = 2000; %formerly 250
toleranceCycles = 400; %formerly 10

%% Fifth (U87)
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.232749584,	0.032225699,	-1.85E-06,	-3.21E-05,	5.88E-07, 1e-9,	0.040252019];

batch(c, @Generic_BWF_RunScript, 1, {'fifth_U87_Combined_fy', "FifthBWF", "FifthBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% Configure the script
filePaths = ["AGO_pristine_fy/1.1.csv","AGO_pristine_fy/3.9.csv","AGO_pristine_fy/6.7.csv","AGO_pristine_fy/11.6.csv","AGO_pristine_fy/17.7.csv","AGO_pristine_fy/22.5.csv", "AGO_SOBP_fy/1.27.csv","AGO_SOBP_fy/3.csv","AGO_SOBP_fy/4.4.csv","AGO_SOBP_fy/13.7.csv","AGO_SOBP_fy/20.9.csv","AGO_SOBP_fy/25.4.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated
iterationsPerCyc = 1000000;
numCycles = 2000; %formerly 250
toleranceCycles = 400; %formerly 10

%% Fifth (AGO)
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.965164749,	0.004700883,	0.048997964,	-0.004842415,	0.000107185,	-5.89E-07,	-0.001830557];

batch(c, @Generic_BWF_RunScript, 1, {'fifth_AGO_Combined_fy', "FifthBWF", "FifthBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% Configure the script
filePaths = ["AGO_pristine_fy/1.1.csv","AGO_pristine_fy/3.9.csv","AGO_pristine_fy/6.7.csv","AGO_pristine_fy/11.6.csv","AGO_pristine_fy/17.7.csv","AGO_pristine_fy/22.5.csv", "AGO_SOBP_fy/1.27.csv","AGO_SOBP_fy/3.csv","AGO_SOBP_fy/4.4.csv","AGO_SOBP_fy/13.7.csv","AGO_SOBP_fy/20.9.csv","AGO_SOBP_fy/25.4.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated
iterationsPerCyc = 1000000;
numCycles = 2000; %formerly 250
toleranceCycles = 400; %formerly 10

%% Fourth LETd fitting (AGO)
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [1.027728648,	0.054325839,	-0.000627503,	-6.54E-06, 1e-8,	-0.008966927];

batch(c, @RunScript_LETFixedBeta, 1, {'fourth_AGO_Combined_SingleBeta_LETAnnealing', "FourthBWF", filePaths, InitialGuess,  iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');
