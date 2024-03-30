%% Run the AIC calculation script before this

outputMatrix = [H460AIC; H460AIC_LET; H1437AIC; H1437AIC_LET; AGOAIC; AGOAIC_LET; U87AIC; U87AIC_LET];
outputMatrix = transpose(outputMatrix);
outputMatrix = [{'H460 Delta AIC' 'H460-LET Delta AIC' 'H1437 Delta AIC' 'H1437-LET Delta AIC' 'AGO Delta AIC' 'AGO-LET Delta AIC' 'U87 Delta AIC' 'U87-LET Delta AIC'}; num2cell(outputMatrix)];
writecell(outputMatrix ,"AIC_Comparison_Table.csv")