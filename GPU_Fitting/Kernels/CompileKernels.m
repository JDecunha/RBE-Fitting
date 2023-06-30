%% Compile all these guys

%% Polynomials
mexcuda -ptx LinearBWF.cu LinearPenaltyFunction.cu
mexcuda -ptx QuadraticBWF.cu QuadraticBWFPenaltyFunction.cu
mexcuda -ptx CubicBWF.cu CubicBWFPenaltyFunction.cu
mexcuda -ptx FourthBWF.cu FourthBWFPenaltyFunction.cu
mexcuda -ptx FifthBWF.cu FifthBWFPenaltyFunction.cu

%% Mairani et al. (Make sure to check for more of these)
mexcuda -ptx LEBWF.cu LEPenaltyFunction.cu
mexcuda -ptx LE2BWF.cu LE2PenaltyFunction.cu

mexcuda -ptx QBWF.cu QPenaltyFunction.cu
mexcuda -ptx QEBWF.cu QEPenaltyFunction.cu
mexcuda -ptx QE2BWF.cu QE2PenaltyFunction.cu

mexcuda -ptx LQEBWF.cu LQEPenaltyFunction.cu
mexcuda -ptx LQE2BWF.cu LQE2PenaltyFunction.cu

%% Others

mexcuda -ptx MorstinBWF.cu MorstinPenaltyFunction.cu
mexcuda -ptx GaussianBWF.cu GaussianPenaltyFunction.cu
%mexcuda -ptx SkewGaussianBWF.cu SkewGaussianPenaltyFunction.cu



