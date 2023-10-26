%% Create the empty array
U87_SOBP_fy_output = cell(15,3);

%% Pull the data
job = findJob(myCluster, 'ID', 540);
job_output = fetchOutputs(job);
U87_SOBP_fy_output{1,1} = job_output{1,1}{1,2}{1};
U87_SOBP_fy_output{1,2} = job_output{1,1}{1,1}{2};
U87_SOBP_fy_output{1,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 541);
job_output = fetchOutputs(job);
U87_SOBP_fy_output{2,1} = job_output{1,1}{1,2}{1};
U87_SOBP_fy_output{2,2} = job_output{1,1}{1,1}{2};
U87_SOBP_fy_output{2,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 542);
job_output = fetchOutputs(job);
U87_SOBP_fy_output{3,1} = job_output{1,1}{1,2}{1};
U87_SOBP_fy_output{3,2} = job_output{1,1}{1,1}{2};
U87_SOBP_fy_output{3,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 543);
job_output = fetchOutputs(job);
U87_SOBP_fy_output{4,1} = job_output{1,1}{1,2}{1};
U87_SOBP_fy_output{4,2} = job_output{1,1}{1,1}{2};
U87_SOBP_fy_output{4,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});


job = findJob(myCluster, 'ID', 544);
job_output = fetchOutputs(job);
U87_SOBP_fy_output{5,1} = job_output{1,1}{1,2}{1};
U87_SOBP_fy_output{5,2} = job_output{1,1}{1,1}{2};
U87_SOBP_fy_output{5,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});


job = findJob(myCluster, 'ID', 545);
job_output = fetchOutputs(job);
U87_SOBP_fy_output{6,1} = job_output{1,1}{1,2}{1};
U87_SOBP_fy_output{6,2} = job_output{1,1}{1,1}{2};
U87_SOBP_fy_output{6,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 546);
job_output = fetchOutputs(job);
U87_SOBP_fy_output{7,1} = job_output{1,1}{1,2}{1};
U87_SOBP_fy_output{7,2} = job_output{1,1}{1,1}{2};
U87_SOBP_fy_output{7,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 547);
job_output = fetchOutputs(job);
U87_SOBP_fy_output{8,1} = job_output{1,1}{1,2}{1};
U87_SOBP_fy_output{8,2} = job_output{1,1}{1,1}{2};
U87_SOBP_fy_output{8,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 548);
job_output = fetchOutputs(job);
U87_SOBP_fy_output{9,1} = job_output{1,1}{1,2}{1};
U87_SOBP_fy_output{9,2} = job_output{1,1}{1,1}{2};
U87_SOBP_fy_output{9,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 549);
job_output = fetchOutputs(job);
U87_SOBP_fy_output{10,1} = job_output{1,1}{1,2}{1};
U87_SOBP_fy_output{10,2} = job_output{1,1}{1,1}{2};
U87_SOBP_fy_output{10,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 550);
job_output = fetchOutputs(job);
U87_SOBP_fy_output{11,1} = job_output{1,1}{1,2}{1};
U87_SOBP_fy_output{11,2} = job_output{1,1}{1,1}{2};
U87_SOBP_fy_output{11,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 551);
job_output = fetchOutputs(job);
U87_SOBP_fy_output{12,1} = job_output{1,1}{1,2}{1};
U87_SOBP_fy_output{12,2} = job_output{1,1}{1,1}{2};
U87_SOBP_fy_output{12,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 552);
job_output = fetchOutputs(job);
U87_SOBP_fy_output{13,1} = job_output{1,1}{1,2}{1};
U87_SOBP_fy_output{13,2} = job_output{1,1}{1,1}{2};
U87_SOBP_fy_output{13,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 553);
job_output = fetchOutputs(job);
U87_SOBP_fy_output{14,1} = job_output{1,1}{1,2}{1};
U87_SOBP_fy_output{14,2} = job_output{1,1}{1,1}{2};
U87_SOBP_fy_output{14,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 554);
job_output = fetchOutputs(job);
U87_SOBP_fy_output{15,1} = job_output{1,1}{1,2}{1};
U87_SOBP_fy_output{15,2} = job_output{1,1}{1,1}{2};
U87_SOBP_fy_output{15,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

writecell(U87_SOBP_fy_output,"U87_SOBP_fy.csv")