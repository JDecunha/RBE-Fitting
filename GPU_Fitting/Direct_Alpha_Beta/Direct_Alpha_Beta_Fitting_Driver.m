function [output] = Direct_Alpha_Beta_Fitting_Driver(experimentalData, initialGuess)

%Construct the cost function
CostFunc = @(x) DirectAlphaBetaCostFunction(x, experimentalData);

%Set up the fitting options for gradient descent
optionsGradientDescent = optimoptions('fmincon','MaxFunctionEvaluations',1e6);
lowerBounds = zeros(size(initialGuess,1),1);
%optionsGradientDescent.MaxFunctionEvaluations = 1e6;

%Using hybrid approach, run gradient descent
[GradientSoln, GradientCost] = fmincon(CostFunc,initialGuess,[],[],[],[],lowerBounds,[],[],optionsGradientDescent);


%Smush into output
output = {GradientSoln, GradientCost};

end

