%% f(y), Grad Descent vs. Simul Anneal for H460
% 1.) Run RMSE_and_AIC_Calculation_from_Cost.m before this script
% 2.) Run H460_GradDescent_JobSubmitter

H460_fy_GradDescent_RMSE = zeros(size(H460RMSE));
H460_fy_GradDescent_RMSE(1) = linear{1,1}{1,3}(3);
H460_fy_GradDescent_RMSE(2) = quad{1,1}{1,3}(3);
H460_fy_GradDescent_RMSE(3) = cubic{1,1}{1,3}(3);
H460_fy_GradDescent_RMSE(4) = fourth{1,1}{1,3}(3);
H460_fy_GradDescent_RMSE(5) = fifth{1,1}{1,3}(3);
H460_fy_GradDescent_RMSE(6) = Q{1,1}{1,3}(3);
H460_fy_GradDescent_RMSE(7) = QE{1,1}{1,3}(3);
H460_fy_GradDescent_RMSE(8) = QE2{1,1}{1,3}(3);
H460_fy_GradDescent_RMSE(9) = LE{1,1}{1,3}(3);
H460_fy_GradDescent_RMSE(10) = LQE{1,1}{1,3}(3);
H460_fy_GradDescent_RMSE(11) = LE2{1,1}{1,3}(3);
H460_fy_GradDescent_RMSE(12) = LQE2{1,1}{1,3}(3);
H460_fy_GradDescent_RMSE(13) = gaus{1,1}{1,3}(3);
H460_fy_GradDescent_RMSE(14) = skewgaus{1,1}{1,3}(3);
H460_fy_GradDescent_RMSE(15) = morstin{1,1}{1,3}(3);

H460_fy_GradDescent_Cost = zeros(size(H460RMSE));
H460_fy_GradDescent_Cost(1) = linear{1,1}{1,2};
H460_fy_GradDescent_Cost(2) = quad{1,1}{1,2};
H460_fy_GradDescent_Cost(3) = cubic{1,1}{1,2};
H460_fy_GradDescent_Cost(4) = fourth{1,1}{1,2};
H460_fy_GradDescent_Cost(5) = fifth{1,1}{1,2};
H460_fy_GradDescent_Cost(6) = Q{1,1}{1,2};
H460_fy_GradDescent_Cost(7) = QE{1,1}{1,2};
H460_fy_GradDescent_Cost(8) = QE2{1,1}{1,2};
H460_fy_GradDescent_Cost(9) = LE{1,1}{1,2};
H460_fy_GradDescent_Cost(10) = LQE{1,1}{1,2};
H460_fy_GradDescent_Cost(11) = LE2{1,1}{1,2};
H460_fy_GradDescent_Cost(12) = LQE2{1,1}{1,2};
H460_fy_GradDescent_Cost(13) = gaus{1,1}{1,2};
H460_fy_GradDescent_Cost(14) = skewgaus{1,1}{1,2};
H460_fy_GradDescent_Cost(15) = morstin{1,1}{1,2};

%Calc improvement
H460_fy_anneal__RMSE_difference = H460RMSE-H460_fy_GradDescent_RMSE;
H460_fy_anneal__RMSE_difference = H460_fy_anneal__RMSE_difference./H460RMSE;
H460_fy_anneal__RMSE_difference = H460_fy_anneal__RMSE_difference*-100;

H460_fy_anneal__cost_difference = transpose(H460_combined_fy_cost)-H460_fy_GradDescent_Cost;
H460_fy_anneal__cost_difference = H460_fy_anneal__cost_difference./transpose(H460_combined_fy_cost);
H460_fy_anneal__cost_difference = H460_fy_anneal__cost_difference*-100;

%Filter for ones larger than 1000% and for which have no improvement
%H460_fy_anneal_difference = H460_fy_anneal_difference.*(H460_fy_anneal_difference>0);
%idx = H460_Dy_anneal_difference>1000;
%H460_Dy_anneal_difference(idx) = 1000;

