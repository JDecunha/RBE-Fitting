%% f(y), Grad Descent vs. Simul Anneal for AGO
% 1.) Run AIC_Calculation before this script
% 2.) Run AGO_GradDescent_JobSubmitter

AGO_fy_GradDescent_RMSE = zeros(size(AGORMSE));
AGO_fy_GradDescent_RMSE(1) = linear{1,1}{1,3}(3);
AGO_fy_GradDescent_RMSE(2) = quad{1,1}{1,3}(3);
AGO_fy_GradDescent_RMSE(3) = cubic{1,1}{1,3}(3);
AGO_fy_GradDescent_RMSE(4) = fourth{1,1}{1,3}(3);
AGO_fy_GradDescent_RMSE(5) = fifth{1,1}{1,3}(3);
AGO_fy_GradDescent_RMSE(6) = Q{1,1}{1,3}(3);
AGO_fy_GradDescent_RMSE(7) = QE{1,1}{1,3}(3);
AGO_fy_GradDescent_RMSE(8) = QE2{1,1}{1,3}(3);
AGO_fy_GradDescent_RMSE(9) = LE{1,1}{1,3}(3);
AGO_fy_GradDescent_RMSE(10) = LQE{1,1}{1,3}(3);
AGO_fy_GradDescent_RMSE(11) = LE2{1,1}{1,3}(3);
AGO_fy_GradDescent_RMSE(12) = LQE2{1,1}{1,3}(3);
AGO_fy_GradDescent_RMSE(13) = gaus{1,1}{1,3}(3);
AGO_fy_GradDescent_RMSE(14) = skewgaus{1,1}{1,3}(3);
AGO_fy_GradDescent_RMSE(15) = morstin{1,1}{1,3}(3);

AGO_fy_GradDescent_Cost = zeros(size(AGORMSE));
AGO_fy_GradDescent_Cost(1) = linear{1,1}{1,2};
AGO_fy_GradDescent_Cost(2) = quad{1,1}{1,2};
AGO_fy_GradDescent_Cost(3) = cubic{1,1}{1,2};
AGO_fy_GradDescent_Cost(4) = fourth{1,1}{1,2};
AGO_fy_GradDescent_Cost(5) = fifth{1,1}{1,2};
AGO_fy_GradDescent_Cost(6) = Q{1,1}{1,2};
AGO_fy_GradDescent_Cost(7) = QE{1,1}{1,2};
AGO_fy_GradDescent_Cost(8) = QE2{1,1}{1,2};
AGO_fy_GradDescent_Cost(9) = LE{1,1}{1,2};
AGO_fy_GradDescent_Cost(10) = LQE{1,1}{1,2};
AGO_fy_GradDescent_Cost(11) = LE2{1,1}{1,2};
AGO_fy_GradDescent_Cost(12) = LQE2{1,1}{1,2};
AGO_fy_GradDescent_Cost(13) = gaus{1,1}{1,2};
AGO_fy_GradDescent_Cost(14) = skewgaus{1,1}{1,2};
AGO_fy_GradDescent_Cost(15) = morstin{1,1}{1,2};

%Calc improvement
AGO_fy_anneal__RMSE_difference = AGORMSE-AGO_fy_GradDescent_RMSE;
AGO_fy_anneal__RMSE_difference = AGO_fy_anneal__RMSE_difference./AGORMSE;
AGO_fy_anneal__RMSE_difference = AGO_fy_anneal__RMSE_difference*-100;

AGO_fy_anneal__cost_difference = transpose(AGO_combined_fy_cost)-AGO_fy_GradDescent_Cost;
AGO_fy_anneal__cost_difference = AGO_fy_anneal__cost_difference./AGORMSE;
AGO_fy_anneal__cost_difference = AGO_fy_anneal__cost_difference*-100;

outputMatrix = [transpose(AGO_combined_fy_cost);  AGO_fy_GradDescent_Cost; AGORMSE; AGO_fy_GradDescent_RMSE; AGO_fy_anneal__cost_difference; AGO_fy_anneal__RMSE_difference];
outputMatrix = transpose(outputMatrix);
outputMatrix = [{'Annealing Cost' 'Grad Descent Cost' 'Annealing RMSE' 'Grad Descent RMSE' 'Cost Percent Diff' 'RMSE Percent Diff'}; num2cell(outputMatrix)];
writecell(outputMatrix ,"AGO_GradvsAnneal_PercentDiff.csv");

%Okay, what do I want to write out in a table?
% 1.) Annealing cost
% 2.) Grad descent cost 
% 3.) Annealing RMSE
% 4.) Grad descent RMSE
% 5.) Cost function percent difference
% 6.) RMSE percent difference

