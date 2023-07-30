function [output] = BWF_Plotter(x, cudaKernel, gpuBuffer)

    numBins = 1000;
    min = 0;
    max = 130;
    FakeBinWidth = ones(numBins,1);
    FakeBinVals = ones(numBins,1);
    BinCenters = transpose(linspace(min,max,numBins));

    gpuBuffer = feval(cudaKernel,FakeBinWidth,BinCenters,FakeBinVals,1000, x(1:end-1), gpuBuffer);
    outputy = gather(gpuBuffer);

    output = [BinCenters, outputy];

end