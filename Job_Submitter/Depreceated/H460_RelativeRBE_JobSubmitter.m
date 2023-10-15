%% Configure the script
filePaths = ["a.csv", "b.csv" , "c.csv", "d.csv", "e.csv", "f.csv", "g.csv", "h.csv", "i.csv", "j.csv" , "k.csv" , "l.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated
iterationsPerCyc = 250000;
numCycles = 500;
toleranceCycles = 5;
dynamicTemp = false;
gradientAssist = true;

H460alpharef =  0.268;
H460betaref = 0.097;

%%
c = parcluster('Desktop-10700k');

%% Gaussian Fitting Relative RBE
InitialGuess = [1,90,80];
Temps = [1 10 10];

GaussianRelJob = batch(c, @Generic_BWF_RBE_RunScript, 1, {'gaussian_H460_Relative_nopenalty_withgradient_customtemp', "GaussianBWFRelative", "GaussianRelativePenaltyFunction", filePaths, InitialGuess, H460alpharef, H460betaref, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, Temps});

