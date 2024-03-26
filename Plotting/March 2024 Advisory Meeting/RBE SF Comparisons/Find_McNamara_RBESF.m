function [McnamaraRBE] = Find_McNamara_RBESF(alphaBetaPhoton,LETd, DoseReference)

dose = 1; % Gy
SFPredictionDifference = 1;

while SFPredictionDifference > 0.001
    
    McnamaraRBE = McNamara(dose,alphaBetaPhoton,LETd);
    SFPredictionDifference = (McnamaraRBE*dose)-DoseReference;

    if SFPredictionDifference > 0
        dose = dose/2;
    else
        dose = dose*2;
    end

end

end

