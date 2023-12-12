%% Create the empty array
AGO_fy_predeterminedbeta_output = cell(15,3);
startingJobNum = 68;
% Num experiments for AGO-combined
filePaths = ["AGO_pristine_fy/1.1.csv","AGO_pristine_fy/3.9.csv","AGO_pristine_fy/6.7.csv","AGO_pristine_fy/11.6.csv","AGO_pristine_fy/17.7.csv","AGO_pristine_fy/22.5.csv", "AGO_SOBP_fy/1.27.csv","AGO_SOBP_fy/3.csv","AGO_SOBP_fy/4.4.csv","AGO_SOBP_fy/13.7.csv","AGO_SOBP_fy/20.9.csv","AGO_SOBP_fy/25.4.csv"];
NumExperiments = CalculateNumberOfExperiments(filePaths);

%% Pull the data
job = findJob(myCluster, 'ID', startingJobNum);
job_output = fetchOutputs(job);
AGO_fy_predeterminedbeta_output{1,1} = job_output{1,1}{1,2}{1}; % name
AGO_fy_predeterminedbeta_output{1,2} = job_output{1,1}{1,2}{1}; % cost
AGO_fy_predeterminedbeta_output{1,3} = job_output{1,1}{1,1}{2}; % number of iterations
NumAlphaParams = 2; %linear
CostMet = CondensedCostMetrics(job_output{1,1}{1,2}{1}, NumExperiments, NumAlphaParams); 
AGO_fy_predeterminedbeta_output{1,4} = CostMet(1); % AIC
AGO_fy_predeterminedbeta_output{1,5} = job_output{1,1}{1,1}{1}; % fit parameters
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

startingJobNum = startingJobNum + 1;
outputRowNum = outputRowNum + 1;
job = findJob(myCluster, 'ID', startingJobNum);
job_output = fetchOutputs(job);
AGO_fy_predeterminedbeta_output{2,1} = job_output{1,1}{1,2}{1};
AGO_fy_predeterminedbeta_output{2,2} = job_output{1,1}{1,1}{2};
AGO_fy_predeterminedbeta_output{2,3} = job_output{1,1}{1,1}{2}; % number of iterations
NumAlphaParams = 3; %quadratic
CostMet = CondensedCostMetrics(job_output{1,1}{1,2}{1}, NumExperiments, NumAlphaParams); 
AGO_fy_predeterminedbeta_output{2,4} = CostMet(1); % AIC
AGO_fy_predeterminedbeta_output{2,5} = job_output{1,1}{1,1}{1}; % fit parameters
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

startingJobNum = startingJobNum + 1;
job = findJob(myCluster, 'ID', startingJobNum);
job_output = fetchOutputs(job);
AGO_fy_predeterminedbeta_output{3,1} = job_output{1,1}{1,2}{1};
AGO_fy_predeterminedbeta_output{3,2} = job_output{1,1}{1,1}{2};
AGO_fy_predeterminedbeta_output{3,3} = job_output{1,1}{1,1}{2}; % number of iterations
NumAlphaParams = 4; %cubic
CostMet = CondensedCostMetrics(job_output{1,1}{1,2}{1}, NumExperiments, NumAlphaParams); 
AGO_fy_predeterminedbeta_output{3,4} = CostMet(1); % AIC
AGO_fy_predeterminedbeta_output{3,5} = job_output{1,1}{1,1}{1}; % fit parameters
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

startingJobNum = startingJobNum + 1;
job = findJob(myCluster, 'ID', startingJobNum);
job_output = fetchOutputs(job);
AGO_fy_predeterminedbeta_output{4,1} = job_output{1,1}{1,2}{1};
AGO_fy_predeterminedbeta_output{4,2} = job_output{1,1}{1,1}{2};
AGO_fy_predeterminedbeta_output{4,3} = job_output{1,1}{1,1}{2}; % number of iterations
NumAlphaParams = 5; %fourth
CostMet = CondensedCostMetrics(job_output{1,1}{1,2}{1}, NumExperiments, NumAlphaParams); 
AGO_fy_predeterminedbeta_output{4,4} = CostMet(1); % AIC
AGO_fy_predeterminedbeta_output{4,5} = job_output{1,1}{1,1}{1}; % fit parameters
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

