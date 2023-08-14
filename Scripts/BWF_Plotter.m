function [output] = BWF_Plotter(x, cudaKernel, gpuBuffer, max)

    if ~exist('max','var')
     % third parameter does not exist, so default it to something
      max = 130;
     end

    numBins = 1000;
    min = 0;
    FakeBinWidth = ones(numBins,1);
    FakeBinVals = ones(numBins,1);
    BinCenters = transpose(linspace(min,max,numBins));

    gpuBuffer = feval(cudaKernel,FakeBinWidth,BinCenters,FakeBinVals,1000, x(1:end-1), gpuBuffer);
    outputy = gather(gpuBuffer);

    output = [BinCenters, outputy];

end