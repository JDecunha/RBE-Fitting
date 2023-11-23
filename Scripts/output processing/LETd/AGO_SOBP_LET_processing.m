%% Create the empty array
AGO_SOBP_LETd_output = cell(15,3);

%% AGO Pristine
job = findJob(myCluster, 'ID', 433);
job_output = fetchOutputs(job);
AGO_SOBP_LETd_output{1,1} = job_output{1,1}{1,2}{1};
AGO_SOBP_LETd_output{1,2} = job_output{1,1}{1,1}{2};
AGO_SOBP_LETd_output{1,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 434);
job_output = fetchOutputs(job);
AGO_SOBP_LETd_output{2,1} = job_output{1,1}{1,2}{1};
AGO_SOBP_LETd_output{2,2} = job_output{1,1}{1,1}{2};
AGO_SOBP_LETd_output{2,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 435);
job_output = fetchOutputs(job);
AGO_SOBP_LETd_output{3,1} = job_output{1,1}{1,2}{1};
AGO_SOBP_LETd_output{3,2} = job_output{1,1}{1,1}{2};
AGO_SOBP_LETd_output{3,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 448);
job_output = fetchOutputs(job);
AGO_SOBP_LETd_output{14,1} = job_output{1,1}{1,2}{1};
AGO_SOBP_LETd_output{14,2} = job_output{1,1}{1,1}{2};
AGO_SOBP_LETd_output{14,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 449);
job_output = fetchOutputs(job);
AGO_SOBP_LETd_output{15,1} = job_output{1,1}{1,2}{1};
AGO_SOBP_LETd_output{15,2} = job_output{1,1}{1,1}{2};
AGO_SOBP_LETd_output{15,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 438);
job_output = fetchOutputs(job);
AGO_SOBP_LETd_output{4,1} = job_output{1,1}{1,2}{1};
AGO_SOBP_LETd_output{4,2} = job_output{1,1}{1,1}{2};
AGO_SOBP_LETd_output{4,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});


job = findJob(myCluster, 'ID', 439);
job_output = fetchOutputs(job);
AGO_SOBP_LETd_output{5,1} = job_output{1,1}{1,2}{1};
AGO_SOBP_LETd_output{5,2} = job_output{1,1}{1,1}{2};
AGO_SOBP_LETd_output{5,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});


job = findJob(myCluster, 'ID', 440);
job_output = fetchOutputs(job);
AGO_SOBP_LETd_output{6,1} = job_output{1,1}{1,2}{1};
AGO_SOBP_LETd_output{6,2} = job_output{1,1}{1,1}{2};
AGO_SOBP_LETd_output{6,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 441);
job_output = fetchOutputs(job);
AGO_SOBP_LETd_output{7,1} = job_output{1,1}{1,2}{1};
AGO_SOBP_LETd_output{7,2} = job_output{1,1}{1,1}{2};
AGO_SOBP_LETd_output{7,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 442);
job_output = fetchOutputs(job);
AGO_SOBP_LETd_output{8,1} = job_output{1,1}{1,2}{1};
AGO_SOBP_LETd_output{8,2} = job_output{1,1}{1,1}{2};
AGO_SOBP_LETd_output{8,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 443);
job_output = fetchOutputs(job);
AGO_SOBP_LETd_output{9,1} = job_output{1,1}{1,2}{1};
AGO_SOBP_LETd_output{9,2} = job_output{1,1}{1,1}{2};
AGO_SOBP_LETd_output{9,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 444);
job_output = fetchOutputs(job);
AGO_SOBP_LETd_output{10,1} = job_output{1,1}{1,2}{1};
AGO_SOBP_LETd_output{10,2} = job_output{1,1}{1,1}{2};
AGO_SOBP_LETd_output{10,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 445);
job_output = fetchOutputs(job);
AGO_SOBP_LETd_output{11,1} = job_output{1,1}{1,2}{1};
AGO_SOBP_LETd_output{11,2} = job_output{1,1}{1,1}{2};
AGO_SOBP_LETd_output{11,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 446);
job_output = fetchOutputs(job);
AGO_SOBP_LETd_output{12,1} = job_output{1,1}{1,2}{1};
AGO_SOBP_LETd_output{12,2} = job_output{1,1}{1,1}{2};
AGO_SOBP_LETd_output{12,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

job = findJob(myCluster, 'ID', 447);
job_output = fetchOutputs(job);
AGO_SOBP_LETd_output{13,1} = job_output{1,1}{1,2}{1};
AGO_SOBP_LETd_output{13,2} = job_output{1,1}{1,1}{2};
AGO_SOBP_LETd_output{13,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{3});

writecell(AGO_SOBP_LETd_output,"AGO_SOBP_LETd.csv")