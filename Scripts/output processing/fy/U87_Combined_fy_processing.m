%% Create the empty array
H460_fy_output = cell(15,3);
startingJobNum = 360;

%% Pull the data
job = findJob(myCluster, 'ID', startingJobNum);
job_output = fetchOutputs(job);
H460_fy_output{1,1} = job_output{1,1}{1,2}{1};
H460_fy_output{1,2} = job_output{1,1}{1,1}{2};
H460_fy_output{1,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

startingJobNum = startingJobNum + 1;
job = findJob(myCluster, 'ID', startingJobNum);
job_output = fetchOutputs(job);
H460_fy_output{2,1} = job_output{1,1}{1,2}{1};
H460_fy_output{2,2} = job_output{1,1}{1,1}{2};
H460_fy_output{2,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

startingJobNum = startingJobNum + 1;
job = findJob(myCluster, 'ID', startingJobNum);
job_output = fetchOutputs(job);
H460_fy_output{3,1} = job_output{1,1}{1,2}{1};
H460_fy_output{3,2} = job_output{1,1}{1,1}{2};
H460_fy_output{3,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

startingJobNum = startingJobNum + 1;
job = findJob(myCluster, 'ID', startingJobNum);
job_output = fetchOutputs(job);
H460_fy_output{4,1} = job_output{1,1}{1,2}{1};
H460_fy_output{4,2} = job_output{1,1}{1,1}{2};
H460_fy_output{4,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

startingJobNum = startingJobNum + 1;
job = findJob(myCluster, 'ID', startingJobNum);
job_output = fetchOutputs(job);
H460_fy_output{5,1} = job_output{1,1}{1,2}{1};
H460_fy_output{5,2} = job_output{1,1}{1,1}{2};
H460_fy_output{5,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

startingJobNum = startingJobNum + 1;
job = findJob(myCluster, 'ID', startingJobNum);
job_output = fetchOutputs(job);
H460_fy_output{6,1} = job_output{1,1}{1,2}{1};
H460_fy_output{6,2} = job_output{1,1}{1,1}{2};
H460_fy_output{6,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

startingJobNum = startingJobNum + 1;
job = findJob(myCluster, 'ID', startingJobNum);
job_output = fetchOutputs(job);
H460_fy_output{7,1} = job_output{1,1}{1,2}{1};
H460_fy_output{7,2} = job_output{1,1}{1,1}{2};
H460_fy_output{7,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

startingJobNum = startingJobNum + 1;
job = findJob(myCluster, 'ID', startingJobNum);
job_output = fetchOutputs(job);
H460_fy_output{8,1} = job_output{1,1}{1,2}{1};
H460_fy_output{8,2} = job_output{1,1}{1,1}{2};
H460_fy_output{8,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

startingJobNum = startingJobNum + 1;
job = findJob(myCluster, 'ID', startingJobNum);
job_output = fetchOutputs(job);
H460_fy_output{9,1} = job_output{1,1}{1,2}{1};
H460_fy_output{9,2} = job_output{1,1}{1,1}{2};
H460_fy_output{9,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

startingJobNum = startingJobNum + 1;
job = findJob(myCluster, 'ID', startingJobNum);
job_output = fetchOutputs(job);
H460_fy_output{10,1} = job_output{1,1}{1,2}{1};
H460_fy_output{10,2} = job_output{1,1}{1,1}{2};
H460_fy_output{10,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

startingJobNum = startingJobNum + 1;
job = findJob(myCluster, 'ID', startingJobNum);
job_output = fetchOutputs(job);
H460_fy_output{11,1} = job_output{1,1}{1,2}{1};
H460_fy_output{11,2} = job_output{1,1}{1,1}{2};
H460_fy_output{11,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

startingJobNum = startingJobNum + 1;
job = findJob(myCluster, 'ID', startingJobNum);
job_output = fetchOutputs(job);
H460_fy_output{12,1} = job_output{1,1}{1,2}{1};
H460_fy_output{12,2} = job_output{1,1}{1,1}{2};
H460_fy_output{12,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

startingJobNum = startingJobNum + 1;
job = findJob(myCluster, 'ID', startingJobNum);
job_output = fetchOutputs(job);
H460_fy_output{13,1} = job_output{1,1}{1,2}{1};
H460_fy_output{13,2} = job_output{1,1}{1,1}{2};
H460_fy_output{13,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

startingJobNum = startingJobNum + 1;
job = findJob(myCluster, 'ID', startingJobNum);
job_output = fetchOutputs(job);
H460_fy_output{14,1} = job_output{1,1}{1,2}{1};
H460_fy_output{14,2} = job_output{1,1}{1,1}{2};
H460_fy_output{14,3} = job_output{1,1}{1,1}{1};
fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

% startingJobNum = startingJobNum + 1;
% job = findJob(myCluster, 'ID', startingJobNum);
% job_output = fetchOutputs(job);
% H460_fy_output{15,1} = job_output{1,1}{1,2}{1};
% H460_fy_output{15,2} = job_output{1,1}{1,1}{2};
% H460_fy_output{15,3} = job_output{1,1}{1,1}{1};
% fprintf("Name: %s \n", job_output{1, 1}{1,2}{1});
% fprintf("Number of iterations: %d \n\n", job_output{1, 1}{1,1}{4});

writecell(H460_fy_output,"U87_Combined_fy_singlebeta_November12th.csv")