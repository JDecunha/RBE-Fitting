%% Configure the script
filePaths = ["U87_pristine_fy/1.1.csv","U87_pristine_fy/3.9.csv","U87_pristine_fy/6.7.csv","U87_pristine_fy/11.6.csv","U87_pristine_fy/17.7.csv","U87_pristine_fy/22.5.csv","U87_SOBP_fy/1.27.csv","U87_SOBP_fy/3.csv","U87_SOBP_fy/4.4.csv","U87_SOBP_fy/13.7.csv","U87_SOBP_fy/20.9.csv","U87_SOBP_fy/25.4.csv"];
penaltyWeight = 0.; %typically make my penalty 30 when it's activated
iterationsPerCyc = 1000000;
numCycles = 1000; %formerly 250
toleranceCycles = 200; %formerly 10

%% Fit alpha and beta
% I need to make it so that the cost function is the same as the ones I develop with my cost function
%{
%A 3d array to hold the experiments data
CPUexperiments = [];

%Loop through the files and concatenate
for i = 1:size(filePaths,2)
    CPUexperiments = cat(3,CPUexperiments, readmatrix(filePaths(i)));
end

experiments = ExperimentData(CPUexperiments);
alphas = zeros(size(experiments.SF,3),1);
betas = zeros(size(experiments.SF,3),1);

%Loop through the experiments
for  i = 1:size(experiments.SF,3)
    %Fill in dose and survivivng fraction
    dose = experiments.Dose(:,1,i);
    survivingFraction = experiments.SF(:,1,i);

    %Cleave off 0 values
    ind = ~isnan(dose);
    dose=dose(ind);
    ind = ~isnan(survivingFraction);
    survivingFraction=survivingFraction(ind);

    %Take the log of the surviving fraction
    survivingFraction = log(survivingFraction);

    % Define Start points, fit-function and fit curve
    x0 = [0.5 0.1]; 
    %For the definition where all doses are weighted equally
    LQModel = fittype( @(a,b,x) -((a.*x)+(b.*x.*x)) );
    %For the conventional definition of the cost function
    %LQModel = fittype( @(a,b,x) exp(-((a.*x)+(b.*x.*x))) );
    [fitted_curve,gof] = fit(dose,survivingFraction,LQModel,'StartPoint',x0);

    % Save the coeffiecient values for a,b,c and d in a vector
    coeffvals = coeffvalues(fitted_curve); 
    alphas(i) = coeffvals(1);
    betas(i) = coeffvals(2);
    
end
betas = transpose(betas);
%}
%% Hardcode alpha-beta

betas = [0.0565765885518575	0.0631351678220036	0.0663449068766847	0.0443661396582693	0.0241565637167338	0.00227631665482532	0.0568566343596296	0.0580051009568114	0.0616568454259627	0.0373835187846487	0.00663962849948634	0.00546595180740141];

%% Config for cluster
%c = parcluster('Desktop-10700k');
%c = parcluster('GA401');

%configCluster
c = parcluster;

c.AdditionalProperties.WallTime = '48:00';
c.AdditionalProperties.MemUsage = 16.;
c.AdditionalProperties.GpusPerNode = 1;
c.AdditionalProperties.GpuMemUsage = 16.;
c.AdditionalProperties.QueueName = 'gpu';
c.AdditionalProperties.AdditionalSubmitArgs = '-n 10'; % -q egpu-medium -gpu num=1:gmem=16'; 
c.saveProfile

%% Linear Fitting
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,betas];

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'linear_U87Combined_fy_individualbeta', "LinearBWF", 2, "LinearPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');


%% Quadratic Fitting
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,betas];



batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'quadratic_U87Combined_fy_individualbeta', "QuadraticBWF", 3, "QuadraticBWFPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');


%% Cubic Fitting
dynamicTemp = true;
gradientAssist = true;
temps = [];

%InitialGuess = [0.1,0.1,0.1,0.1,betas];
InitialGuess = [0.13074715743944,0.0182281251968747,0.00164009495537128,0.0001,0.059285874295137,0.0553108816340401,0.057724207552425,0.0506751401385796,0.0387142295505541,0.0081931479873562,0.0580362914970686,0.0596929453596361,0.0649466449701058,0.0325994019560283,0.00397753712032271,-0.00251625908418747];

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'cubic_U87Combined_fy_individualbeta', "CubicBWF", 4,  "CubicBWFPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');


%% Fourth Fitting
dynamicTemp = true;
gradientAssist = true;
temps = [];

%InitialGuess = [0.1,0.1,0.1,0.1,0.1,betas];
InitialGuess = [0.134526534302487,0.00796714873411701,0.00499462942720483,-0.000212970844908777,2.36976283374088E-06,0.059602245500109,0.0544154111916341,0.056069883632203,0.0495083940149025,0.0381397973562355,0.00800195869765056,0.0584052374715593,0.0600594118501795,0.064913510054469,0.0324517221825815,0.00278175425825418,0.000914451203980754];

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'fourth_U87Combined_fy_individualbeta', "FourthBWF", 5,  "FourthBWFPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');


%% Fifth Fitting
dynamicTemp = true;
gradientAssist = true;
temps = [];

