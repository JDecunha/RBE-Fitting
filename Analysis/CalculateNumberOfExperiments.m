function [nExperiments] = CalculateNumberOfExperiments(filePaths)

experimentsList = [];
%Loop through the files and concatenate
for i = 1:size(filePaths,2)
    experimentsList = cat(3,experimentsList, readmatrix(filePaths(i)));
end

experiments = ExperimentData(experimentsList);

nExperiments = 0.;

%Loop through each d(y) spectrum
for i = 1:size(experiments.SF,3)

    %Loop through each dose and surviving fraction
    for j = 1:experiments.sizeDose(1,1,i)

        nExperiments = nExperiments + 1;

    end

end

end
