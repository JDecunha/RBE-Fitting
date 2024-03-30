function [output] = RBE_GradDescentFitting_Driver(experimentalData, cudaKernel, cudaPenaltyKernel, initialGuess, penaltyWeight)

%Allocate the buffers on the GPU (the cost function needs these)
GPUBuffer = gpuArray(zeros(size(experimentalData.BinCenter,1)-1,1));
GPUBuffer2 = gpuArray(zeros(size(experimentalData.BinCenter,1)-1,1));

%Construct the cost function
CostFunc = @(x) GPUCostFunction(x, experimentalData, penaltyWeight, cudaKernel, GPUBuffer, cudaPenaltyKernel, GPUBuffer2);

%Set up the fitting options for gradient descent
optionsGradientDescent = optimoptions('fmincon','MaxFunctionEvaluations', 1e6, 'MaxIterations', 1e6);
lowerBounds = zeros(1,size(initialGuess,2));
lowerBounds(1:end-1) = -inf;

%Using hybrid approach, run gradient descent
[GradientSoln, GradientCost] = fmincon(CostFunc,initialGuess,[],[],[],[],lowerBounds,[],[],optionsGradientDescent);

%Calculate the cost metrics
additionalMetrics = CostMetricsFullKernel(GradientSoln, experimentalData, penaltyWeight, cudaKernel, cudaPenaltyKernel, []);
%Smush into output
output = {GradientSoln, GradientCost, additionalMetrics};

end

