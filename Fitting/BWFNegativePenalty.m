function [penalty] = BWFNegativePenalty(fittingParams, BWF, experiment, penaltyValue, maxLineal)

    negativeArea = 0.;
    totalArea = 0.;
    penalty = 0.;

    %Loop through the f(y)/d(y) spectrum 
    for i = 1:(size(experiment(:,1),1)-1)

        %Get the center and width of the current lineal energy bin
        binCenter = (1/2)*(experiment(i+1,1)+experiment(i,1));
        binWidth = experiment(i+1,1)-experiment(i,1);
        
        %Check that we are still in the relevant part of the f(y)/d(y) spectrum
        %(We don't need to have penalties at 300 keV/um for example because there is no 
        %measured data there)
        if binCenter > maxLineal
            break
        end
        
        %Evaluate the BWF and compute area
        BWFValue = BWF(fittingParams(1:end-1), binCenter); 
        area = BWFValue*binWidth;
        
        %If area is negative then add to both counters
        if area < 0
            negativeArea = negativeArea - area;
            totalArea = totalArea - area;
        else %if area is positive just add to the total area
            totalArea = totalArea + area;
        end 

    end
    
    fractionOfNegativeArea = negativeArea/totalArea;
    penalty = fractionOfNegativeArea*penaltyValue;

end

