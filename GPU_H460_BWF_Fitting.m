%% Import the H460 data

%A list of the files
filePaths = ["a.csv", "b.csv" , "c.csv", "d.csv", "e.csv", "f.csv", "g.csv", "h.csv", "i.csv", "j.csv" , "k.csv" , "l.csv"];

%A 3d array to hold the experiments data
experiments = [];

%Loop through the files and concatenate
for i = 1:size(filePaths,2)
    experiments = cat(3,experiments, readmatrix(filePaths(i)));
end

GPUExperimentalData = ExperimentData(experiments);
emptyGPUArray = gpuArray(zeros(3000,1));
emptyGPUArray2 = gpuArray(zeros(3000,1));

%% Set up the kernels
mexcuda -ptx CubicBWFKernel.cu CubicBWFPenaltyFunction.cu
CubicKernel = parallel.gpu.CUDAKernel("CubicBWFKernel.ptx", "CubicBWFKernel.cu");
CubicKernel.ThreadBlockSize = 1024;
CubicPenalty = parallel.gpu.CUDAKernel("CubicBWFPenaltyFunction.ptx", "CubicBWFPenaltyFunction.cu");
CubicPenalty.ThreadBlockSize = 1024;

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
%Fourth run: 0.416235651585086	-0.0718638843554856	0.00201211303720215	1.87050200767727e-05 0.105488574286496
% Cost: 1.50684445586626
%Fifth run: [0.418650606996692,-0.075648343729909,0.001898538682944,2.241768335897316e-05,0.108034190185032]
% Cost: 1.485775432983281
%Sixth: [0.390465954860904,-0.035468076705955,-0.002107447240113,7.350208235667029e-05,0.097627579037377]
%Cost: 1.300724788325735
%[0.372425881183947,-0.010916581992305,-0.005878889360641,1.272478813886198e-04,0.098835887130962]
%1.163527618808042
%[0.102919429734727,0.125933513311555,-0.019283222333918,2.988322768805547e-04,0.110340625405717]
%0.829809178714362

%Set up the fit function and initial guesses
%penalty weight affects cost as follows: cost = cost + negativeFraction*penaltyWeight
penaltyWeight = 10.; %Weight of 10, means if func is 10% negative, it adds a value of 1 to the cost
CubicBWFCostFunc = @(x) GPUCostFunction(x, GPUExperimentalData, penaltyWeight, CubicKernel, emptyGPUArray, CubicPenalty, emptyGPUArray2);
CubicBWFInitialGuess = [0.0786855407569327,0.135672140373969,-0.0201356304923653,0.000309404109628883,0.111993684813713];

%Set up the options for annealing
hybridopts = optimoptions('fminunc','Algorithm','quasi-newton');
options = optimoptions(@simulannealbnd);%, 'PlotFcn',{@saplotbestf,@saplottemperature,@saplotf,@saplotstopping, @saplotx});

options.MaxIterations = 1;

costLastIntvl = 1000.;
costThisIntvl = 0.;
numIterationsWithoutImprovement = 0.;


for i = 1:1
    
    %Start with gradient descent
    optionsGradientDescent = optimoptions('fminunc','Algorithm','quasi-newton');
    [CubicBWFGradientSoln, CubicBWFGradientCost] = fminunc(CubicBWFCostFunc, CubicBWFInitialGuess, optionsGradientDescent);
    
    %Dynamically update the temperatures based on the last iteration
    options.InitialTemperature = abs(CubicBWFGradientSoln)*100; %Use the gradient descent solution to set the temperature for each item

    %Run the simulated annealing
    [CubicBWFSoln, CubicBWFCost] = simulannealbnd(CubicBWFCostFunc,CubicBWFGradientSoln,[],[],options);

    %Feed the last solution back into the next best guess
    CubicBWFInitialGuess = CubicBWFSoln;

    %See how much the cost function has improved. Break if 10 iterations without sufficient improvement
    costThisIntvl = CubicBWFCost;
    costDiff = costLastIntvl-costThisIntvl;
    if costDiff < 1e-6 %If improvement is greater than
        numIterationsWithoutImprovement = 0;
    else
        numIterationsWithoutImprovement = numIterationsWithoutImprovement + 1;
    end
    if numIterationsWithoutImprovement >= 25
        fprintf("Breaking because of 25 cycles without improvement.") 
        break
    end

    costLastIntvl = costThisIntvl;

end

%% Cubic Fitting using the driver

CubicBWFInitialGuess = [0.102919429734727,0.125933513311555,-0.019283222333918,2.988322768805547e-04,0.110340625405717];
CubicBWFInitialGuess = [0.449431308175198	-0.0914235201863481	0.00349396482599642	1.82570243474669e-06	0.105922167702498];
penaltyWeight = 10.;

iterationsPerCyc = 10000;
numCycles = 2;
toleranceCycles = 25;

output = RBE_Fitting_Driver(GPUExperimentalData, CubicKernel, CubicPenalty, CubicBWFInitialGuess, penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles);
output(2)

%RBE_Fitting_Driver(experimentalData, cudaKernel, cudaPenaltyKernel, initialGuess, penaltyWeight, iterationsPerCycle, numCycles, toleranceCycles);

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