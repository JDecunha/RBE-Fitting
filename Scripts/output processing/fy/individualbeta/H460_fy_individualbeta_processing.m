%% Create the empty array
H460_fy_predeterminedbeta_output = cell(15,3);

%% Pull the data
job = findJob(myCluster, 'ID', 628);
job_output = fetchOutputs(job);
H460_fy_predeterminedbeta_output{1,1} = job_output{1,1}{1,2}{1};
H460_fy_predeterminedbeta_output{1,2} = job_output{1,1}{1,1}{2};
H460_fy_predeterminedbeta_output{1,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 629);
job_output = fetchOutputs(job);
H460_fy_predeterminedbeta_output{2,1} = job_output{1,1}{1,2}{1};
H460_fy_predeterminedbeta_output{2,2} = job_output{1,1}{1,1}{2};
H460_fy_predeterminedbeta_output{2,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 630);
job_output = fetchOutputs(job);
H460_fy_predeterminedbeta_output{3,1} = job_output{1,1}{1,2}{1};
H460_fy_predeterminedbeta_output{3,2} = job_output{1,1}{1,1}{2};
H460_fy_predeterminedbeta_output{3,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 631);
job_output = fetchOutputs(job);
H460_fy_predeterminedbeta_output{4,1} = job_output{1,1}{1,2}{1};
H460_fy_predeterminedbeta_output{4,2} = job_output{1,1}{1,1}{2};
H460_fy_predeterminedbeta_output{4,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});


job = findJob(myCluster, 'ID', 632);
job_output = fetchOutputs(job);
H460_fy_predeterminedbeta_output{5,1} = job_output{1,1}{1,2}{1};
H460_fy_predeterminedbeta_output{5,2} = job_output{1,1}{1,1}{2};
H460_fy_predeterminedbeta_output{5,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});


job = findJob(myCluster, 'ID', 633);
job_output = fetchOutputs(job);
H460_fy_predeterminedbeta_output{6,1} = job_output{1,1}{1,2}{1};
H460_fy_predeterminedbeta_output{6,2} = job_output{1,1}{1,1}{2};
H460_fy_predeterminedbeta_output{6,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 634);
job_output = fetchOutputs(job);
H460_fy_predeterminedbeta_output{7,1} = job_output{1,1}{1,2}{1};
H460_fy_predeterminedbeta_output{7,2} = job_output{1,1}{1,1}{2};
H460_fy_predeterminedbeta_output{7,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 635);
job_output = fetchOutputs(job);
H460_fy_predeterminedbeta_output{8,1} = job_output{1,1}{1,2}{1};
H460_fy_predeterminedbeta_output{8,2} = job_output{1,1}{1,1}{2};
H460_fy_predeterminedbeta_output{8,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 636);
job_output = fetchOutputs(job);
H460_fy_predeterminedbeta_output{9,1} = job_output{1,1}{1,2}{1};
H460_fy_predeterminedbeta_output{9,2} = job_output{1,1}{1,1}{2};
H460_fy_predeterminedbeta_output{9,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 637);
job_output = fetchOutputs(job);
H460_fy_predeterminedbeta_output{10,1} = job_output{1,1}{1,2}{1};
H460_fy_predeterminedbeta_output{10,2} = job_output{1,1}{1,1}{2};
H460_fy_predeterminedbeta_output{10,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 638);
job_output = fetchOutputs(job);
H460_fy_predeterminedbeta_output{11,1} = job_output{1,1}{1,2}{1};
H460_fy_predeterminedbeta_output{11,2} = job_output{1,1}{1,1}{2};
H460_fy_predeterminedbeta_output{11,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 639);
job_output = fetchOutputs(job);
H460_fy_predeterminedbeta_output{12,1} = job_output{1,1}{1,2}{1};
H460_fy_predeterminedbeta_output{12,2} = job_output{1,1}{1,1}{2};
H460_fy_predeterminedbeta_output{12,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 640);
job_output = fetchOutputs(job);
H460_fy_predeterminedbeta_output{13,1} = job_output{1,1}{1,2}{1};
H460_fy_predeterminedbeta_output{13,2} = job_output{1,1}{1,1}{2};
H460_fy_predeterminedbeta_output{13,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 641);
job_output = fetchOutputs(job);
H460_fy_predeterminedbeta_output{14,1} = job_output{1,1}{1,2}{1};
H460_fy_predeterminedbeta_output{14,2} = job_output{1,1}{1,1}{2};
H460_fy_predeterminedbeta_output{14,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 642);
job_output = fetchOutputs(job);
H460_fy_predeterminedbeta_output{15,1} = job_output{1,1}{1,2}{1};
H460_fy_predeterminedbeta_output{15,2} = job_output{1,1}{1,1}{2};
H460_fy_predeterminedbeta_output{15,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

writecell(H460_fy_predeterminedbeta_output,"H460_fy_individualbeta.csv")