% figure('Renderer', 'painters', 'Position', [10 10 750 350])
% b = bar(H460_fy_anneal_difference);
% 
% set(gca, 'YScale', 'log');
% set(gca,'YLim',[1e0 5e3]);
% 
% hxtitle = get(gca,'XLabel');
% hytitle = get(gca,'YLabel');
% htitle = get(gca,'Title');
% set(gca,'TickLabelInterpreter','Latex');
% set(hxtitle,'Interpreter','Latex');
% set(hytitle,'Interpreter','Latex');
% set(htitle,'Interpreter','Latex');
% set(hytitle,'String','Cost Function Improvement [\%]');
% title("H460 d(y), Gradient Descent vs. Simulated Annealing")
% 
% %set(gca,'YTick',[0 250 500 750]);
% set(gca,'YTickLabel',[1 10 100 1000]);
% set(gca,'XTickLabel', {'Linear'; 'Quadratic'; 'Cubic'; 'Fourth';'Fifth';'Q';'QE';'QE2';'LE';'LQE';'LE2';'LQE2';'Gaussian';'Skew Gaussian';'Morstin et al.'});
% 
% b.FaceColor = 'flat';
% b.CData(1,:) = [.4627 0.7255 0];
% b.CData(2,:) = [.4627 0.7255 0];
% b.CData(3,:) = [.4627 0.7255 0];
% b.CData(4,:) = [.4627 0.7255 0];
% b.CData(5,:) = [.4627 0.7255 0];
% b.CData(6,:) = [.4627 0.7255 0];
% b.CData(7,:) = [.4627 0.7255 0];
% b.CData(8,:) = [.4627 0.7255 0];
% b.CData(9,:) = [.4627 0.7255 0];
% b.CData(10,:) = [.4627 0.7255 0];
% b.CData(11,:) = [.4627 0.7255 0];
% b.CData(12,:) = [.4627 0.7255 0];
% b.CData(13,:) = [.4627 0.7255 0];
% b.CData(14,:) = [.4627 0.7255 0];
% b.CData(15,:) = [.4627 0.7255 0];
% set(hytitle,'Fontsize',14); 

%f = gcf;
%exportgraphics(f,'H460DyAnnealingVsDescent.png','Resolution',300, 'BackgroundColor','white')
outputMatrix = [transpose(H460_combined_fy_cost);  H460_fy_GradDescent_Cost; H460RMSE; H460_fy_GradDescent_RMSE; H460_fy_anneal__cost_difference; H460_fy_anneal__RMSE_difference];
outputMatrix = transpose(outputMatrix);
outputMatrix = [{'Annealing Cost' 'Grad Descent Cost' 'Annealing RMSE' 'Grad Descent RMSE' 'Cost Percent Diff' 'RMSE Percent Diff'}; num2cell(outputMatrix)];
writecell(outputMatrix ,"H460_GradvsAnneal_PercentDiff.csv")

%Okay, what do I want to write out in a table?
% 1.) Annealing cost
% 2.) Grad descent cost 
% 3.) Annealing RMSE
% 4.) Grad descent RMSE
% 5.) Cost function percent difference
% 6.) RMSE percent difference

%% f(y), Grad Descent vs. Simul Anneal for H460 (for LET)
% 1.) Run AIC_Calculation before this script
% 2.) Run H460_GradDescent_JobSubmitter