startingJobNum = startingJobNum + 1;
job = findJob(myCluster, 'ID', startingJobNum);
job_output = fetchOutputs(job);
AGO_fy_predeterminedbeta_output{5,1} = job_output{1,1}{1,2}{1};
AGO_fy_predeterminedbeta_output{5,2} = job_output{1,1}{1,1}{2};
AGO_fy_predeterminedbeta_output{5,3} = job_output{1,1}{1,1}{2}; % number of iterations
NumAlphaParams = 6; %fifth
CostMet = CondensedCostMetrics(job_output{1,1}{1,2}{1}, NumExperiments, NumAlphaParams); 
AGO_fy_predeterminedbeta_output{5,4} = CostMet(1); % AIC
AGO_fy_predeterminedbeta_output{5,5} = job_output{1,1}{1,1}{1}; % fit parameters
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

startingJobNum = startingJobNum + 1;
job = findJob(myCluster, 'ID', startingJobNum);
job_output = fetchOutputs(job);
AGO_fy_predeterminedbeta_output{6,1} = job_output{1,1}{1,2}{1};
AGO_fy_predeterminedbeta_output{6,2} = job_output{1,1}{1,1}{2};
AGO_fy_predeterminedbeta_output{6,3} = job_output{1,1}{1,1}{2}; % number of iterations
NumAlphaParams = 2; %Q
CostMet = CondensedCostMetrics(job_output{1,1}{1,2}{1}, NumExperiments, NumAlphaParams); 
AGO_fy_predeterminedbeta_output{6,4} = CostMet(1); % AIC
AGO_fy_predeterminedbeta_output{6,5} = job_output{1,1}{1,1}{1}; % fit parameters
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

startingJobNum = startingJobNum + 1;
job = findJob(myCluster, 'ID', startingJobNum);
job_output = fetchOutputs(job);
AGO_fy_predeterminedbeta_output{7,1} = job_output{1,1}{1,2}{1};
AGO_fy_predeterminedbeta_output{7,2} = job_output{1,1}{1,1}{2};
AGO_fy_predeterminedbeta_output{7,3} = job_output{1,1}{1,1}{2}; % number of iterations
NumAlphaParams = 3; %QE
CostMet = CondensedCostMetrics(job_output{1,1}{1,2}{1}, NumExperiments, NumAlphaParams); 
AGO_fy_predeterminedbeta_output{7,4} = CostMet(1); % AIC
AGO_fy_predeterminedbeta_output{7,5} = job_output{1,1}{1,1}{1}; % fit parameters
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

startingJobNum = startingJobNum + 1;
job = findJob(myCluster, 'ID', startingJobNum);
job_output = fetchOutputs(job);
AGO_fy_predeterminedbeta_output{8,1} = job_output{1,1}{1,2}{1};
AGO_fy_predeterminedbeta_output{8,2} = job_output{1,1}{1,1}{2};
AGO_fy_predeterminedbeta_output{8,3} = job_output{1,1}{1,1}{2}; % number of iterations
NumAlphaParams = 3; %QE2
CostMet = CondensedCostMetrics(job_output{1,1}{1,2}{1}, NumExperiments, NumAlphaParams); 
AGO_fy_predeterminedbeta_output{8,4} = CostMet(1); % AIC
AGO_fy_predeterminedbeta_output{8,5} = job_output{1,1}{1,1}{1}; % fit parameters
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

startingJobNum = startingJobNum + 1;
job = findJob(myCluster, 'ID', startingJobNum);
job_output = fetchOutputs(job);
AGO_fy_predeterminedbeta_output{9,1} = job_output{1,1}{1,2}{1};
AGO_fy_predeterminedbeta_output{9,2} = job_output{1,1}{1,1}{2};
AGO_fy_predeterminedbeta_output{9,3} = job_output{1,1}{1,1}{2}; % number of iterations
NumAlphaParams = 3; %LE
CostMet = CondensedCostMetrics(job_output{1,1}{1,2}{1}, NumExperiments, NumAlphaParams); 
AGO_fy_predeterminedbeta_output{9,4} = CostMet(1); % AIC
AGO_fy_predeterminedbeta_output{9,5} = job_output{1,1}{1,1}{1}; % fit parameters
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

startingJobNum = startingJobNum + 1;
job = findJob(myCluster, 'ID', startingJobNum);
job_output = fetchOutputs(job);
AGO_fy_predeterminedbeta_output{10,1} = job_output{1,1}{1,2}{1};
AGO_fy_predeterminedbeta_output{10,2} = job_output{1,1}{1,1}{2};
AGO_fy_predeterminedbeta_output{10,3} = job_output{1,1}{1,1}{2}; % number of iterations
NumAlphaParams = 4; %LQE
CostMet = CondensedCostMetrics(job_output{1,1}{1,2}{1}, NumExperiments, NumAlphaParams); 
AGO_fy_predeterminedbeta_output{10,4} = CostMet(1); % AIC
AGO_fy_predeterminedbeta_output{10,5} = job_output{1,1}{1,1}{1}; % fit parameters
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

