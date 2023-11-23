%% Create the empty array
U87_SOBP_LETd_output = cell(15,3);

%% Pull the data
job = findJob(myCluster, 'ID', 418);
job_output = fetchOutputs(job);
U87_SOBP_LETd_output{1,1} = job_output{1,1}{1,2}{1};
U87_SOBP_LETd_output{1,2} = job_output{1,1}{1,1}{2};
U87_SOBP_LETd_output{1,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 419);
job_output = fetchOutputs(job);
U87_SOBP_LETd_output{2,1} = job_output{1,1}{1,2}{1};
U87_SOBP_LETd_output{2,2} = job_output{1,1}{1,1}{2};
U87_SOBP_LETd_output{2,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 420);
job_output = fetchOutputs(job);
U87_SOBP_LETd_output{3,1} = job_output{1,1}{1,2}{1};
U87_SOBP_LETd_output{3,2} = job_output{1,1}{1,1}{2};
U87_SOBP_LETd_output{3,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 421);
job_output = fetchOutputs(job);
U87_SOBP_LETd_output{4,1} = job_output{1,1}{1,2}{1};
U87_SOBP_LETd_output{4,2} = job_output{1,1}{1,1}{2};
U87_SOBP_LETd_output{4,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});


job = findJob(myCluster, 'ID', 422);
job_output = fetchOutputs(job);
U87_SOBP_LETd_output{5,1} = job_output{1,1}{1,2}{1};
U87_SOBP_LETd_output{5,2} = job_output{1,1}{1,1}{2};
U87_SOBP_LETd_output{5,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});


job = findJob(myCluster, 'ID', 423);
job_output = fetchOutputs(job);
U87_SOBP_LETd_output{6,1} = job_output{1,1}{1,2}{1};
U87_SOBP_LETd_output{6,2} = job_output{1,1}{1,1}{2};
U87_SOBP_LETd_output{6,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 424);
job_output = fetchOutputs(job);
U87_SOBP_LETd_output{7,1} = job_output{1,1}{1,2}{1};
U87_SOBP_LETd_output{7,2} = job_output{1,1}{1,1}{2};
U87_SOBP_LETd_output{7,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 425);
job_output = fetchOutputs(job);
U87_SOBP_LETd_output{8,1} = job_output{1,1}{1,2}{1};
U87_SOBP_LETd_output{8,2} = job_output{1,1}{1,1}{2};
U87_SOBP_LETd_output{8,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 426);
job_output = fetchOutputs(job);
U87_SOBP_LETd_output{9,1} = job_output{1,1}{1,2}{1};
U87_SOBP_LETd_output{9,2} = job_output{1,1}{1,1}{2};
U87_SOBP_LETd_output{9,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 427);
job_output = fetchOutputs(job);
U87_SOBP_LETd_output{10,1} = job_output{1,1}{1,2}{1};
U87_SOBP_LETd_output{10,2} = job_output{1,1}{1,1}{2};
U87_SOBP_LETd_output{10,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 428);
job_output = fetchOutputs(job);
U87_SOBP_LETd_output{11,1} = job_output{1,1}{1,2}{1};
U87_SOBP_LETd_output{11,2} = job_output{1,1}{1,1}{2};
U87_SOBP_LETd_output{11,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 429);
job_output = fetchOutputs(job);
U87_SOBP_LETd_output{12,1} = job_output{1,1}{1,2}{1};
U87_SOBP_LETd_output{12,2} = job_output{1,1}{1,1}{2};
U87_SOBP_LETd_output{12,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 430);
job_output = fetchOutputs(job);
U87_SOBP_LETd_output{13,1} = job_output{1,1}{1,2}{1};
U87_SOBP_LETd_output{13,2} = job_output{1,1}{1,1}{2};
U87_SOBP_LETd_output{13,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 431);
job_output = fetchOutputs(job);
U87_SOBP_LETd_output{14,1} = job_output{1,1}{1,2}{1};
U87_SOBP_LETd_output{14,2} = job_output{1,1}{1,1}{2};
U87_SOBP_LETd_output{14,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 432);
job_output = fetchOutputs(job);
U87_SOBP_LETd_output{15,1} = job_output{1,1}{1,2}{1};
U87_SOBP_LETd_output{15,2} = job_output{1,1}{1,1}{2};
U87_SOBP_LETd_output{15,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

writecell(U87_SOBP_LETd_output,"U87_SOBP_LETd.csv")