H460_LET_GradDescent_RMSE = zeros(size(H460RMSE_LET));
H460_LET_GradDescent_RMSE(1) = linear{1,1}{1,3}(3);
H460_LET_GradDescent_RMSE(2) = quad{1,1}{1,3}(3);
H460_LET_GradDescent_RMSE(3) = cubic{1,1}{1,3}(3);
H460_LET_GradDescent_RMSE(4) = fourth{1,1}{1,3}(3);
H460_LET_GradDescent_RMSE(5) = fifth{1,1}{1,3}(3);
H460_LET_GradDescent_RMSE(6) = Q{1,1}{1,3}(3);
H460_LET_GradDescent_RMSE(7) = QE{1,1}{1,3}(3);
H460_LET_GradDescent_RMSE(8) = QE2{1,1}{1,3}(3);
H460_LET_GradDescent_RMSE(9) = LE{1,1}{1,3}(3);
H460_LET_GradDescent_RMSE(10) = LQE{1,1}{1,3}(3);
H460_LET_GradDescent_RMSE(11) = LE2{1,1}{1,3}(3);
H460_LET_GradDescent_RMSE(12) = LQE2{1,1}{1,3}(3);
H460_LET_GradDescent_RMSE(13) = gaus{1,1}{1,3}(3);
H460_LET_GradDescent_RMSE(14) = skewgaus{1,1}{1,3}(3);
H460_LET_GradDescent_RMSE(15) = morstin{1,1}{1,3}(3);

H460_LET_GradDescent_Cost = zeros(size(H460RMSE_LET));
H460_LET_GradDescent_Cost(1) = linear{1,1}{1,2};
H460_LET_GradDescent_Cost(2) = quad{1,1}{1,2};
H460_LET_GradDescent_Cost(3) = cubic{1,1}{1,2};
H460_LET_GradDescent_Cost(4) = fourth{1,1}{1,2};
H460_LET_GradDescent_Cost(5) = fifth{1,1}{1,2};
H460_LET_GradDescent_Cost(6) = Q{1,1}{1,2};
H460_LET_GradDescent_Cost(7) = QE{1,1}{1,2};
H460_LET_GradDescent_Cost(8) = QE2{1,1}{1,2};
H460_LET_GradDescent_Cost(9) = LE{1,1}{1,2};
H460_LET_GradDescent_Cost(10) = LQE{1,1}{1,2};
H460_LET_GradDescent_Cost(11) = LE2{1,1}{1,2};
H460_LET_GradDescent_Cost(12) = LQE2{1,1}{1,2};
H460_LET_GradDescent_Cost(13) = gaus{1,1}{1,2};
H460_LET_GradDescent_Cost(14) = skewgaus{1,1}{1,2};
H460_LET_GradDescent_Cost(15) = morstin{1,1}{1,2};

%Calc improvement
H460_LET_anneal__RMSE_difference = H460RMSE_LET-H460_LET_GradDescent_RMSE;
H460_LET_anneal__RMSE_difference = H460_LET_anneal__RMSE_difference./H460RMSE_LET;
H460_LET_anneal__RMSE_difference = H460_LET_anneal__RMSE_difference*-100;

H460_LET_anneal__cost_difference = transpose(H460_combined_LETd_cost)-H460_LET_GradDescent_Cost;
H460_LET_anneal__cost_difference = H460_LET_anneal__cost_difference./transpose(H460_combined_LETd_cost);
H460_LET_anneal__cost_difference = H460_LET_anneal__cost_difference*-100;

%f = gcf;
%exportgraphics(f,'H460DyAnnealingVsDescent.png','Resolution',300, 'BackgroundColor','white')
outputMatrix = [transpose(H460_combined_LETd_cost);  H460_LET_GradDescent_Cost; H460RMSE_LET; H460_LET_GradDescent_RMSE; H460_LET_anneal__cost_difference; H460_LET_anneal__RMSE_difference];
outputMatrix = transpose(outputMatrix);
outputMatrix = [{'Annealing Cost' 'Grad Descent Cost' 'Annealing RMSE' 'Grad Descent RMSE' 'Cost Percent Diff' 'RMSE Percent Diff'}; num2cell(outputMatrix)];
writecell(outputMatrix ,"H460_LET_GradvsAnneal_PercentDiff.csv")

%Okay, what do I want to write out in a table?
% 1.) Annealing cost
% 2.) Grad descent cost 
% 3.) Annealing RMSE
% 4.) Grad descent RMSE
% 5.) Cost function percent difference
% 6.) RMSE percent difference

