%% Configure the script
filePaths = ["U87_pristine_dy/1.1.csv","U87_pristine_dy/3.9.csv","U87_pristine_dy/6.7.csv","U87_pristine_dy/11.6.csv","U87_pristine_dy/17.7.csv","U87_pristine_dy/22.5.csv"];
maxdose = 8;

%% Morstin plotting
funcVal = [11495.6036065547,2.67934375079312e-05,1.14634707211398e-06,2.82988349734161e-09,0.0788085042316325];
SurvivalVsBWFplotter("MorstinBWF", filePaths, funcVal, maxdose);

%% Quadratic
funcVal = [0.316392411394442,0.0133005616339535,3.44355174177655e-05,0.0728457419165999];
outplot = SurvivalVsBWFplotter("QuadraticBWF", filePaths, funcVal, maxdose);

%% Cubic 
funcVal = [2.41075951502340,2.41075951502340,0.400895623574965,-44.8432505536234,0.0192850659544634];
SurvivalVsBWFplotter("CubicBWF", filePaths, funcVal, maxdose);

%% Configure the script for predictions on SOBP
filePaths = ["U87_sobp_dy/1.27.csv","U87_sobp_dy/3.csv","U87_sobp_dy/4.4.csv","U87_sobp_dy/13.7.csv","U87_sobp_dy/20.9.csv","U87_sobp_dy/25.4.csv"];
maxdose = 8;

%% Quadratic
funcVal = [0.316392411394442,0.0133005616339535,3.44355174177655e-05,0.0728457419165999];
outplot = SurvivalVsBWFplotter("QuadraticBWF", filePaths, funcVal, maxdose);