startingJobNum = startingJobNum + 1;
job = findJob(myCluster, 'ID', startingJobNum);
job_output = fetchOutputs(job);
AGO_fy_predeterminedbeta_output{11,1} = job_output{1,1}{1,2}{1};
AGO_fy_predeterminedbeta_output{11,2} = job_output{1,1}{1,1}{2};
AGO_fy_predeterminedbeta_output{11,3} = job_output{1,1}{1,1}{2}; % number of iterations
NumAlphaParams = 3; %LE2
CostMet = CondensedCostMetrics(job_output{1,1}{1,2}{1}, NumExperiments, NumAlphaParams); 
AGO_fy_predeterminedbeta_output{11,4} = CostMet(1); % AIC
AGO_fy_predeterminedbeta_output{11,5} = job_output{1,1}{1,1}{1}; % fit parameters
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

startingJobNum = startingJobNum + 1;
job = findJob(myCluster, 'ID', startingJobNum);
job_output = fetchOutputs(job);
AGO_fy_predeterminedbeta_output{12,1} = job_output{1,1}{1,2}{1};
AGO_fy_predeterminedbeta_output{12,2} = job_output{1,1}{1,1}{2};
AGO_fy_predeterminedbeta_output{12,3} = job_output{1,1}{1,1}{2}; % number of iterations
NumAlphaParams = 4; %LQE2
CostMet = CondensedCostMetrics(job_output{1,1}{1,2}{1}, NumExperiments, NumAlphaParams); 
AGO_fy_predeterminedbeta_output{12,4} = CostMet(1); % AIC
AGO_fy_predeterminedbeta_output{12,5} = job_output{1,1}{1,1}{1}; % fit parameters
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

startingJobNum = startingJobNum + 1;
job = findJob(myCluster, 'ID', startingJobNum);
job_output = fetchOutputs(job);
AGO_fy_predeterminedbeta_output{13,1} = job_output{1,1}{1,2}{1};
AGO_fy_predeterminedbeta_output{13,2} = job_output{1,1}{1,1}{2};
AGO_fy_predeterminedbeta_output{13,3} = job_output{1,1}{1,1}{2}; % number of iterations
NumAlphaParams = 4; %Gaussian
CostMet = CondensedCostMetrics(job_output{1,1}{1,2}{1}, NumExperiments, NumAlphaParams); 
AGO_fy_predeterminedbeta_output{13,4} = CostMet(1); % AIC
AGO_fy_predeterminedbeta_output{13,5} = job_output{1,1}{1,1}{1}; % fit parameters
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

startingJobNum = startingJobNum + 1;
job = findJob(myCluster, 'ID', startingJobNum);
job_output = fetchOutputs(job);
AGO_fy_predeterminedbeta_output{14,1} = job_output{1,1}{1,2}{1};
AGO_fy_predeterminedbeta_output{14,2} = job_output{1,1}{1,1}{2};
AGO_fy_predeterminedbeta_output{14,3} = job_output{1,1}{1,1}{2}; % number of iterations
NumAlphaParams = 5; %Skew Gaussian
CostMet = CondensedCostMetrics(job_output{1,1}{1,2}{1}, NumExperiments, NumAlphaParams); 
AGO_fy_predeterminedbeta_output{14,4} = CostMet(1); % AIC
AGO_fy_predeterminedbeta_output{14,5} = job_output{1,1}{1,1}{1}; % fit parameters
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

startingJobNum = startingJobNum + 1;
job = findJob(myCluster, 'ID', 128);
job_output = fetchOutputs(job);
AGO_fy_predeterminedbeta_output{15,1} = job_output{1,1}{1,2}{1};
AGO_fy_predeterminedbeta_output{15,2} = job_output{1,1}{1,1}{2};
AGO_fy_predeterminedbeta_output{15,3} = job_output{1,1}{1,1}{2}; % number of iterations
NumAlphaParams = 5; %Morstin
CostMet = CondensedCostMetrics(job_output{1,1}{1,2}{1}, NumExperiments, NumAlphaParams); 
AGO_fy_predeterminedbeta_output{15,4} = CostMet(1); % AIC
AGO_fy_predeterminedbeta_output{15,5} = job_output{1,1}{1,1}{1}; % fit parameters
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

writecell(AGO_fy_predeterminedbeta_output,"AGO_fy_individualbeta_cluster.csv")