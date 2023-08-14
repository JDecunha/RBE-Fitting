classdef ExperimentData
    
    properties

        BinWidth
        BinCenter
        BinValue

        LETD
        sizeLETD

        Dose
        sizeDose

        SF
        sizeSF

        maxRelevantBin

        relativeWeighting
        LETWeightingBinSize

    end
    
    methods

        function obj = ExperimentData(rawExperiment)
           
           %Zero initialize the data fields
           obj.BinWidth = zeros(size(rawExperiment(:,1,:)));
           obj.BinCenter = zeros(size(rawExperiment(:,1,:)));
           obj.BinValue = zeros(size(rawExperiment(:,2,:)));
           obj.LETD = zeros(size(rawExperiment(:,3,:)));
           obj.Dose = zeros(size(rawExperiment(:,4,:)));
           obj.SF = zeros(size(rawExperiment(:,5,:)));
           obj.sizeLETD = zeros(size(rawExperiment(1,1,:)));
           obj.sizeDose = zeros(size(rawExperiment(1,1,:)));
           obj.sizeSF = zeros(size(rawExperiment(1,1,:)));

           %Copy over the fields that are unmodified, trim the nans (not the grannies, I mean not a numbers)
           obj.BinValue = rawExperiment(:,2,:);
           obj.LETD = rawExperiment(:,3,:); 
           obj.Dose = rawExperiment(:,4,:); 
           obj.SF = rawExperiment(:,5,:); 

           %Compute sizes
           for i = 1:size(obj.Dose,3)
                obj.sizeDose(:,:,i) = size(obj.Dose(~isnan(obj.Dose(:,:,i))),1);
           end
           for i = 1:size(obj.SF,3)
                obj.sizeSF(:,:,i) = size(obj.SF(~isnan(obj.SF(:,:,i))),1);
           end
           
           %Finally, compute the new bin values
           for i = 1:size(obj.BinWidth,3)
               
               for k = 1:(size(rawExperiment(:,1,i),1)-1)
                    %Pull the relevant values from the d(y) spectrum
                    obj.BinWidth(k,1,i) = rawExperiment(k+1,1,i)-rawExperiment(k,1,i);
                    obj.BinCenter(k,1,i) = (1/2)*(rawExperiment(k+1,1,i)+rawExperiment(k,1,i));
                    obj.BinValue(k,1,i) = rawExperiment(k,2,i);
               end
           end

           %Compute the bin which reaches the maximum relevant value
           for k = 1:(size(rawExperiment(:,1,1),1)-1)
               if ((1/2)*(rawExperiment(k+1,1,i)+rawExperiment(k,1,i))) > 120
                   obj.maxRelevantBin = k-1;
                   break;
               end
           end

           %Put em on the GPU
           obj.BinWidth = gpuArray(obj.BinWidth);
           obj.BinCenter = gpuArray(obj.BinCenter);
           obj.BinValue = gpuArray(obj.BinValue);
           obj.maxRelevantBin = gpuArray(cast(obj.maxRelevantBin,'int32'));

           %Let's find a way to calculate the relative weighting
           obj.LETWeightingBinSize = 5;
           NumBins = ceil(20/obj.LETWeightingBinSize);
           internalWeighting = zeros(NumBins,1);
           obj.relativeWeighting = zeros(1,1,size(obj.LETD,3));

           TotalDataPoints = 0;
           for i = 1:size(obj.LETD,3)
               currentLETBin = ceil(obj.LETD(1,1,i)/obj.LETWeightingBinSize);
               internalWeighting(currentLETBin) = internalWeighting(currentLETBin) + size(obj.Dose(~isnan(obj.Dose(:,:,i))),1);
               TotalDataPoints = TotalDataPoints + size(obj.Dose(~isnan(obj.Dose(:,:,i))),1);
           end
           internalWeighting = internalWeighting/TotalDataPoints;
           for i = 1:size(obj.LETD,3)
               currentLETBin = ceil(obj.LETD(1,1,i)/obj.LETWeightingBinSize);
               obj.relativeWeighting(1,1,i) = internalWeighting(currentLETBin);
           end
           obj.relativeWeighting = 1/obj.relativeWeighting;

           
        end
        
    end
end

