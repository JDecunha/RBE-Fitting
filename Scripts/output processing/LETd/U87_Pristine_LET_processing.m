%% Create the empty array
U87_Pristine_LETd_output = cell(15,3);

%% Pull the data
job = findJob(myCluster, 'ID', 388);
job_output = fetchOutputs(job);
U87_Pristine_LETd_output{1,1} = job_output{1,1}{1,2}{1};
U87_Pristine_LETd_output{1,2} = job_output{1,1}{1,1}{2};
U87_Pristine_LETd_output{1,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 389);
job_output = fetchOutputs(job);
U87_Pristine_LETd_output{2,1} = job_output{1,1}{1,2}{1};
U87_Pristine_LETd_output{2,2} = job_output{1,1}{1,1}{2};
U87_Pristine_LETd_output{2,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 390);
job_output = fetchOutputs(job);
U87_Pristine_LETd_output{3,1} = job_output{1,1}{1,2}{1};
U87_Pristine_LETd_output{3,2} = job_output{1,1}{1,1}{2};
U87_Pristine_LETd_output{3,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 391);
job_output = fetchOutputs(job);
U87_Pristine_LETd_output{4,1} = job_output{1,1}{1,2}{1};
U87_Pristine_LETd_output{4,2} = job_output{1,1}{1,1}{2};
U87_Pristine_LETd_output{4,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});


job = findJob(myCluster, 'ID', 392);
job_output = fetchOutputs(job);
U87_Pristine_LETd_output{5,1} = job_output{1,1}{1,2}{1};
U87_Pristine_LETd_output{5,2} = job_output{1,1}{1,1}{2};
U87_Pristine_LETd_output{5,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});


job = findJob(myCluster, 'ID', 393);
job_output = fetchOutputs(job);
U87_Pristine_LETd_output{6,1} = job_output{1,1}{1,2}{1};
U87_Pristine_LETd_output{6,2} = job_output{1,1}{1,1}{2};
U87_Pristine_LETd_output{6,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 394);
job_output = fetchOutputs(job);
U87_Pristine_LETd_output{7,1} = job_output{1,1}{1,2}{1};
U87_Pristine_LETd_output{7,2} = job_output{1,1}{1,1}{2};
U87_Pristine_LETd_output{7,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 395);
job_output = fetchOutputs(job);
U87_Pristine_LETd_output{8,1} = job_output{1,1}{1,2}{1};
U87_Pristine_LETd_output{8,2} = job_output{1,1}{1,1}{2};
U87_Pristine_LETd_output{8,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 396);
job_output = fetchOutputs(job);
U87_Pristine_LETd_output{9,1} = job_output{1,1}{1,2}{1};
U87_Pristine_LETd_output{9,2} = job_output{1,1}{1,1}{2};
U87_Pristine_LETd_output{9,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 397);
job_output = fetchOutputs(job);
U87_Pristine_LETd_output{10,1} = job_output{1,1}{1,2}{1};
U87_Pristine_LETd_output{10,2} = job_output{1,1}{1,1}{2};
U87_Pristine_LETd_output{10,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 398);
job_output = fetchOutputs(job);
U87_Pristine_LETd_output{11,1} = job_output{1,1}{1,2}{1};
U87_Pristine_LETd_output{11,2} = job_output{1,1}{1,1}{2};
U87_Pristine_LETd_output{11,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 399);
job_output = fetchOutputs(job);
U87_Pristine_LETd_output{12,1} = job_output{1,1}{1,2}{1};
U87_Pristine_LETd_output{12,2} = job_output{1,1}{1,1}{2};
U87_Pristine_LETd_output{12,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 400);
job_output = fetchOutputs(job);
U87_Pristine_LETd_output{13,1} = job_output{1,1}{1,2}{1};
U87_Pristine_LETd_output{13,2} = job_output{1,1}{1,1}{2};
U87_Pristine_LETd_output{13,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 401);
job_output = fetchOutputs(job);
U87_Pristine_LETd_output{14,1} = job_output{1,1}{1,2}{1};
U87_Pristine_LETd_output{14,2} = job_output{1,1}{1,1}{2};
U87_Pristine_LETd_output{14,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 402);
job_output = fetchOutputs(job);
U87_Pristine_LETd_output{15,1} = job_output{1,1}{1,2}{1};
U87_Pristine_LETd_output{15,2} = job_output{1,1}{1,1}{2};
U87_Pristine_LETd_output{15,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

writecell(U87_Pristine_LETd_output,"U87_Pristine_LETd.csv")