%% Configure the script
filePaths = ["a.csv", "b.csv" , "c.csv", "d.csv", "e.csv", "f.csv", "g.csv", "h.csv", "i.csv", "j.csv" , "k.csv" , "l.csv"];

%% Morstin plotting
funcVal = [3297.97258707670,5.41801921828085e-05,-1.65304114028526e-05,9.31217143989086e-07,0.149589365656704];
SurvivalVsBWFplotter("MorstinBWF", filePaths, funcVal);

%% Cubic regular
funcVal = [0.0431408242731182,0.157099764860757,-0.0222918654682546,0.000337133584729527,0.112398569166481];
SurvivalVsBWFplotter("CubicBWF", filePaths, funcVal);

%% Cubic scaled beta
funcVal = [0.156086727990625,0.154595887694408,-0.0180067554151325,0.000260306848235479,0.136106853255576];
SurvivalBWFScaledBetaplotter("CubicBWF", filePaths, funcVal);

%% LQE scaled beta
funcVal = [-0.843441431489747,0.0425203847286495,-0.0137566150821285,-0.0544504947443985,0.364242399019003];
SurvivalBWFScaledBetaplotter("LQEBWF", filePaths, funcVal);