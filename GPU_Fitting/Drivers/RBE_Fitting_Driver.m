function [output] = RBE_Fitting_Driver(experimentalData, cudaKernel, cudaPenaltyKernel, initialGuess, penaltyWeight, iterationsPerCycle, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps)

%Allocate the buffers on the GPU (the cost function needs these)
GPUBuffer = gpuArray(zeros(size(experimentalData.BinCenter,1)-1,1));
GPUBuffer2 = gpuArray(zeros(size(experimentalData.BinCenter,1)-1,1));

%Construct the cost function
CostFunc = @(x) GPUCostFunction(x, experimentalData, penaltyWeight, cudaKernel, GPUBuffer, cudaPenaltyKernel, GPUBuffer2);

%Set up the fitting options for annealing
optionsGradientDescent = optimoptions('fminunc','Algorithm','quasi-newton');
optionsGradientDescent.MaxFunctionEvaluations = 1e6;
options = optimoptions(@simulannealbnd);
options.MaxIterations = iterationsPerCycle;
options.MaxStallIterations = iterationsPerCycle*2; %We are doing our own custom implementation of stalling below. So we make sure the fitting never stalls using the built in method.

costLastCycle = 1e9; numIterationsWithoutImprovement = 0.;

for i = 1:numCycles
    
    %Check if using hybrid approach
    if gradientAssist == true   

        %Using hybrid approach, run gradient descent
        [GradientSoln, GradientCost] = fminunc(CostFunc, initialGuess, optionsGradientDescent);

        %Dynamically update the temperatures if it has been requested
        if dynamicTemp == true
            options.InitialTemperature = abs(GradientSoln)*1; %Use the gradient descent solution to set the temperature for each item
        elseif isempty(temps) == false
            options.InitialTemperature = temps;
        end

        %Run the simulated annealing, using the gradient descent solution as the new starting point
        [Soln, Cost] = simulannealbnd(CostFunc,GradientSoln,[],[],options);
    
    else

        %Dynamically update the temperatures if it has been requested
        if dynamicTemp == true
            options.InitialTemperature = abs(initialGuess)*1; %Use the initial guess / last solution to set temperatures for each item
        elseif isempty(temps) == false
            options.InitialTemperature = temps;
        end

        %Run the simulated annealing, using the the initial guess / last solution as the new starting point
        [Soln, Cost] = simulannealbnd(CostFunc,initialGuess,[],[],options);
    end

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

additionalMetrics = CostMetrics(Soln, experimentalData, penaltyWeight, cudaKernel, GPUBuffer, cudaPenaltyKernel, GPUBuffer2);

output = {Soln, Cost, additionalMetrics, i};

end

