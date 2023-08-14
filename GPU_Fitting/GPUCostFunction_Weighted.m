function [Cost] = GPUCostFunction_Weighted(x, experiments, negativePenaltyValue, cudaKernel, gpuBufferArray, cudaPenalty, gpuBufferArray2)

Cost = 0;

%Loop through each d(y) spectrum
for i = 1:size(experiments.SF,3)

    gpuBufferArray = feval(cudaKernel,experiments.BinWidth(:,1,i),experiments.BinCenter(:,1,i),experiments.BinValue(:,1,i),size(experiments.BinValue(:,1,i),1), x(1:end-1), gpuBufferArray);
    alphaPredicted = gather(sum(gpuBufferArray));
    betaPredicted = x(end); %last param of x is beta

    %Loop through each dose and surviving fraction
    for j = 1:experiments.sizeDose(1,1,i)

        dose = experiments.Dose(j,1,i);
        survivingFraction = experiments.SF(j,1,i);

        %Calculate surviving fraction
        sfPredicted = (alphaPredicted*dose)+(betaPredicted*dose*dose);
        sfPredicted = -sfPredicted;

        %Update the Cost running tally
        sfDifference = sfPredicted - log(survivingFraction);
        sfSquared = sfDifference*sfDifference;
        sfSquared = sfSquared*experiments.relativeWeighting(i); %Weight the cost function
        Cost = Cost + sfSquared; %It's squared to match definition of least squares

    end

end

%Apply the negative function penalty
[gpuBufferArray, gpuBufferArray2] = feval(cudaPenalty, experiments.BinWidth(:,1,1),experiments.BinCenter(:,1,1),experiments.maxRelevantBin, x(1:end-1), gpuBufferArray, gpuBufferArray2);
negativeArea = gather(sum(gpuBufferArray(1:experiments.maxRelevantBin)));
totalArea = gather(sum(gpuBufferArray2(1:experiments.maxRelevantBin)));
Cost = Cost + (negativePenaltyValue*(negativeArea/totalArea)); 

%To fit the definition of least squares, the cost has an additional 1/2
%term
Cost = Cost/2;

end



% function [Cost] = CostFunction(x, BWF, experiments, negativePenaltyValue, cudaKernel, outputGPUArray)
% %COSTFUNCTION
% %Alright, I think I need three input arguments
% %Those being
% % 1.) The fitting parameters themselves  x1 .... xn
% % 2.) The symbolic defined function that those parameters go into
% % 3.) The experimental data
% 
% % 1.) X is going to be a two column set of fitting parameters
% 
% Cost = 0;
% 
% %Loop through each d(y) spectrum
% for i = 1:size(experiments,3)
% 
%     %Each d(y) spectrum has multiple dose measurements. Find out how many
%     %there are
%     numExps = nnz(~isnan(experiments(:,4,i)));
% 
%     outputGPUArray = feval(cudaKernel,experiments(:,1,i),experiments(:,2,i),size(experiments(:,1,i),1)-1, x(1:end-1), outputGPUArray);
%     alphaPredicted = gather(sum(outputGPUArray));
%     betaPredicted = x(end); %last param of x is beta
% 
%     %Loop through each dose and surviving fraction
%     for j = 1:numExps
%         dose = experiments(j,4,i);
%         survivingFraction = experiments(j,5,i);
% 
%         %Calculate surviving fraction
%         sfPredicted = (alphaPredicted*dose)+(betaPredicted*dose*dose);
%         sfPredicted = -sfPredicted;
% 
%         %Update the Cost running tally
%         sfDifference = sfPredicted - log(survivingFraction);
%         sfSquared = sfDifference*sfDifference;
%         Cost = Cost + sfSquared; %It's squared to match definition of least squares
% 
%     end
% 
% end
% 
% %Apply the negative function penalty
% Cost = Cost + BWFNegativePenalty(x, BWF, experiments(:,:,1), negativePenaltyValue, 120);
% 
% %To fit the definition of least squares, the cost has an additional 1/2
% %term
% Cost = Cost/2;
% 
% end

