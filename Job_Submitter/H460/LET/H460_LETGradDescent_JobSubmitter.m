%% Configure the script
filePaths = ["H460_dy/a.csv", "H460_dy/b.csv" , "H460_dy/c.csv", "H460_dy/d.csv", "H460_dy/e.csv", "H460_dy/f.csv", "H460_dy/g.csv", "H460_dy/h.csv", "H460_dy/i.csv", "H460_dy/j.csv" , "H460_dy/k.csv" , "H460_dy/l.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated

%% Linear Fitting
InitialGuess = [1, 1, 0.1];

linear = RunScript_LET_GradDescent('linear_H460_penalty', "LinearBWF", filePaths, InitialGuess);

%% Quadratic Fitting
InitialGuess = [1, 1, 1, 0.1];

quad = RunScript_LET_GradDescent('quadratic_H460_penalty', "QuadraticBWF", filePaths, InitialGuess)

%% Cubic Fitting
InitialGuess = [1, 1, 1, 1, 0.1];

cubic = RunScript_LET_GradDescent('cubic_H460_nopenalty', "CubicBWF", filePaths, InitialGuess)

%% Fourth Fitting
InitialGuess = [1, 1, 1, 1, 1, 0.1];

fourth = RunScript_LET_GradDescent('fourth_H460_nopenalty_nogradient', "FourthBWF", filePaths, InitialGuess)

%% Fifth Fitting
InitialGuess = [1, 1, 1, 1, 1, 1, 0.1];

fifth = RunScript_LET_GradDescent('fifth_H460_penalty_nogradient_dynamicttemp', "FifthBWF", filePaths, InitialGuess)

%% Q
% 137.097703502422 [3.76636003724722,3.76636003724722,0.0406437239563288,-525.683200622959,0,0]
% [0.257110976763011,0.00129269462272315,0.0695622920653699] Stopped 27

InitialGuess = [0.1,0.1,0.1]; %Q, 2 params + beta

Q = RunScript_LET_GradDescent('Q_H460', "QBWF", filePaths, InitialGuess)

%% QE
%90.5078244697954 [2.06479502385127,2.06479502385127,0.0300933855284903,-573.572680289143,0,0]
%[-0.422927568525610,0.00196746955548890,0.122784500308671,0.0817768877500963] Stopped 33

filePaths = ["a.csv", "b.csv" , "c.csv", "d.csv", "e.csv", "f.csv", "g.csv", "h.csv", "i.csv", "j.csv" , "k.csv" , "l.csv"];

InitialGuess = [0.1,0.1,0.1,0.1]; %QE, 3 params + beta

QE = RunScript_LET_GradDescent('QE_H460', "QEBWF", filePaths, InitialGuess)

%% QE2
%77.1844162037098 [1.76450196593815,1.76450196593815,0.0278191367771450,-586.617166223308,0.000538340499307528,0]
%[-0.560105393422814,0.00218694544230000,0.0144464099639455,0.0866815046013671] Stopped 43

InitialGuess = [0.1,0.1,0.1,0.1]; %QE2, 3 params + beta

QE2 = RunScript_LET_GradDescent('QE2_H460', "QE2BWF", filePaths, InitialGuess)

%% LE
%139.457231257352 [3.40550109245931,3.40550109245931,0.0386476497348288,-532.042706244904,0,0]
%[-0.445135122989522,0.0784993556966450,0.247531010142038,0.0642640158597833] Stopped 26
InitialGuess = [0.1,0.1,0.1,0.1]; %LE, 3 params + beta

LE = RunScript_LET_GradDescent('LE_H460', "LEBWF", filePaths, InitialGuess)

%% LQE
%76.3044306795220, [2.09783632267802,2.09783632267802,0.0303332103526379,-570.255011164743,0.00124336075502775,0]
%[-0.388584443838206,-0.112932727104043,0.00393510689332768,5.01059563412118e-05,0.0909508336878536] Stopped 27

InitialGuess = [0.1,0.1,0.1,0.1,0.1]; %LQE, 4 params + beta

LQE = RunScript_LET_GradDescent('LQE_H460', "LQEBWF", filePaths, InitialGuess)

%% LE2
%119.841972005339 [2.76035415604174,2.76035415604174,0.0347948508746154,-543.475453842733,0,0]
%[-0.632028138891091,0.0891299766130736,0.0390830757392554,-0.00132816228383953,1.54885277298171e-05,8.71820058958813e-11,0.0687492883924215] Stopped 26

InitialGuess = [0.1,0.1,0.1,0.1,0.1,0.1,0.1];

LE2 = RunScript_LET_GradDescent('LE2_H460', "LE2BWF", filePaths, InitialGuess)

%% LQE2
%COST: 69.8060937313156, 1.88667896196775,1.88667896196775,0.0287661393445988,-579.060345922732,0.00234472187362035,0, 28
%[-0.464480073662808,-0.0653195679968287,0.00358677767610294,0.00550875013320500,0.0930761477260959] Stopped 28
InitialGuess = [0.1,0.1,0.1,0.1,0.1]; %LQE2, 4 params + beta

LQE2 = RunScript_LET_GradDescent('LQE2_H460', "LQE2BWF", filePaths, InitialGuess)

%% Gaussian Fitting

InitialGuess = [0.1, 0.1, 0.1, 0.1, 0.1]; %Morstin inspired guess

gaus = RunScript_LET_GradDescent('gaussian_H460_nopenalty_withgradient_customtempbigger', "GaussianBWF", filePaths, InitialGuess)


%% Skew Gaussian Fitting

InitialGuess = [0.1, 0.1, 0.1, 0.1, 0.1, 0.1];

skewgaus = RunScript_LET_GradDescent('skewGaussian_H460_nopenalty_customtemp_gradassist', "SkewGaussianBWF", filePaths, InitialGuess)
%% Morstin fitting
%[11460.000000, 2.5*power(10,-6), 2.1*power(10,-5), 2.*power(10,-7), 0.1]; Default guess
%[3297.97258707670,5.41801921828085e-05,-1.65304114028526e-05,9.31217143989086e-07,0.149589365656704] cost :2.4556
%InitialGuess = [3297.97258707670,5.41801921828085e-05,-1.65304114028526e-05,9.31217143989086e-07,0.149589365656704];

InitialGuess = [11460.000000, 2.5*power(10,-6), 2.1*power(10,-5), 2.*power(10,-7), 0.1];

morstin = RunScript_LET_GradDescent('morstin_H460_nopenalty_customtemp_gradassist', "MorstinBWF",  filePaths, InitialGuess)