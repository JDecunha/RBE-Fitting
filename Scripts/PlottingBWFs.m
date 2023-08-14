GPUBuffer = gpuArray(zeros(1000,1));

%% Plotting Gaussian functional form
CudaKernel = parallel.gpu.CUDAKernel("GaussianBWFRelative.ptx", "GaussianBWFRelative.cu");
CudaKernel.ThreadBlockSize = 1024;
gaussian = BWF_Plotter([446.456371565769,93.3292332315103,-4.83028167465230],CudaKernel, GPUBuffer);
plot(gaussian(:,1),gaussian(:,2));
hold on
%gaussian = BWF_Plotter([1,18.794554890182,80.3686993584413,10.264113352119,0.105813443933774],CudaKernel, GPUBuffer);
%plot(gaussian(:,1),gaussian(:,2));

%% Skew Gaussian vs Gaussian
CudaKernel = parallel.gpu.CUDAKernel("GaussianBWF.ptx", "GaussianBWF.cu");
CudaKernel.ThreadBlockSize = 1024;
gaussian = BWF_Plotter([0.230491501205610,114.092470171093,95.2590461228117,5.51962016177844,0.101961735572583],CudaKernel, GPUBuffer);
plot(gaussian(:,1),gaussian(:,2));
hold on

CudaKernel = parallel.gpu.CUDAKernel("SkewGaussianBWF.ptx", "SkewGaussianBWF.cu");
CudaKernel.ThreadBlockSize = 1024;
out = BWF_Plotter([18.7946203025342,-1180.40939896680,46.3041792096487,118.960955922724,-5983.09941924337,0.107723905478834],CudaKernel, GPUBuffer);
%plot(out(:,1),out(:,2));

%% Morstin vs Gaussian
CudaKernel = parallel.gpu.CUDAKernel("GaussianBWF.ptx", "GaussianBWF.cu");
CudaKernel.ThreadBlockSize = 1024;
gaussian = BWF_Plotter([0.230491501205610,22.092470171093,125.2590461228117,43.51962016177844,0.101961735572583],CudaKernel, GPUBuffer, 300);
% plot(gaussian(:,1),gaussian(:,2));
hold on

CudaKernel = parallel.gpu.CUDAKernel("MorstinBWF.ptx", "MorstinBWF.cu");
CudaKernel.ThreadBlockSize = 1024;
out = BWF_Plotter([3297.97258707670,5.41801921828085e-05,-1.65304114028526e-05,9.31217143989086e-07,0.149589365656704],CudaKernel, GPUBuffer, 300);
plot(out(:,1),out(:,2));

CudaKernel = parallel.gpu.CUDAKernel("MorstinBWF.ptx", "MorstinBWF.cu");
CudaKernel.ThreadBlockSize = 1024;
out = BWF_Plotter([3010.90150042332,0.000137006580329845,-2.98606802538980e-05,1.33638439092475e-06,0.111377434741229],CudaKernel, GPUBuffer, 300);
plot(out(:,1),out(:,2));



CudaKernel = parallel.gpu.CUDAKernel("SkewGaussianBWF.ptx", "SkewGaussianBWF.cu");
CudaKernel.ThreadBlockSize = 1024;
out = BWF_Plotter([0, 17, 90, 60, 1.5 , 0.107723905478834], CudaKernel, GPUBuffer, 300);
%plot(out(:,1),out(:,2));

% out = BWF_Plotter([11460.000000, 2.5*power(10,-6), 2.1*power(10,-5), 2.*power(10,-7), 0, 0.1],CudaKernel, GPUBuffer);
% plot(out(:,1),out(:,2));

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