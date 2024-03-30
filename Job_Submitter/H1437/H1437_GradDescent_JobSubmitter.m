%% Configure the script
filePaths = ["H1437_fy/a.csv", "H1437_fy/b.csv" , "H1437_fy/c.csv", "H1437_fy/d.csv", "H1437_fy/e.csv", "H1437_fy/f.csv", "H1437_fy/g.csv", "H1437_fy/h.csv", "H1437_fy/i.csv", "H1437_fy/j.csv" , "H1437_fy/k.csv" , "H1437_fy/l.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated

%% Linear Fitting
InitialGuess = [0.1, 0.1, 0.1];

linear = Generic_GradDescentBWF_RunScript('linear_H1437_penalty', "LinearBWF", "LinearPenaltyFunction", filePaths, InitialGuess, penaltyWeight);

%% Quadratic Fitting
InitialGuess = [0.1, 0.1, 0.1, 0.1];

quad = Generic_GradDescentBWF_RunScript('quadratic_H1437_penalty', "QuadraticBWF", "QuadraticBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight)

%% Cubic Fitting
InitialGuess = [0.1, 0.1, 0.1, 0.1, 0.1];

cubic = Generic_GradDescentBWF_RunScript('cubic_H1437_nopenalty', "CubicBWF", "CubicBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight)

%% Fourth Fitting
InitialGuess = [0.1, 0.1, 0.1, 0.1, 0.1, 0.1];

fourth = Generic_GradDescentBWF_RunScript('fourth_H1437_nopenalty_nogradient', "FourthBWF", "FourthBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight)

%% Fifth Fitting
InitialGuess = [0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1];

fifth = Generic_GradDescentBWF_RunScript('fifth_H1437_penalty_nogradient_dynamicttemp', "FifthBWF", "FifthBWFPenaltyFunction", filePaths, InitialGuess, penaltyWeight)

%% Q
% 137.097703502422 [3.76636003724722,3.76636003724722,0.0406437239563288,-525.683200622959,0,0]
% [0.257110976763011,0.00129269462272315,0.0695622920653699] Stopped 27

InitialGuess = [0.1,0.1,0.1]; %Q, 2 params + beta

Q = Generic_GradDescentBWF_RunScript('Q_H1437', "QBWF", "QPenaltyFunction", filePaths, InitialGuess, penaltyWeight)

%% QE
%90.5078244697954 [2.06479502385127,2.06479502385127,0.0300933855284903,-573.572680289143,0,0]
%[-0.422927568525610,0.00196746955548890,0.122784500308671,0.0817768877500963] Stopped 33

InitialGuess = [0.1,0.1,0.1,0.1]; %QE, 3 params + beta

QE = Generic_GradDescentBWF_RunScript('QE_H1437', "QEBWF", "QEPenaltyFunction", filePaths, InitialGuess, penaltyWeight)

%% QE2
%77.1844162037098 [1.76450196593815,1.76450196593815,0.0278191367771450,-586.617166223308,0.000538340499307528,0]
%[-0.560105393422814,0.00218694544230000,0.0144464099639455,0.0866815046013671] Stopped 43

InitialGuess = [0.1,0.1,0.1,0.1]; %QE2, 3 params + beta

QE2 = Generic_GradDescentBWF_RunScript('QE2_H1437', "QE2BWF", "QE2PenaltyFunction", filePaths, InitialGuess, penaltyWeight)

%% LE
%139.457231257352 [3.40550109245931,3.40550109245931,0.0386476497348288,-532.042706244904,0,0]
%[-0.445135122989522,0.0784993556966450,0.247531010142038,0.0642640158597833] Stopped 26
InitialGuess = [0.1,0.1,0.1,0.1]; %LE, 3 params + beta

LE = Generic_GradDescentBWF_RunScript('LE_H1437', "LEBWF", "LEPenaltyFunction", filePaths, InitialGuess, penaltyWeight)

%% LQE
%76.3044306795220, [2.09783632267802,2.09783632267802,0.0303332103526379,-570.255011164743,0.00124336075502775,0]
%[-0.388584443838206,-0.112932727104043,0.00393510689332768,5.01059563412118e-05,0.0909508336878536] Stopped 27

InitialGuess = [0.1,0.1,0.1,0.1,0.1]; %LQE, 4 params + beta

LQE = Generic_GradDescentBWF_RunScript('LQE_H1437', "LQEBWF", "LQEPenaltyFunction", filePaths, InitialGuess, penaltyWeight)

%% LE2
%119.841972005339 [2.76035415604174,2.76035415604174,0.0347948508746154,-543.475453842733,0,0]
%[-0.632028138891091,0.0891299766130736,0.0390830757392554,-0.00132816228383953,1.54885277298171e-05,8.71820058958813e-11,0.0687492883924215] Stopped 26

InitialGuess = [0.1,0.1,0.1,0.1,0.1,0.1,0.1];

LE2 = Generic_GradDescentBWF_RunScript('LE2_H1437', "LE2BWF", "LE2PenaltyFunction", filePaths, InitialGuess, penaltyWeight)

%% LQE2
%COST: 69.8060937313156, 1.88667896196775,1.88667896196775,0.0287661393445988,-579.060345922732,0.00234472187362035,0, 28
%[-0.464480073662808,-0.0653195679968287,0.00358677767610294,0.00550875013320500,0.0930761477260959] Stopped 28
InitialGuess = [0.1,0.1,0.1,0.1,0.1]; %LQE2, 4 params + beta

LQE2 = Generic_GradDescentBWF_RunScript('LQE2_H1437', "LQE2BWF", "LQE2PenaltyFunction", filePaths, InitialGuess, penaltyWeight)

%% Gaussian Fitting

InitialGuess = [0.1, 0.1, 0.1, 0.1, 0.1]; %Morstin inspired guess

gaus = Generic_GradDescentBWF_RunScript('gaussian_H1437_nopenalty_withgradient_customtempbigger', "GaussianBWF", "GaussianPenaltyFunction", filePaths, InitialGuess, penaltyWeight)


%% Skew Gaussian Fitting

InitialGuess = [0.1, 0.1, 0.1, 0.1, 0.1, 0.1];

skewgaus = Generic_GradDescentBWF_RunScript('skewGaussian_H1437_nopenalty_customtemp_gradassist', "SkewGaussianBWF", "SkewGaussianPenaltyFunction", filePaths, InitialGuess, penaltyWeight)
%% Morstin fitting
%[11460.000000, 2.5*power(10,-6), 2.1*power(10,-5), 2.*power(10,-7), 0.1]; Default guess
%[3297.97258707670,5.41801921828085e-05,-1.65304114028526e-05,9.31217143989086e-07,0.149589365656704] cost :2.4556
%InitialGuess = [3297.97258707670,5.41801921828085e-05,-1.65304114028526e-05,9.31217143989086e-07,0.149589365656704];

InitialGuess = [11460.000000, 2.5*power(10,-6), 2.1*power(10,-5), 2.*power(10,-7), 0.1];

morstin = Generic_GradDescentBWF_RunScript('morstin_H1437_nopenalty_customtemp_gradassist', "MorstinBWF", "MorstinPenaltyFunction", filePaths, InitialGuess, penaltyWeight)