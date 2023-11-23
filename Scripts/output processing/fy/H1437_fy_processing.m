%% Create the empty array
H1437_fy_output = cell(15,3);

%% Start with linear
job480 = findJob(myCluster, 'ID', 555);
job480_output = fetchOutputs(job480);
H1437_fy_output{1,1} = job480_output{1,1}{1,2}{1};
H1437_fy_output{1,2} = job480_output{1,1}{1,1}{2};
H1437_fy_output{1,3} = job480_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job480_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job480_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 556);
job_output = fetchOutputs(job);
H1437_fy_output{2,1} = job_output{1,1}{1,2}{1};
H1437_fy_output{2,2} = job_output{1,1}{1,1}{2};
H1437_fy_output{2,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 557);
job_output = fetchOutputs(job);
H1437_fy_output{3,1} = job_output{1,1}{1,2}{1};
H1437_fy_output{3,2} = job_output{1,1}{1,1}{2};
H1437_fy_output{3,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 558);
job_output = fetchOutputs(job);
H1437_fy_output{4,1} = job_output{1,1}{1,2}{1};
H1437_fy_output{4,2} = job_output{1,1}{1,1}{2};
H1437_fy_output{4,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});


job = findJob(myCluster, 'ID', 570);
job_output = fetchOutputs(job);
H1437_fy_output{5,1} = job_output{1,1}{1,2}{1};
H1437_fy_output{5,2} = job_output{1,1}{1,1}{2};
H1437_fy_output{5,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});


job = findJob(myCluster, 'ID', 560);
job_output = fetchOutputs(job);
H1437_fy_output{6,1} = job_output{1,1}{1,2}{1};
H1437_fy_output{6,2} = job_output{1,1}{1,1}{2};
H1437_fy_output{6,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 561);
job_output = fetchOutputs(job);
H1437_fy_output{7,1} = job_output{1,1}{1,2}{1};
H1437_fy_output{7,2} = job_output{1,1}{1,1}{2};
H1437_fy_output{7,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 562);
job_output = fetchOutputs(job);
H1437_fy_output{8,1} = job_output{1,1}{1,2}{1};
H1437_fy_output{8,2} = job_output{1,1}{1,1}{2};
H1437_fy_output{8,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 563);
job_output = fetchOutputs(job);
H1437_fy_output{9,1} = job_output{1,1}{1,2}{1};
H1437_fy_output{9,2} = job_output{1,1}{1,1}{2};
H1437_fy_output{9,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 564);
job_output = fetchOutputs(job);
H1437_fy_output{10,1} = job_output{1,1}{1,2}{1};
H1437_fy_output{10,2} = job_output{1,1}{1,1}{2};
H1437_fy_output{10,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 565);
job_output = fetchOutputs(job);
H1437_fy_output{11,1} = job_output{1,1}{1,2}{1};
H1437_fy_output{11,2} = job_output{1,1}{1,1}{2};
H1437_fy_output{11,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 566);
job_output = fetchOutputs(job);
H1437_fy_output{12,1} = job_output{1,1}{1,2}{1};
H1437_fy_output{12,2} = job_output{1,1}{1,1}{2};
H1437_fy_output{12,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 567);
job_output = fetchOutputs(job);
H1437_fy_output{13,1} = job_output{1,1}{1,2}{1};
H1437_fy_output{13,2} = job_output{1,1}{1,1}{2};
H1437_fy_output{13,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 568);
job_output = fetchOutputs(job);
H1437_fy_output{14,1} = job_output{1,1}{1,2}{1};
H1437_fy_output{14,2} = job_output{1,1}{1,1}{2};
H1437_fy_output{14,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 569);
job_output = fetchOutputs(job);
H1437_fy_output{15,1} = job_output{1,1}{1,2}{1};
H1437_fy_output{15,2} = job_output{1,1}{1,1}{2};
H1437_fy_output{15,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

writecell(H1437_fy_output,"H1437_fy.csv")