GPUBuffer = gpuArray(zeros(1000,1));

%% Plotting Gaussian functional form
CudaKernel = parallel.gpu.CUDAKernel("GaussianBWF.ptx", "GaussianBWF.cu");
CudaKernel.ThreadBlockSize = 1024;
gaussian = BWF_Plotter([1.46784440756705,85.7154625815038,25.9618564250870, 0],CudaKernel, GPUBuffer);
plot(gaussian(:,1),gaussian(:,2));
hold on
%gaussian = BWF_Plotter([1,18.794554890182,80.3686993584413,10.264113352119,0.105813443933774],CudaKernel, GPUBuffer);
%plot(gaussian(:,1),gaussian(:,2));

%% Skew Gaussian vs Gaussian
CudaKernel = parallel.gpu.CUDAKernel("GaussianBWF.ptx", "GaussianBWF.cu");
CudaKernel.ThreadBlockSize = 1024;
gaussian = BWF_Plotter([0.230670092601950,151.679214169055,93.9470765362835,4.00490109542548,0.101904356495947],CudaKernel, GPUBuffer);
plot(gaussian(:,1),gaussian(:,2));
hold on

CudaKernel = parallel.gpu.CUDAKernel("SkewGaussianBWF.ptx", "SkewGaussianBWF.cu");
CudaKernel.ThreadBlockSize = 1024;
out = BWF_Plotter([1,12.40939896680,88.3041792096487,10.960955922724,-2,0.107723905478834],CudaKernel, GPUBuffer);
%plot(out(:,1),out(:,2));

%% Morstin vs Gaussian
CudaKernel = parallel.gpu.CUDAKernel("GaussianBWF.ptx", "GaussianBWF.cu");
CudaKernel.ThreadBlockSize = 1024;
gaussian = BWF_Plotter([1,18.794554890182,80.3686993584413,10.264113352119,0.105813443933774],CudaKernel, GPUBuffer);
plot(gaussian(:,1),gaussian(:,2));
hold on

CudaKernel = parallel.gpu.CUDAKernel("MorstinBWF.ptx", "MorstinBWF.cu");
CudaKernel.ThreadBlockSize = 1024;
out = BWF_Plotter([37.8156404119502,0.0159656729838472,-0.00755782264870835,0.000958400714370246,0.0919744695253849],CudaKernel, GPUBuffer);
plot(out(:,1),out(:,2));

out = BWF_Plotter([11460.000000, 2.5*power(10,-6), 2.1*power(10,-5), 2.*power(10,-7), 0, 0.1],CudaKernel, GPUBuffer);
plot(out(:,1),out(:,2));

%% Gaussian vs cubic functional form
CudaKernel = parallel.gpu.CUDAKernel("GaussianBWF.ptx", "GaussianBWF.cu");
CudaKernel.ThreadBlockSize = 1024;
gaussian = BWF_Plotter([0.230491501205610,120.092470171093,95.2590461228117,10.51962016177844,0.101961735572583],CudaKernel, GPUBuffer);
plot(gaussian(:,1),gaussian(:,2));
hold on
CudaKernel = parallel.gpu.CUDAKernel("CubicBWF.ptx", "CubicBWF.cu");
CudaKernel.ThreadBlockSize = 1024;
out = BWF_Plotter([0.0431408242731182,0.157099764860757,-0.0222918654682546,0.000337133584729527,0.112398569166481],CudaKernel, GPUBuffer);
plot(out(:,1),out(:,2));