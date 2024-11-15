%% Configure the script
filePaths = ["H460_fy/a.csv", "H460_fy/b.csv" , "H460_fy/c.csv", "H460_fy/d.csv", "H460_fy/e.csv", "H460_fy/f.csv", "H460_fy/g.csv", "H460_fy/h.csv", "H460_fy/i.csv", "H460_fy/j.csv" , "H460_fy/k.csv" , "H460_fy/l.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated
iterationsPerCyc = 100;
numCycles = 20; %formerly 250
toleranceCycles = 2; %formerly 10

%% Fourth Fitting
dynamicTemp = true;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,0.1,0.1,0.1];

% batch(c, @Generic_BWF_RunScript, 1, {'fourth_H460_fy', "FourthBWF", "FourthBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');
fourth_annealing = Generic_BWF_RunScript('fourth_H460_fy', "FourthBWF", "FourthBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps);

%% Fourth Fitting (Gradient descent only)
InitialGuess = [0.1 0.1 0.1 0.1 0.1 0.1];

fourth = Generic_GradDescentBWF_RunScript('fourth_H460_nopenalty_nogradient', "FourthBWF", "FourthBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight);
 
%% 

clusterGradientOutput = [0.0967 0.0264 0.0085 -0.0016 2.4980e-05 0.1357];
FourthCost = CostMetrics(clusterGradientOutput, filePaths, penaltyWeight, "FourthBWF", "FourthBWFPenaltyFunction", []);

%[0.252846201694721,-0.0937705607071925,0.0334828619634669,-0.00286314217570576,3.80867327316737e-05,0.117095371174697]	0.636987011581973	[0.636987011581973,0.636987011581973,0.123891422691133,-334.666053589364,0.0179962911227340,0]