%InitialGuess = [0.1,0.1,0.1,0.1,0.1,0.1,betas];
InitialGuess = [0.134526534302487,0.00796714873411701,0.00499462942720483,-0.000212970844908777, 0.00001,2.36976283374088E-06,0.059602245500109,0.0544154111916341,0.056069883632203,0.0495083940149025,0.0381397973562355,0.00800195869765056,0.0584052374715593,0.0600594118501795,0.064913510054469,0.0324517221825815,0.00278175425825418,0.000914451203980754];

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'fifth_U87Combined_fy_individualbeta', "FifthBWF", 6,  "FifthBWFPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% Q
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,betas]; %Q, 2 params + beta

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'Q_U87Combined_fy_individualbeta', "QBWF", 2,  "QPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% QE
dynamicTemp = false;
gradientAssist = true;
temps = [];

%InitialGuess = [0.1,0.1,0.1,betas]; %QE, 3 params + beta
InitialGuess = [0.173589260273113,0.00230242658519034,0.001,0.0550414814111543,0.0571023033827359,0.0609620367531888,0.0543405786156618,0.0405867263944822,0.00549377616191755,0.0539395829835124,0.0576214700300925,0.0640156165004525,0.0359773329351848,0.00337875592894416,-0.00559709979129028];


batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'QE_U87Combined_fy_individualbeta', "QEBWF", 3, "QEPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% QE2
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,betas]; %QE2, 3 params + beta

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'QE2_U87Combined_fy_individualbeta', "QE2BWF", 3, "QE2PenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% LE
dynamicTemp = false;
gradientAssist = true;
temps = [];

InitialGuess = [0.1,0.1,0.1,betas]; %LE, 3 params + beta

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'LE_U87Combined_fy_individualbeta', "LEBWF", 3, "LEPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% LQE
dynamicTemp = false;
gradientAssist = true;
temps = [];

%InitialGuess = [0.1,0.1,0.1,0.1,betas]; %LQE, 4 params + beta (offset, L, Q, E)
InitialGuess = [-0.81940508320171,0.106421527110204, 0.0001, 0.134432806609732,0.0564400260074869,0.0581207995090859,0.0598025391044368,0.0510698091686482,0.0375398343330041,0.00749842632986151,0.0554227408509478,0.0596379206255927,0.0660082200497355,0.032071971505896,0.00271710873601012,-0.003467017];


batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'LQE_U87Combined_fy_individualbeta', "LQEBWF", 4, "LQEPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% LE2
dynamicTemp = false;
gradientAssist = true;
temps = [];

%InitialGuess = [0.1,0.1,0.1,betas];
%Just re-running with same guess
InitialGuess = [-0.0707624212484989,0.0707765666889844,8.98499889327957,0.0539553195831442,0.0577838557742097,0.0556194740612253,0.0453153736405001,0.0342936244619693,0.0109676848993127,0.0547581834681808,0.0670610084195015,0.0724532146870311,0.0266227370755345,0.00319374245914523,0.000838458098986362];


batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'LE2_U87Combined_fy_individualbeta', "LE2BWF", 3, "LE2PenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% LQE2
dynamicTemp = false;
gradientAssist = true;
temps = [];

%InitialGuess = [0.1,0.1,0.1,0.1,betas]; %LQE2, 4 params + beta
%Just re-running with same guess
InitialGuess = [-0.561022307511218,0.17034960088654,-0.00266686575045444,0.636177937285955,0.0432552669594148,0.0702973074101004,0.0617405189150044,0.0443122718046984,0.0299181429776135,0.0119401933578108,0.0442428813317422,0.0683079285507559,0.0806819890569136,0.0231982642852804,0.000927896774363823,0.00202176131375116];


batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'LQE2_U87Combined_fy_individualbeta', "LQE2BWF", 4, "LQE2PenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting');

%% Gaussian Fitting
dynamicTemp = false;
gradientAssist = true;

%InitialGuess = [0.1, 0.1, 0.1, 0.1,betas]; 
%Take the skew gaussian guess but remove guess[4]
InitialGuess = [2.28436854255117,-2.15298323769418,3.7322938379059,-9.90560977628205,0.0549013013498045,0.0613890296677709,0.0609731476495956,0.049253619994821,0.0346821390692816,0.00916180673306592,0.0540853828035932,0.0606209414632195,0.0679768401633356,0.0291836946024642,0.00186664737792396,-0.00123058318748307];
temps = [1, 5, 10, 10];

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'gaussian_U87Combined_fy_individualbeta', "GaussianBWF", 4, "GaussianPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting')

%% Skew Gaussian Fitting
dynamicTemp = false;
gradientAssist = true;

InitialGuess = [0.1, 0.1, 0.1, 0.1, 0.1,betas];

temps = [1, 1, 5, 5, 1];

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'skewGaussian_U87Combined_fy_individualbeta', "SkewGaussianBWF", 5, "SkewGaussianPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting')

%% Morstin fitting
%[11460.000000, 2.5*power(10,-6), 2.1*power(10,-5), 2.*power(10,-7), 0.1]; Default guess
dynamicTemp = false;
gradientAssist = true;

InitialGuess = [11460.000000, 2.5*power(10,-6), 2.1*power(10,-5), 2.*power(10,-7), betas];
temps = [1000, 1e-3, 1e-3, 1e-5];

batch(c, @Generic_BWF_IndividualBeta_RunScript, 1, {'morstin_U87Combined_fy_individualbeta', "MorstinBWF", 4, "MorstinPenaltyFunction", filePaths, InitialGuess,  penaltyWeight, iterationsPerCyc, numCycles, toleranceCycles, dynamicTemp, gradientAssist, temps},'AutoAddClientPath',false,'CurrentFolder','/rsrch3/home/radphys_rsch/jdecunha/RBE-Fitting')