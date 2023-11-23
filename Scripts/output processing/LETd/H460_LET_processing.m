%% Create the empty array
H460_LETd_output = cell(15,3);

%% Pull the data
job = findJob(myCluster, 'ID', 358);
job_output = fetchOutputs(job);
H460_LETd_output{1,1} = job_output{1,1}{1,2}{1};
H460_LETd_output{1,2} = job_output{1,1}{1,1}{2};
H460_LETd_output{1,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 359);
job_output = fetchOutputs(job);
H460_LETd_output{2,1} = job_output{1,1}{1,2}{1};
H460_LETd_output{2,2} = job_output{1,1}{1,1}{2};
H460_LETd_output{2,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 360);
job_output = fetchOutputs(job);
H460_LETd_output{3,1} = job_output{1,1}{1,2}{1};
H460_LETd_output{3,2} = job_output{1,1}{1,1}{2};
H460_LETd_output{3,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 361);
job_output = fetchOutputs(job);
H460_LETd_output{4,1} = job_output{1,1}{1,2}{1};
H460_LETd_output{4,2} = job_output{1,1}{1,1}{2};
H460_LETd_output{4,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});


job = findJob(myCluster, 'ID', 362);
job_output = fetchOutputs(job);
H460_LETd_output{5,1} = job_output{1,1}{1,2}{1};
H460_LETd_output{5,2} = job_output{1,1}{1,1}{2};
H460_LETd_output{5,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});


job = findJob(myCluster, 'ID', 363);
job_output = fetchOutputs(job);
H460_LETd_output{6,1} = job_output{1,1}{1,2}{1};
H460_LETd_output{6,2} = job_output{1,1}{1,1}{2};
H460_LETd_output{6,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 364);
job_output = fetchOutputs(job);
H460_LETd_output{7,1} = job_output{1,1}{1,2}{1};
H460_LETd_output{7,2} = job_output{1,1}{1,1}{2};
H460_LETd_output{7,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 365);
job_output = fetchOutputs(job);
H460_LETd_output{8,1} = job_output{1,1}{1,2}{1};
H460_LETd_output{8,2} = job_output{1,1}{1,1}{2};
H460_LETd_output{8,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 366);
job_output = fetchOutputs(job);
H460_LETd_output{9,1} = job_output{1,1}{1,2}{1};
H460_LETd_output{9,2} = job_output{1,1}{1,1}{2};
H460_LETd_output{9,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 367);
job_output = fetchOutputs(job);
H460_LETd_output{10,1} = job_output{1,1}{1,2}{1};
H460_LETd_output{10,2} = job_output{1,1}{1,1}{2};
H460_LETd_output{10,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 368);
job_output = fetchOutputs(job);
H460_LETd_output{11,1} = job_output{1,1}{1,2}{1};
H460_LETd_output{11,2} = job_output{1,1}{1,1}{2};
H460_LETd_output{11,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 369);
job_output = fetchOutputs(job);
H460_LETd_output{12,1} = job_output{1,1}{1,2}{1};
H460_LETd_output{12,2} = job_output{1,1}{1,1}{2};
H460_LETd_output{12,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 370);
job_output = fetchOutputs(job);
H460_LETd_output{13,1} = job_output{1,1}{1,2}{1};
H460_LETd_output{13,2} = job_output{1,1}{1,1}{2};
H460_LETd_output{13,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 371);
job_output = fetchOutputs(job);
H460_LETd_output{14,1} = job_output{1,1}{1,2}{1};
H460_LETd_output{14,2} = job_output{1,1}{1,1}{2};
H460_LETd_output{14,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 372);
job_output = fetchOutputs(job);
H460_LETd_output{15,1} = job_output{1,1}{1,2}{1};
H460_LETd_output{15,2} = job_output{1,1}{1,1}{2};
H460_LETd_output{15,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

writecell(H460_LETd_output,"H460_LETd.csv")