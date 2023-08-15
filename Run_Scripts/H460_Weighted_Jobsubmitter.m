%%
c = parcluster("Desktop-10700k");

%% Setup run parameters
iterationsPerCyc = 250000;
numCycles = 250;
toleranceCycles = 25;

%% Linear Fitting
% 207.059707370364 [6.52224668204461,6.52224668204461,0.0534848998285375,-480.107081245039,0,0]
% [0.146011976800855,0.0501996006722245,0.0543804541931067] Stopped 26

filePaths = ["a.csv", "b.csv" , "c.csv", "d.csv", "e.csv", "f.csv", "g.csv", "h.csv", "i.csv", "j.csv" , "k.csv" , "l.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated

dynamicTemp = true;
gradientAssist = true;

InitialGuess = [0.122365050472956,0.0529226583994300,0.0871961766426740];

%Generic_BWF_Weighted_RunScript('linear_H460', "LinearBWF", "LinearPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, []);
batch(c, @Generic_BWF_Weighted_RunScript, 1, {'linear_H460', "LinearBWF", "LinearPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, []});

%% Quadratic Fitting
% 76.3044325801239 [2.09779529041180,2.09779529041180,0.0303329137026001,-572.256634604744,0.00124248159484246,0]
% [0.611402781635117,-0.112969304529003,0.00393475783925507,0.0909426279926686] Stopped 266

filePaths = ["a.csv", "b.csv" , "c.csv", "d.csv", "e.csv", "f.csv", "g.csv", "h.csv", "i.csv", "j.csv" , "k.csv" , "l.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated

dynamicTemp = true;
gradientAssist = true;

InitialGuess = [0.444121132516278,-0.0875134108437409,0.00349956427196082,0.104449304420321];

batch(c, @Generic_BWF_Weighted_RunScript, 1, {'quadratic_H460', "QuadraticBWF", "QuadraticBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, []});

%% Cubic Fitting
% 26.7500582673395 [0.857105949185480,0.857105949185480,0.0193887509118936,-644.548330344874,0.0400056703016106,0]
% [0.0140501916647982,0.183092264611679,-0.0249027639566055,0.000370149515558851,0.115620307425799] (250/250) RUN AGAIN
% 26.6491378873707 [0.855958759167752,0.855958759167752,0.0193757711693473,-644.659495772824,0.0401747319223151,0]
% [0.00838701932847768,0.185289234216632,-0.0250980413297348,0.000372587152280048,0.115994363406138]
% 250 STOPPED


filePaths = ["a.csv", "b.csv" , "c.csv", "d.csv", "e.csv", "f.csv", "g.csv", "h.csv", "i.csv", "j.csv" , "k.csv" , "l.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated

dynamicTemp = true;
gradientAssist = true;

InitialGuess = [0.0140501916647982,0.183092264611679,-0.0249027639566055,0.000370149515558851,0.115620307425799];

batch(c, @Generic_BWF_Weighted_RunScript, 1, {'cubic_H460', "CubicBWF", "CubicBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, []});

%% Fourth Fitting
% 42.5327231693295 [1.37757389457404,1.37757389457404,0.0245804612765416,-603.163365841581,0.0326563648771402,0]
% [0.369251276602228,-6.07597461873480e-05,-0.00637759618874494,2.86680397083042e-07,1.71762213706704e-06,0.109760899410573]
% STOPPED 250
% 42.5229938570989 [1.37568339127701,1.37568339127701,0.0245635890792618,-603.277348504313,0.0326641173327006,0]
% [0.369010022658865,-3.52273935348259e-05,-0.00637214186983959,9.07941668896718e-08,1.71885995905700e-06,0.109756936346886]
% STOPPED 250

filePaths = ["a.csv", "b.csv" , "c.csv", "d.csv", "e.csv", "f.csv", "g.csv", "h.csv", "i.csv", "j.csv" , "k.csv" , "l.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated

dynamicTemp = true;
gradientAssist = true;

InitialGuess = [0.369251276602228,-6.07597461873480e-05,-0.00637759618874494,2.86680397083042e-07,1.71762213706704e-06,0.109760899410573];

batch(c, @Generic_BWF_Weighted_RunScript, 1, {'fourth_H460', "FourthBWF", "FourthBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, []});

%% Fifth Fitting
% 23.1044241178410 [0.703963653368344,0.703963653368344,0.0175714537907212,-656.885619812014,0.0961348154284771,0]
% [0.117991367547092,1.36951156226596e-07,0.0136651652925975,-0.00155310817677925,1.78312926668020e-05,1.37864362885489e-10,0.125667392488149]
% STOPPED 250
% 23.1018718077489 [0.706785578928234,0.706785578928234,0.0176066372419188,-656.553569113708,0.0963151111297407,0]
% [0.114452868483900,1.36323422844147e-07,0.0138196722983583,-0.00156450390469698,1.79465295233224e-05,1.56359108632487e-10,0.126146627495731]
% Stopped 245 :)

filePaths = ["a.csv", "b.csv" , "c.csv", "d.csv", "e.csv", "f.csv", "g.csv", "h.csv", "i.csv", "j.csv" , "k.csv" , "l.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated

dynamicTemp = true;
gradientAssist = true;

InitialGuess = [0.117991367547092,1.36951156226596e-07,0.0136651652925975,-0.00155310817677925,1.78312926668020e-05,1.37864362885489e-10,0.125667392488149];

batch(c, @Generic_BWF_Weighted_RunScript, 1, {'fifth_H460', "FifthBWF", "FifthBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, []});

%% Q
% 137.097703502422 [3.76636003724722,3.76636003724722,0.0406437239563288,-525.683200622959,0,0]
% [0.257110976763011,0.00129269462272315,0.0695622920653699] Stopped 27

filePaths = ["a.csv", "b.csv" , "c.csv", "d.csv", "e.csv", "f.csv", "g.csv", "h.csv", "i.csv", "j.csv" , "k.csv" , "l.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated

dynamicTemp = false;
gradientAssist = true;

InitialGuess = [0.1,0.1,0.1]; %Q, 2 params + beta

batch(c, @Generic_BWF_Weighted_RunScript, 1, {'Q_H460', "QBWF", "QPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, []});

%% QE
%90.5078244697954 [2.06479502385127,2.06479502385127,0.0300933855284903,-573.572680289143,0,0]
%[-0.422927568525610,0.00196746955548890,0.122784500308671,0.0817768877500963] Stopped 33

filePaths = ["a.csv", "b.csv" , "c.csv", "d.csv", "e.csv", "f.csv", "g.csv", "h.csv", "i.csv", "j.csv" , "k.csv" , "l.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated

dynamicTemp = false;
gradientAssist = true;

InitialGuess = [0.1,0.1,0.1,0.1]; %QE, 3 params + beta

batch(c, @Generic_BWF_Weighted_RunScript, 1, {'QE_H460', "QEBWF", "QEPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, []});

%% QE2
%77.1844162037098 [1.76450196593815,1.76450196593815,0.0278191367771450,-586.617166223308,0.000538340499307528,0]
%[-0.560105393422814,0.00218694544230000,0.0144464099639455,0.0866815046013671] Stopped 43

filePaths = ["a.csv", "b.csv" , "c.csv", "d.csv", "e.csv", "f.csv", "g.csv", "h.csv", "i.csv", "j.csv" , "k.csv" , "l.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated

dynamicTemp = false;
gradientAssist = true;

InitialGuess = [0.1,0.1,0.1,0.1]; %QE2, 3 params + beta

batch(c, @Generic_BWF_Weighted_RunScript, 1, {'QE2_H460', "QE2BWF", "QE2PenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, []});

%% LE
%139.457231257352 [3.40550109245931,3.40550109245931,0.0386476497348288,-532.042706244904,0,0]
%[-0.445135122989522,0.0784993556966450,0.247531010142038,0.0642640158597833] Stopped 26

filePaths = ["a.csv", "b.csv" , "c.csv", "d.csv", "e.csv", "f.csv", "g.csv", "h.csv", "i.csv", "j.csv" , "k.csv" , "l.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated

dynamicTemp = false;
gradientAssist = true;

InitialGuess = [0.1,0.1,0.1,0.1]; %LE, 3 params + beta

batch(c, @Generic_BWF_Weighted_RunScript, 1, {'LE_H460', "LEBWF", "LEPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, []});

%% LQE
%76.3044306795220, [2.09783632267802,2.09783632267802,0.0303332103526379,-570.255011164743,0.00124336075502775,0]
%[-0.388584443838206,-0.112932727104043,0.00393510689332768,5.01059563412118e-05,0.0909508336878536] Stopped 27

filePaths = ["a.csv", "b.csv" , "c.csv", "d.csv", "e.csv", "f.csv", "g.csv", "h.csv", "i.csv", "j.csv" , "k.csv" , "l.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated

dynamicTemp = false;
gradientAssist = true;

InitialGuess = [0.1,0.1,0.1,0.1,0.1]; %LQE, 4 params + beta

batch(c, @Generic_BWF_Weighted_RunScript, 1, {'LQE_H460', "LQEBWF", "LQEPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, []});

%% LE2
%119.841972005339 [2.76035415604174,2.76035415604174,0.0347948508746154,-543.475453842733,0,0]
%[-0.632028138891091,0.0891299766130736,0.0390830757392554,-0.00132816228383953,1.54885277298171e-05,8.71820058958813e-11,0.0687492883924215] Stopped 26

filePaths = ["a.csv", "b.csv" , "c.csv", "d.csv", "e.csv", "f.csv", "g.csv", "h.csv", "i.csv", "j.csv" , "k.csv" , "l.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated

dynamicTemp = false;
gradientAssist = true;

InitialGuess = [0.171772756811258,1.34755307513886e-07,0.0108208275215392,-0.00132816228383953,1.54885277298171e-05,8.71820058958813e-11,0.114951100621072];

batch(c, @Generic_BWF_Weighted_RunScript, 1, {'LE2_H460', "LE2BWF", "LE2PenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, []});

%% LQE2
%COST: 69.8060937313156, 1.88667896196775,1.88667896196775,0.0287661393445988,-579.060345922732,0.00234472187362035,0, 28
%[-0.464480073662808,-0.0653195679968287,0.00358677767610294,0.00550875013320500,0.0930761477260959] Stopped 28

filePaths = ["a.csv", "b.csv" , "c.csv", "d.csv", "e.csv", "f.csv", "g.csv", "h.csv", "i.csv", "j.csv" , "k.csv" , "l.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated

dynamicTemp = false;
gradientAssist = true;

InitialGuess = [0.1,0.1,0.1,0.1,0.1]; %LQE2, 4 params + beta

batch(c, @Generic_BWF_Weighted_RunScript, 1, {'LQE2_H460', "LQE2BWF", "LQE2PenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, []});

%% Gaussian Fitting
%First weighted: cost 104, RMSE 2.6. 47/250 cycles.
%[0.259792916870841,134.897818535580,95.8397112097308,4.48348264070734,0.0793750600209517]

filePaths = ["a.csv", "b.csv" , "c.csv", "d.csv", "e.csv", "f.csv", "g.csv", "h.csv", "i.csv", "j.csv" , "k.csv" , "l.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated

dynamicTemp = false;
gradientAssist = true;

InitialGuess = [0.230491501205610, 22.092470171093, 125.2590461228117, 43.51962016177844, 0.101961735572583]; %Morstin inspired guess
temps = [1, 5, 10, 10, 0.05];

batch(c, @Generic_BWF_Weighted_RunScript, 1, {'gaussian_H460', "GaussianBWF", "GaussianPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% Skew Gaussian Fitting
%First weighted: cost 104, RMSE 2.6692 (92/250 cycles)
%[0.259782058518735,45.3594859680499,86.7401261355996,14.3908554332408,210.181736696371,0.0793737090831128]


filePaths = ["a.csv", "b.csv" , "c.csv", "d.csv", "e.csv", "f.csv", "g.csv", "h.csv", "i.csv", "j.csv" , "k.csv" , "l.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated

dynamicTemp = false;
gradientAssist = true;

InitialGuess = [0, 17, 90, 60, 1.5, 0.107723905478834];
temps = [1, 1, 5, 5, 1, 0.05];

batch(c, @Generic_BWF_Weighted_RunScript, 1, {'skewGaussian_H460', "SkewGaussianBWF", "SkewGaussianPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});

%% Morstin fitting
%[11460.000000, 2.5*power(10,-6), 2.1*power(10,-5), 2.*power(10,-7), 0.1]; Default guess
%[3297.97258707670,5.41801921828085e-05,-1.65304114028526e-05,9.31217143989086e-07,0.149589365656704] cost :2.4556
%[4950.44598521600,0.000124766878777259,-2.35320902386290e-05,8.71972423256827e-07,0.0900550735667972] first weighted fit cost: 78.4542, RMSE 2.13 (MAX CYCLES)

% 78.2606408271508 [2.13553521776248,2.13553521776248,0.0306045462865339,-568.776713794279,0.00104735991606236,0]
% [5424.35985122075,0.000114200443445769,-2.13716006297374e-05,7.87804976156578e-07,0.0893680456034658]
% Stopped 233
 
filePaths = ["a.csv", "b.csv" , "c.csv", "d.csv", "e.csv", "f.csv", "g.csv", "h.csv", "i.csv", "j.csv" , "k.csv" , "l.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated

dynamicTemp = false;
gradientAssist = true;

InitialGuess = [4950.44598521600,0.000124766878777259,-2.35320902386290e-05,8.71972423256827e-07,0.0900550735667972];
temps = [1000, 1e-3, 1e-3, 1e-5, 0.1];

%Generic_BWF_Weighted_RunScript('morstin_H460_nopenalty_customtemp_gradassist', "MorstinBWF", "MorstinPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps);
batch(c, @Generic_BWF_Weighted_RunScript, 1, {'morstin_H460', "MorstinBWF", "MorstinPenaltyFunction", filePaths, InitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps});