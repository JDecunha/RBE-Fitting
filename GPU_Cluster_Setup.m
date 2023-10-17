configCluster
c = parcluster;
c.AdditionalProperties.WallTime = '02:00';
c.AdditionalProperties.MemUsage = '16';
c.AdditionalProperties.GpusPerNode = 1;
c.AdditionalProperties.GpuMemUsage = "16";
c.AdditionalProperties.AdditionalSubmitArgs = '-n 2' % -q egpu-medium -gpu num=1:gmem=16'; 
c.saveProfile

%% Linear Fitting
filePaths = ["a.csv", "b.csv" , "c.csv", "d.csv", "e.csv", "f.csv", "g.csv", "h.csv", "i.csv", "j.csv" , "k.csv" , "l.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated
iterationsPerCyc = 2500;
numCycles = 1;
toleranceCycles = 10;
dynamicTemp = true;
gradientAssist = true;

InitialGuess = [0.122365050472956,0.0529226583994300,0.0871961766426740];
%Generic_BWF_Weighted_RunScript('linear_H460_penalty', "LinearBWF", "LinearPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist);
j = c.batch(@Generic_BWF_Weighted_RunScript, 1, {'linear_H460_penalty', "LinearBWF", "LinearPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist},'AutoAddClientPath',true,'CurrentFolder','.')
%-q egpu-medium -gpu num=1:gmem=16
%j = c.batch(@H460_Linear_BWF_Fitting, 1,{},'AutoAddClientPath',true,'CurrentFolder','.');