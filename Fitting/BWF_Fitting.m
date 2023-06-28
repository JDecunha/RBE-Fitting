%% Import the H460 data

%A list of the files
filePaths = ["a.csv", "b.csv" , "c.csv", "d.csv", "e.csv", "f.csv", "g.csv", "h.csv", "i.csv", "j.csv" , "k.csv" , "l.csv"];

%A 3d array to hold the experiments data
experiments = [];

%Loop through the files and concatenate
for i = 1:size(filePaths,2)
    experiments = cat(3,experiments, readmatrix(filePaths(i)));
end

%% Linear fitting

%Set up the options
options = optimoptions(@simulannealbnd, 'PlotFcn',{@saplotbestf,@saplottemperature,@saplotf,@saplotstopping, @saplotx});
options.InitialTemperature = 1;
penaltyWeight = 0.05;

%Set up the fit function and initial guesses
LinearBWF =  @(c,y) (c(2)*y+c(1)); % c are fitting params, y is lineal energy
LinearBWFCostFunc = @(x) CostFunction(x,LinearBWF,experiments, penaltyWeight);
LinearBWFInitialGuess = [0.121505, 0.0530566, 0.0873727];

%Fit
[LinearBWFSoln, LinearBWFCost] = simulannealbnd(LinearBWFCostFunc,LinearBWFInitialGuess,[0,0,0],[],options);

%% Quadratic polynomial fitting

%Set up the fit function and initial guesses
QuadraticBWF =  @(c,y) ( c(3)*y^2 +c(2)*y + c(1) ); % c are fitting params, y is lineal energy
penaltyWeight = 0.001;
QuadraticBWFCostFunc = @(x) CostFunction(x, QuadraticBWF, experiments, penaltyWeight);
QuadraticBWFInitialGuess = [0.121505, 0.0530566, 0, 0.0873727];

%Start with gradient descent
optionsGradientDescent = optimoptions('fminunc','Display','iter','Algorithm','quasi-newton');
[QuadraticBWFGradientSoln, QuadraticBWFGradientCost] = fminunc(QuadraticBWFCostFunc,QuadraticBWFInitialGuess, optionsGradientDescent);

%Set up the options for annealing
hybridopts = optimoptions('fminunc','Display','iter','Algorithm','quasi-newton');
options = optimoptions(@simulannealbnd, 'PlotFcn',{@saplotbestf,@saplottemperature,@saplotf,@saplotstopping, @saplotx},'HybridFcn',{@fminunc,hybridopts}, 'HybridInterval', 500);
options.InitialTemperature = 100;


%Run the simulated annealing
[QuadraticBWFSoln, QuadraticBWFCost] = simulannealbnd(QuadraticBWFCostFunc,QuadraticBWFGradientSoln,[],[],options);

%% Cubic polynomial fitting

%Result of first run:0.449431308175198	-0.0914235201863481	0.00349396482599642	1.82570243474669e-06	0.105922167702498
%Cost: 1.58051322189950

%Second run: 0.449403486184307	-0.0913719814057112	0.00342243102008902	3.04704711292860e-06	0.105876443794440
%Cost: 1.57704785690543

%Third run: 0.449748113877666	-0.0927633399515647	0.00344262388787775	3.25798855908300e-06	0.107455892849751
% Cost: 1.57665847635341

%Set up the fit function and initial guesses
CubicBWF =  @(c,y) ( c(4)*y^3 + c(3)*y^2 +c(2)*y + c(1) ); % c are fitting params, y is lineal energy
penaltyWeight = 3.; %penalty weight of 3, means that if the BWF is 10% negative then its cost function adds up to 0.3
CubicBWFCostFunc = @(x) CostFunction(x, CubicBWF, experiments, penaltyWeight);
CubicBWFInitialGuess = [0.372425881183947,-0.010916581992305,-0.005878889360641,1.272478813886198e-04,0.098835887130962];

%Start with gradient descent
optionsGradientDescent = optimoptions('fminunc','Display','iter','Algorithm','quasi-newton');
[CubicBWFGradientSoln, CubicBWFGradientCost] = fminunc(CubicBWFCostFunc, CubicBWFInitialGuess, optionsGradientDescent);

%Set up the options for annealing
hybridopts = optimoptions('fminunc','Display','iter','Algorithm','quasi-newton');
options = optimoptions(@simulannealbnd, 'PlotFcn',{@saplotbestf,@saplottemperature,@saplotf,@saplotstopping, @saplotx},'HybridFcn',{@fminunc,hybridopts}, 'HybridInterval', 500);
options.InitialTemperature = abs(CubicBWFGradientSoln)*10; %Use the gradient descent solution to set the temperature for each item


%Run the simulated annealing
[CubicBWFSoln, CubicBWFCost] = simulannealbnd(CubicBWFCostFunc,CubicBWFGradientSoln,[],[],options);

%% Fifth order polynomial fitting

%Set up the options
options = optimoptions(@simulannealbnd, 'PlotFcn',{@saplotbestf,@saplottemperature,@saplotf,@saplotstopping, @saplotx});
options.InitialTemperature = 1e4;
penaltyWeight = 0.05;

%Set up the fit function and initial guesses
FifthBWF =  @(c,y) ( c(6)*y^5 + c(5)*y^4 + c(4)*y^3 + c(3)*y^2 +c(2)*y + c(1) ); % c are fitting params, y is lineal energy
FifthBWFCostFunc = @(x) CostFunction(x,FifthBWF,experiments, penaltyWeight);
FifthBWFInitialGuess = [0.121505, 0.0530566, 0.01, 0.0, 0.0, 0.0, 0.0873727];

%Fit
[FifthBWFSoln, FifthBWFCost] = simulannealbnd(FifthBWFCostFunc,FifthBWFInitialGuess,[],[],options);