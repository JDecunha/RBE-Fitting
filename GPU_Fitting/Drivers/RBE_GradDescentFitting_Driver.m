function [output] = RBE_GradDescentFitting_Driver(experimentalData, cudaKernel, cudaPenaltyKernel, initialGuess, penaltyWeight)

%Allocate the buffers on the GPU (the cost function needs these)
GPUBuffer = gpuArray(zeros(size(experimentalData.BinCenter,1)-1,1));
GPUBuffer2 = gpuArray(zeros(size(experimentalData.BinCenter,1)-1,1));

%Construct the cost function
CostFunc = @(x) GPUCostFunction(x, experimentalData, penaltyWeight, cudaKernel, GPUBuffer, cudaPenaltyKernel, GPUBuffer2);

%Set up the fitting options for annealing
optionsGradientDescent = optimoptions('fminunc','Algorithm','quasi-newton');
optionsGradientDescent.MaxFunctionEvaluations = 1e6;

%Using hybrid approach, run gradient descent
[GradientSoln, GradientCost] = fminunc(CostFunc, initialGuess, optionsGradientDescent);


%Calculate the cost metrics
additionalMetrics = CostMetrics(GradientSoln, experimentalData, penaltyWeight, cudaKernel, GPUBuffer, cudaPenaltyKernel, GPUBuffer2, []);
%Smush into output
output = {GradientSoln, GradientCost, additionalMetrics};

end

