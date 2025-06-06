%% Config for cluster
%configCluster
c = parcluster;

c.AdditionalProperties.WallTime = '58:00';
c.AdditionalProperties.MemUsage = 16.;
c.AdditionalProperties.GpusPerNode = 1;
c.AdditionalProperties.GpuMemUsage = 16.;
c.AdditionalProperties.QueueName = 'egpu-medium';
c.AdditionalProperties.AdditionalSubmitArgs = "-n 10 -R 'hname!=edragon057' "; % -q egpu-medium -gpu num=1:gmem=16'; 
c.saveProfile;

% %% Configure the script
% filePaths = ["H460_fy/a.csv", "H460_fy/b.csv" , "H460_fy/c.csv", "H460_fy/d.csv", "H460_fy/e.csv", "H460_fy/f.csv", "H460_fy/g.csv", "H460_fy/h.csv", "H460_fy/i.csv", "H460_fy/j.csv" , "H460_fy/k.csv" , "H460_fy/l.csv"];
% penaltyWeight = 0.; %typically make my penalty 30 when it's activated
% iterationsPerCyc = 100000;
% numCycles = 500; %formerly 250
% toleranceCycles = 50; %formerly 10
% 
% %% Gaussian Fitting
% dynamicTemp = true;
% gradientAssist = true;
% 
% InitialGuess = [0.1, 0.1, 0.1, 0.1]; 
% temps = [];
% 
% batch(c, @Generic_BWF_RunScript, 1, {'gaussian_H460_fy', "GaussianBWF", "GaussianPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting')
% 
% %% Skew Gaussian Fitting
% dynamicTemp = true;
% gradientAssist = true;
% 
% InitialGuess = [0.1, 0.1, 0.1, 0.1, 0.1];
% temps = [];
% 
% batch(c, @Generic_BWF_RunScript, 1, {'skewGaussian_H460_fy', "SkewGaussianBWF", "SkewGaussianPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting')
% 
% %% Morstin fitting
% dynamicTemp = true;
% gradientAssist = true;
% 
% %This guess is based on H460-LQE
% InitialGuess = [9700, 60*power(10,-6), -11*power(10,-7), 1.67*power(10,-7), 0.1];
% temps = [];
% 
% batch(c, @Generic_BWF_RunScript, 1, {'morstin_H460_fy', "MorstinBWF", "MorstinPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting')
% 
% %% Configure the script
% filePaths = ["H1437_fy/a.csv", "H1437_fy/b.csv" , "H1437_fy/c.csv", "H1437_fy/d.csv", "H1437_fy/e.csv", "H1437_fy/f.csv", "H1437_fy/g.csv", "H1437_fy/h.csv", "H1437_fy/i.csv", "H1437_fy/j.csv" , "H1437_fy/k.csv" , "H1437_fy/l.csv"];
% penaltyWeight = 0.; %typically make my penalty 30 when it's activated
% iterationsPerCyc = 100000;
% numCycles = 500; %formerly 250
% toleranceCycles = 50; %formerly 10
% 
% %% Gaussian Fitting
% dynamicTemp = true;
% gradientAssist = true;
% 
% 
% InitialGuess = [0.1, 0.1, 0.1, 0.1]; %Morstin inspired guess
% temps = [];
% 
% batch(c, @Generic_BWF_RunScript, 1, {'gaussian_H1437_fy_Pristine', "GaussianBWF", "GaussianPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting')
% 
% %% Skew Gaussian Fitting
% dynamicTemp = true;
% gradientAssist = true;
% 
% InitialGuess = [0.1, 0.1, 0.1, 0.1, 0.1];
% temps = [];
% 
% batch(c, @Generic_BWF_RunScript, 1, {'skewGaussian_H1437_fy_Pristine', "SkewGaussianBWF", "SkewGaussianPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting')
% 
% %% Morstin fitting
% %[11460.000000, 2.5*power(10,-6), 2.1*power(10,-5), 2.*power(10,-7), 0.1]; Default guess
% dynamicTemp = true;
% gradientAssist = true;
% 
% InitialGuess = [9700, 60*power(10,-6), -11*power(10,-7), 1.67*power(10,-7), 0.1];
% temps = [];
% 
% batch(c, @Generic_BWF_RunScript, 1, {'morstin_H1437_fy_Pristine', "MorstinBWF", "MorstinPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting')

%% Configure the script
filePaths = ["U87_pristine_fy/1.1.csv","U87_pristine_fy/3.9.csv","U87_pristine_fy/6.7.csv","U87_pristine_fy/11.6.csv","U87_pristine_fy/17.7.csv","U87_pristine_fy/22.5.csv","U87_SOBP_fy/1.27.csv","U87_SOBP_fy/3.csv","U87_SOBP_fy/4.4.csv","U87_SOBP_fy/13.7.csv","U87_SOBP_fy/20.9.csv","U87_SOBP_fy/25.4.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated
iterationsPerCyc = 1000000;
numCycles = 500; %formerly 250
toleranceCycles = 50; %formerly 10

%% Gaussian Fitting
dynamicTemp = true;
gradientAssist = true;

InitialGuess = [0.1, 0.1, 0.1, 0.1]; %Morstin inspired guess
temps = [];

batch(c, @Generic_BWF_RunScript, 1, {'gaussian_U87_Combined_fy', "GaussianBWF", "GaussianPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting')

%% Skew Gaussian Fitting
dynamicTemp = true;
gradientAssist = true;

InitialGuess = [0.1, 0.1, 0.1, 0.1, 0.1];
temps = [];

batch(c, @Generic_BWF_RunScript, 1, {'skewGaussian_U87_Combined_fy', "SkewGaussianBWF", "SkewGaussianPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting')

%% Morstin fitting
%[11460.000000, 2.5*power(10,-6), 2.1*power(10,-5), 2.*power(10,-7), 0.1]; Default guess
dynamicTemp = true;
gradientAssist = true;

InitialGuess = [9700, 60*power(10,-6), -11*power(10,-7), 1.67*power(10,-7), 0.1];
temps = [];

batch(c, @Generic_BWF_RunScript, 1, {'morstin_U87_Combined_fy', "MorstinBWF", "MorstinPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting')

%% Configure the script
filePaths = ["AGO_pristine_fy/1.1.csv","AGO_pristine_fy/3.9.csv","AGO_pristine_fy/6.7.csv","AGO_pristine_fy/11.6.csv","AGO_pristine_fy/17.7.csv","AGO_pristine_fy/22.5.csv", "AGO_SOBP_fy/1.27.csv","AGO_SOBP_fy/3.csv","AGO_SOBP_fy/4.4.csv","AGO_SOBP_fy/13.7.csv","AGO_SOBP_fy/20.9.csv","AGO_SOBP_fy/25.4.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated
iterationsPerCyc = 1000000;
numCycles = 500; %formerly 250
toleranceCycles = 50; %formerly 10

%% Linear Fitting
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [1.021890472,	0.06532889,	2.70E-07];

batch(c, @Generic_BWF_RunScript, 1, {'linear_AGO_Combined_fy', "LinearBWF", "LinearPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% Fifth Fitting
dynamicTemp = true;
gradientAssist = true;

InitialGuess = [0.926872372,	0.002598804,	0.050450688,	-0.004974473,	0.000109976,	-6.04E-07,	0.009918898];
temps = [];

batch(c, @Generic_BWF_RunScript, 1, {'fifth_AGO_Combined_fy', "FifthBWF", "FifthBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');


%% Gaussian Fitting
dynamicTemp = true;
gradientAssist = true;

InitialGuess = [0.1, 0.1, 0.1, 0.1]; 
temps = [];

batch(c, @Generic_BWF_RunScript, 1, {'gaussian_AGO_Combined_fy', "GaussianBWF", "GaussianPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting')

%% Skew Gaussian Fitting
dynamicTemp = true;
gradientAssist = true;

InitialGuess = [0.1, 0.1, 0.1, 0.1, 0.1];
temps = [];

batch(c, @Generic_BWF_RunScript, 1, {'skewGaussian_AGO_Combined_fy', "SkewGaussianBWF", "SkewGaussianPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting')

%% Morstin fitting
%[11460.000000, 2.5*power(10,-6), 2.1*power(10,-5), 2.*power(10,-7), 0.1]; Default guess
dynamicTemp = true;
gradientAssist = true;

InitialGuess = [9700, 60*power(10,-6), -11*power(10,-7), 1.67*power(10,-7), 0.1];
temps = [];

batch(c, @Generic_BWF_RunScript, 1, {'morstin_AGO_Combined_fy', "MorstinBWF", "MorstinPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting')
