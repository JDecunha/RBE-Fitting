%% Configure the script
filePaths = ["a.csv", "b.csv" , "c.csv", "d.csv", "e.csv", "f.csv", "g.csv", "h.csv", "i.csv", "j.csv" , "k.csv" , "l.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated
iterationsPerCyc = 500;
numCycles = 2;
toleranceCycles = 25;

H460alpharef =  0.268;
H460betaref = 0.097;

%%
c = parcluster('Desktop-10700k');

%% Gaussian Fitting Relative RBE
InitialGuess = [2,70,10];
Temps = [3 10 5];

%[14.7375543577977,32.6277566664655,8.67468784085912]

Generic_BWF_RBE_RunScript('gaussian_H460_nopenalty_nogradient_defaulttemp', "GaussianBWFRelative", "GaussianRelativePenaltyFunction", filePaths, InitialGuess, H460alpharef, H460betaref, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, false, false, [3 10 5]);


%Generic_BWF_RBE_RunScript('gaussian_H460_nopenalty_nogradient_defaulttemp', "GaussianBWFRelative", "GaussianRelativePenaltyFunction", filePaths, InitialGuess, H460alpharef, H460betaref, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, false, false, [3 10 5]);
%Generic_BWF_RBE_RunScript('gaussian_H460_nopenalty_nogradient_defaulttemp', "Relative_Kernels/GaussianBWF", "Relative_Kernels/GaussianPenaltyFunction", filePaths, InitialGuess, H460alpharef, H460betaref, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, false, false, [3 10 5])




% job = createJob(c);
% createTask(job, @Generic_BWF_RunScript, 1, {'gaussian_H460_nopenalty_nogradient_defaulttemp', "Kernels/GaussianBWF", "Kernels/GaussianPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, false, false});
% createTask(job, @Generic_BWF_RBE_RunScript, 1, {'gaussian_H460_nopenalty_nogradient_defaulttemp', "GaussianBWFRelative", "GaussianRelativePenaltyFunction", filePaths, InitialGuess, H460alpharef, H460betaref, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, false, false, [3 10 5]});
% submit(job)

job2 = batch(c, @Generic_BWF_RBE_RunScript, 1, {'gaussian_H460_nopenalty_nogradient_defaulttemp', "GaussianBWFRelative", "GaussianRelativePenaltyFunction", filePaths, InitialGuess, H460alpharef, H460betaref, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, false, false, Temps});

