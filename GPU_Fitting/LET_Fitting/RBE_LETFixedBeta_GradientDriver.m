function [output] = RBE_LETFixedBeta_GradientDriver(experimentalData, cudaKernel, initialGuess)

%Allocate the buffers on the GPU (the cost function needs these)
GPUBuffer = gpuArray(zeros(1,1));

%Construct the cost function
CostFunc = @(x) LETFixedBetaCostFunction(x, experimentalData, cudaKernel, GPUBuffer);

%Set up the fitting options for gradient descent
optionsGradientDescent = optimoptions('fminunc','Algorithm','quasi-newton');
optionsGradientDescent.MaxFunctionEvaluations = 1e6;

%Using hybrid approach, run gradient descent
[GradientSoln, GradientCost] = fminunc(CostFunc, initialGuess, optionsGradientDescent);

%Smush into output
output = {GradientSoln, GradientCost};

end

