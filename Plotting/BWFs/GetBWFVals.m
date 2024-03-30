function [y] = GetBWFVals(x, kernelName,fitParameters)

%I need to make a GPUBufferArray here to hold the values
gpuBufferArray = gpuArray(zeros(size(x,2),1));

%Create the kernel from the kernel name
kernel = parallel.gpu.CUDAKernel(kernelName+".ptx", kernelName+".cu");
kernel.ThreadBlockSize = 1024;

%Call the kernel
dummyWidth = ones(size(x,2),1); dummyBinValue = ones(size(x,2),1);
gpuBufferArray = feval(kernel,dummyWidth, x, dummyBinValue, size(x,2), fitParameters, gpuBufferArray);

%Dummy outputs. Meant to stay like this until the function is complete.
y = gpuBufferArray;
end

