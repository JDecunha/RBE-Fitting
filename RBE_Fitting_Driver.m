function [output] = RBE_Fitting_Driver(experimentalData, cudaKernel, cudaPenaltyKernel, initialGuess, penaltyWeight, iterationsPerCycle, numCycles, toleranceCycles)

%Allocate the buffers on the GPU (the cost function needs these)
GPUBuffer = gpuArray(zeros(size(experimentalData.BinCenter,1)-1,1));
GPUBuffer2 = gpuArray(zeros(size(experimentalData.BinCenter,1)-1,1));

%Construct the cost function
CostFunc = @(x) GPUCostFunction(x, experimentalData, penaltyWeight, cudaKernel, GPUBuffer, cudaPenaltyKernel, GPUBuffer2);

%Set up the fitting options for annealing
optionsGradientDescent = optimoptions('fminunc','Algorithm','quasi-newton');
options = optimoptions(@simulannealbnd);
options.MaxIterations = iterationsPerCycle;
options.MaxStallIterations = iterationsPerCycle*2; %We are doing our own custom implementation of stalling below. So we make sure the fitting never stalls using the built in method.

costLastCycle = 1e9; numIterationsWithoutImprovement = 0.;

for i = 1:numCycles
    
    %Start with gradient descent
    [GradientSoln, GradientCost] = fminunc(CostFunc, initialGuess, optionsGradientDescent);
    
    %Dynamically update the temperatures based on the last iteration
    options.InitialTemperature = abs(GradientSoln)*100; %Use the gradient descent solution to set the temperature for each item

    %Run the simulated annealing, using the gradient descent solution as the new starting point
    [Soln, Cost] = simulannealbnd(CostFunc,GradientSoln,[],[],options);

    %See how much the cost function has improved. Break if toleranceCycles exceeded without 1e-6 improvement in cost function
    costThisCycle = Cost;
    costDiff = costLastCycle-costThisCycle;

    if costDiff > 1e-6 %If improvement is greater than
        numIterationsWithoutImprovement = 0;
    else
        numIterationsWithoutImprovement = numIterationsWithoutImprovement + 1;
    end
    if numIterationsWithoutImprovement >= toleranceCycles
        format = "Breaking because of %d cycles without improvement.";
        fprintf(format, toleranceCycles); 
        break
    end

    costLastCycle = costThisCycle;

    %If we are continuing, update the initial guess with the last solution
    initialGuess = Soln;

end

output = {Soln, Cost};

end