%% f(y), Grad Descent vs. Simul Anneal for AGO (for LET)
% 1.) Run AIC_Calculation before this script
% 2.) Run AGO_GradDescent_JobSubmitter

AGO_LET_GradDescent_RMSE = zeros(size(AGORMSE_LET));
AGO_LET_GradDescent_RMSE(1) = linear{1,1}{1,3}(3);
AGO_LET_GradDescent_RMSE(2) = quad{1,1}{1,3}(3);
AGO_LET_GradDescent_RMSE(3) = cubic{1,1}{1,3}(3);
AGO_LET_GradDescent_RMSE(4) = fourth{1,1}{1,3}(3);
AGO_LET_GradDescent_RMSE(5) = fifth{1,1}{1,3}(3);
AGO_LET_GradDescent_RMSE(6) = Q{1,1}{1,3}(3);
AGO_LET_GradDescent_RMSE(7) = QE{1,1}{1,3}(3);
AGO_LET_GradDescent_RMSE(8) = QE2{1,1}{1,3}(3);
AGO_LET_GradDescent_RMSE(9) = LE{1,1}{1,3}(3);
AGO_LET_GradDescent_RMSE(10) = LQE{1,1}{1,3}(3);
AGO_LET_GradDescent_RMSE(11) = LE2{1,1}{1,3}(3);
AGO_LET_GradDescent_RMSE(12) = LQE2{1,1}{1,3}(3);
AGO_LET_GradDescent_RMSE(13) = gaus{1,1}{1,3}(3);
AGO_LET_GradDescent_RMSE(14) = skewgaus{1,1}{1,3}(3);
AGO_LET_GradDescent_RMSE(15) = morstin{1,1}{1,3}(3);

AGO_LET_GradDescent_Cost = zeros(size(AGORMSE_LET));
AGO_LET_GradDescent_Cost(1) = linear{1,1}{1,2};
AGO_LET_GradDescent_Cost(2) = quad{1,1}{1,2};
AGO_LET_GradDescent_Cost(3) = cubic{1,1}{1,2};
AGO_LET_GradDescent_Cost(4) = fourth{1,1}{1,2};
AGO_LET_GradDescent_Cost(5) = fifth{1,1}{1,2};
AGO_LET_GradDescent_Cost(6) = Q{1,1}{1,2};
AGO_LET_GradDescent_Cost(7) = QE{1,1}{1,2};
AGO_LET_GradDescent_Cost(8) = QE2{1,1}{1,2};
AGO_LET_GradDescent_Cost(9) = LE{1,1}{1,2};
AGO_LET_GradDescent_Cost(10) = LQE{1,1}{1,2};
AGO_LET_GradDescent_Cost(11) = LE2{1,1}{1,2};
AGO_LET_GradDescent_Cost(12) = LQE2{1,1}{1,2};
AGO_LET_GradDescent_Cost(13) = gaus{1,1}{1,2};
AGO_LET_GradDescent_Cost(14) = skewgaus{1,1}{1,2};
AGO_LET_GradDescent_Cost(15) = morstin{1,1}{1,2};

%Calc improvement
AGO_LET_anneal__RMSE_difference = AGORMSE-AGO_LET_GradDescent_RMSE;
AGO_LET_anneal__RMSE_difference = AGO_LET_anneal__RMSE_difference./AGORMSE;
AGO_LET_anneal__RMSE_difference = AGO_LET_anneal__RMSE_difference*-100;

AGO_LET_anneal__cost_difference = transpose(AGO_combined_fy_cost)-AGO_LET_GradDescent_Cost;
AGO_LET_anneal__cost_difference = AGO_LET_anneal__cost_difference./AGORMSE;
AGO_LET_anneal__cost_difference = AGO_LET_anneal__cost_difference*-100;

%f = gcf;
%exportgraphics(f,'AGODyAnnealingVsDescent.png','Resolution',300, 'BackgroundColor','white')
outputMatrix = [transpose(AGO_combined_fy_cost);  AGO_LET_GradDescent_Cost; AGORMSE; AGO_LET_GradDescent_RMSE; AGO_LET_anneal__cost_difference; AGO_LET_anneal__RMSE_difference];
outputMatrix = transpose(outputMatrix);
outputMatrix = [{'Annealing Cost' 'Grad Descent Cost' 'Annealing RMSE' 'Grad Descent RMSE' 'Cost Percent Diff' 'RMSE Percent Diff'}; num2cell(outputMatrix)];
writecell(outputMatrix ,"AGO_LET_GradvsAnneal_PercentDiff.csv")

%Okay, what do I want to write out in a table?
% 1.) Annealing cost
% 2.) Grad descent cost 
% 3.) Annealing RMSE
% 4.) Grad descent RMSE
% 5.) Cost function percent difference
% 6.) RMSE percent difference


