function [output] = RBE_LETFixedBeta_GradientDriver(experimentalData, cudaKernel, initialGuess)

%Allocate the buffers on the GPU (the cost function needs these)
GPUBuffer = gpuArray(zeros(1,1));

%Construct the cost function
CostFunc = @(x) LETFixedBetaCostFunction(x, experimentalData, cudaKernel, GPUBuffer);

%Set up the fitting options for gradient descent
optionsGradientDescent = optimoptions('fmincon','MaxFunctionEvaluations', 1e6, 'MaxIterations', 1e6);
lowerBounds = zeros(1,size(initialGuess,2));
lowerBounds(1:end-1) = -inf;

%Using hybrid approach, run gradient descent
[GradientSoln, GradientCost] = fmincon(CostFunc,initialGuess,[],[],[],[],lowerBounds,[],[],optionsGradientDescent);

additionalMetrics = LETCostMetricsFullKernel(GradientSoln, experimentalData, cudaKernel, []);

%Smush into output
output = {GradientSoln, GradientCost, additionalMetrics};

end

