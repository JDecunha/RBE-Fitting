%% Configure the script
filePaths = ["a.csv", "b.csv" , "c.csv", "d.csv", "e.csv", "f.csv", "g.csv", "h.csv", "i.csv", "j.csv" , "k.csv" , "l.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated
iterationsPerCyc = 250000;
numCycles = 1000;
toleranceCycles = 250;

%%
c = parcluster('Desktop-10700k');

%% Linear Fitting
InitialGuess = [0.122365050472956,0.0529226583994300,0.0871961766426740];

job = createJob(c);
createTask(job, @Generic_BWF_RunScript, 1, {'linear_H460_penalty', "LinearBWF", "LinearPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, true})
submit(job)

%% Quadratic Fitting
InitialGuess = [0.444121132516278,-0.0875134108437409,0.00349956427196082,0.104449304420321];

job = createJob(c);
createTask(job, @Generic_BWF_RunScript, 1, {'quadratic_H460_penalty', "QuadraticBWF", "QuadraticBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, true})
submit(job)

%% Cubic Fitting
InitialGuess = [0.0443609111198733,0.156302592131283,-0.0222191112797004,0.000336228095711589,0.112447315642517];

job = createJob(c);
createTask(job, @Generic_BWF_RunScript, 1, {'cubic_H460_nopenalty', "CubicBWF", "CubicBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, true})
submit(job)

%% Fourth Fitting
InitialGuess = [0.312835304762923,-8.24323377088100e-05,-0.00692446738746977,0.000224297550572219,-1.10367658638440e-06,0.105969822311258];

job = createJob(c);
createTask(job, @Generic_BWF_RunScript, 1, {'fourth_H460_nopenalty_nogradient', "FourthBWF", "FourthBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, true, false})
submit(job)

%% Fifth Fitting
InitialGuess = [0.171772756811258,1.34755307513886e-07,0.0108208275215392,-0.00132816228383953,1.54885277298171e-05,8.71820058958813e-11,0.114951100621072];

job = createJob(c);
createTask(job, @Generic_BWF_RunScript, 1, {'fifth_H460_penalty_nogradient_dynamicttemp', "FifthBWF", "FifthBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, true, false})
submit(job)

%% Gaussian Fitting
filePaths = ["a.csv", "b.csv" , "c.csv", "d.csv", "e.csv", "f.csv", "g.csv", "h.csv", "i.csv", "j.csv" , "k.csv" , "l.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated
iterationsPerCyc = 250000;
numCycles = 250;
toleranceCycles = 10;
dynamicTemp = false;
gradientAssist = true;

InitialGuess = [0.230491501205610, 22.092470171093, 125.2590461228117, 43.51962016177844, 0.101961735572583]; %Morstin inspired guess
temps = [1, 5, 10, 10, 0.05];

job = createJob(c);
createTask(job, @Generic_BWF_RunScript, 1, {'gaussian_H460_nopenalty_withgradient_customtempbigger', "GaussianBWF", "GaussianPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps})
submit(job)

%% Gaussian Fitting Relative RBE
InitialGuess = [0.230491501205610,10,100,20.51962016177844,0.101961735572583];

job = createJob(c);
createTask(job, @Generic_BWF_RunScript, 1, {'gaussian_H460_nopenalty_nogradient_defaulttemp', "GaussianBWF", "GaussianPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, false, false})
submit(job)

%% Skew Gaussian Fitting
filePaths = ["a.csv", "b.csv" , "c.csv", "d.csv", "e.csv", "f.csv", "g.csv", "h.csv", "i.csv", "j.csv" , "k.csv" , "l.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated
iterationsPerCyc = 250000;
numCycles = 250;
toleranceCycles = 10;
dynamicTemp = false;
gradientAssist = true;

InitialGuess = [0, 17, 90, 60, 1.5, 0.107723905478834];
temps = [1, 1, 5, 5, 1, 0.05];

batch(c, @Generic_BWF_RunScript, 1, {'skewGaussian_H460_nopenalty_customtemp_gradassist', "SkewGaussianBWF", "SkewGaussianPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps})

%% Morstin fitting
%[11460.000000, 2.5*power(10,-6), 2.1*power(10,-5), 2.*power(10,-7), 0.1]; Default guess
%[3297.97258707670,5.41801921828085e-05,-1.65304114028526e-05,9.31217143989086e-07,0.149589365656704] cost :2.4556

filePaths = ["a.csv", "b.csv" , "c.csv", "d.csv", "e.csv", "f.csv", "g.csv", "h.csv", "i.csv", "j.csv" , "k.csv" , "l.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated
iterationsPerCyc = 250000;
numCycles = 250;
toleranceCycles = 25;
dynamicTemp = false;
gradientAssist = true;

InitialGuess = [3297.97258707670,5.41801921828085e-05,-1.65304114028526e-05,9.31217143989086e-07,0.149589365656704];
temps = [1000, 1e-3, 1e-3, 1e-5, 0.1];

batch(c, @Generic_BWF_RunScript, 1, {'morstin_H460_nopenalty_customtemp_gradassist', "MorstinBWF", "MorstinPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps})