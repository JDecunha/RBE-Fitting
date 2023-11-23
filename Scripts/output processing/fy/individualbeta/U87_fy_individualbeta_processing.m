%% Create the empty array
U87_fy_predeterminedbeta_output = cell(15,3);

%% Pull the data
job = findJob(myCluster, 'ID', 673);
job_output = fetchOutputs(job);
U87_fy_predeterminedbeta_output{1,1} = job_output{1,1}{1,2}{1};
U87_fy_predeterminedbeta_output{1,2} = job_output{1,1}{1,1}{2};
U87_fy_predeterminedbeta_output{1,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 674);
job_output = fetchOutputs(job);
U87_fy_predeterminedbeta_output{2,1} = job_output{1,1}{1,2}{1};
U87_fy_predeterminedbeta_output{2,2} = job_output{1,1}{1,1}{2};
U87_fy_predeterminedbeta_output{2,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 675);
job_output = fetchOutputs(job);
U87_fy_predeterminedbeta_output{3,1} = job_output{1,1}{1,2}{1};
U87_fy_predeterminedbeta_output{3,2} = job_output{1,1}{1,1}{2};
U87_fy_predeterminedbeta_output{3,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 676);
job_output = fetchOutputs(job);
U87_fy_predeterminedbeta_output{4,1} = job_output{1,1}{1,2}{1};
U87_fy_predeterminedbeta_output{4,2} = job_output{1,1}{1,1}{2};
U87_fy_predeterminedbeta_output{4,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});


job = findJob(myCluster, 'ID', 677);
job_output = fetchOutputs(job);
U87_fy_predeterminedbeta_output{5,1} = job_output{1,1}{1,2}{1};
U87_fy_predeterminedbeta_output{5,2} = job_output{1,1}{1,1}{2};
U87_fy_predeterminedbeta_output{5,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});


job = findJob(myCluster, 'ID', 678);
job_output = fetchOutputs(job);
U87_fy_predeterminedbeta_output{6,1} = job_output{1,1}{1,2}{1};
U87_fy_predeterminedbeta_output{6,2} = job_output{1,1}{1,1}{2};
U87_fy_predeterminedbeta_output{6,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 679);
job_output = fetchOutputs(job);
U87_fy_predeterminedbeta_output{7,1} = job_output{1,1}{1,2}{1};
U87_fy_predeterminedbeta_output{7,2} = job_output{1,1}{1,1}{2};
U87_fy_predeterminedbeta_output{7,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 680);
job_output = fetchOutputs(job);
U87_fy_predeterminedbeta_output{8,1} = job_output{1,1}{1,2}{1};
U87_fy_predeterminedbeta_output{8,2} = job_output{1,1}{1,1}{2};
U87_fy_predeterminedbeta_output{8,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 681);
job_output = fetchOutputs(job);
U87_fy_predeterminedbeta_output{9,1} = job_output{1,1}{1,2}{1};
U87_fy_predeterminedbeta_output{9,2} = job_output{1,1}{1,1}{2};
U87_fy_predeterminedbeta_output{9,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 682);
job_output = fetchOutputs(job);
U87_fy_predeterminedbeta_output{10,1} = job_output{1,1}{1,2}{1};
U87_fy_predeterminedbeta_output{10,2} = job_output{1,1}{1,1}{2};
U87_fy_predeterminedbeta_output{10,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 683);
job_output = fetchOutputs(job);
U87_fy_predeterminedbeta_output{11,1} = job_output{1,1}{1,2}{1};
U87_fy_predeterminedbeta_output{11,2} = job_output{1,1}{1,1}{2};
U87_fy_predeterminedbeta_output{11,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 684);
job_output = fetchOutputs(job);
U87_fy_predeterminedbeta_output{12,1} = job_output{1,1}{1,2}{1};
U87_fy_predeterminedbeta_output{12,2} = job_output{1,1}{1,1}{2};
U87_fy_predeterminedbeta_output{12,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 685);
job_output = fetchOutputs(job);
U87_fy_predeterminedbeta_output{13,1} = job_output{1,1}{1,2}{1};
U87_fy_predeterminedbeta_output{13,2} = job_output{1,1}{1,1}{2};
U87_fy_predeterminedbeta_output{13,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 686);
job_output = fetchOutputs(job);
U87_fy_predeterminedbeta_output{14,1} = job_output{1,1}{1,2}{1};
U87_fy_predeterminedbeta_output{14,2} = job_output{1,1}{1,1}{2};
U87_fy_predeterminedbeta_output{14,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 687);
job_output = fetchOutputs(job);
U87_fy_predeterminedbeta_output{15,1} = job_output{1,1}{1,2}{1};
U87_fy_predeterminedbeta_output{15,2} = job_output{1,1}{1,1}{2};
U87_fy_predeterminedbeta_output{15,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

writecell(U87_fy_predeterminedbeta_output,"U87_fy_individualbeta.csv")