%% Create the empty array
H1437_fy_output = cell(15,3);

%% Start with linear
job480 = findJob(myCluster, 'ID', 480);
job480_output = fetchOutputs(job480);
H1437_fy_output{1,1} = job480_output{1,1}{1,2}{1};
H1437_fy_output{1,2} = job480_output{1,1}{1,1}{2};
H1437_fy_output{1,3} = job480_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job480_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job480_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 481);
job_output = fetchOutputs(job);
H1437_fy_output{2,1} = job_output{1,1}{1,2}{1};
H1437_fy_output{2,2} = job_output{1,1}{1,1}{2};
H1437_fy_output{2,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 482);
job_output = fetchOutputs(job);
H1437_fy_output{3,1} = job_output{1,1}{1,2}{1};
H1437_fy_output{3,2} = job_output{1,1}{1,1}{2};
H1437_fy_output{3,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 483);
job_output = fetchOutputs(job);
H1437_fy_output{4,1} = job_output{1,1}{1,2}{1};
H1437_fy_output{4,2} = job_output{1,1}{1,1}{2};
H1437_fy_output{4,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});


job = findJob(myCluster, 'ID', 484);
job_output = fetchOutputs(job);
H1437_fy_output{5,1} = job_output{1,1}{1,2}{1};
H1437_fy_output{5,2} = job_output{1,1}{1,1}{2};
H1437_fy_output{5,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});


job = findJob(myCluster, 'ID', 485);
job_output = fetchOutputs(job);
H1437_fy_output{6,1} = job_output{1,1}{1,2}{1};
H1437_fy_output{6,2} = job_output{1,1}{1,1}{2};
H1437_fy_output{6,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 486);
job_output = fetchOutputs(job);
H1437_fy_output{7,1} = job_output{1,1}{1,2}{1};
H1437_fy_output{7,2} = job_output{1,1}{1,1}{2};
H1437_fy_output{7,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 487);
job_output = fetchOutputs(job);
H1437_fy_output{8,1} = job_output{1,1}{1,2}{1};
H1437_fy_output{8,2} = job_output{1,1}{1,1}{2};
H1437_fy_output{8,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 488);
job_output = fetchOutputs(job);
H1437_fy_output{9,1} = job_output{1,1}{1,2}{1};
H1437_fy_output{9,2} = job_output{1,1}{1,1}{2};
H1437_fy_output{9,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 489);
job_output = fetchOutputs(job);
H1437_fy_output{10,1} = job_output{1,1}{1,2}{1};
H1437_fy_output{10,2} = job_output{1,1}{1,1}{2};
H1437_fy_output{10,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 490);
job_output = fetchOutputs(job);
H1437_fy_output{11,1} = job_output{1,1}{1,2}{1};
H1437_fy_output{11,2} = job_output{1,1}{1,1}{2};
H1437_fy_output{11,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 491);
job_output = fetchOutputs(job);
H1437_fy_output{12,1} = job_output{1,1}{1,2}{1};
H1437_fy_output{12,2} = job_output{1,1}{1,1}{2};
H1437_fy_output{12,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 492);
job_output = fetchOutputs(job);
H1437_fy_output{13,1} = job_output{1,1}{1,2}{1};
H1437_fy_output{13,2} = job_output{1,1}{1,1}{2};
H1437_fy_output{13,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 493);
job_output = fetchOutputs(job);
H1437_fy_output{14,1} = job_output{1,1}{1,2}{1};
H1437_fy_output{14,2} = job_output{1,1}{1,1}{2};
H1437_fy_output{14,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

job = findJob(myCluster, 'ID', 494);
job_output = fetchOutputs(job);
H1437_fy_output{15,1} = job_output{1,1}{1,2}{1};
H1437_fy_output{15,2} = job_output{1,1}{1,1}{2};
H1437_fy_output{15,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

writecell(H1437_fy_output,"H1437_fy.csv")