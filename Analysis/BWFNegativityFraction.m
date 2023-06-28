function [negFraction] = BWFNegativityFraction(BWFKernel, FittingParams, binWidth, binCenter, maxRelevantBin)

totalArea = 0.;
negArea = 0.;

GPUBuffer = gpuArray(zeros(size(binCenter,1)-1,1));
GPUOnes = gpuArray(ones(size(binCenter,1)-1,1));

GPUBuffer = feval(BWFKernel,binWidth,binCenter,GPUOnes,size(GPUOnes(:,1),1), FittingParams(1:end-1), GPUBuffer);
CPUBWFValues = gather(GPUBuffer);

for i = 1:maxRelevantBin

    if CPUBWFValues(i) > 0
        totalArea = totalArea + CPUBWFValues(i);
    else
        totalArea = totalArea - CPUBWFValues(i);
        negArea = negArea - CPUBWFValues(i);
    end
end

negFraction = negArea/totalArea;

end

