%% H460
filePaths = ["H460_dy/a.csv", "H460_dy/b.csv" , "H460_dy/c.csv", "H460_dy/d.csv", "H460_dy/e.csv", "H460_dy/f.csv", "H460_dy/g.csv", "H460_dy/h.csv", "H460_dy/i.csv", "H460_dy/j.csv" , "H460_dy/k.csv" , "H460_dy/l.csv"];
H460_Direct = RunScript_Direct_Alpha_Beta('H460_Direct', filePaths);
DirectAlphaBetaPlotter(H460_Direct{1,1}{1,1}, filePaths);
sgtitle("H460");
f = gcf;
exportgraphics(f,'H460_AlphaBeta.png','Resolution',600)

%% H1437
filePaths = ["H1437_dy/a.csv", "H1437_dy/b.csv" , "H1437_dy/c.csv", "H1437_dy/d.csv", "H1437_dy/e.csv", "H1437_dy/f.csv", "H1437_dy/g.csv", "H1437_dy/h.csv", "H1437_dy/i.csv", "H1437_dy/j.csv" , "H1437_dy/k.csv" , "H1437_dy/l.csv"];
H1437_Direct = RunScript_Direct_Alpha_Beta('H1437_Direct', filePaths);
DirectAlphaBetaPlotter(H460_Direct{1,1}{1,1}, filePaths);
sgtitle("H1437");
f = gcf;
exportgraphics(f,'H1437_AlphaBeta.png','Resolution',600)

%% U87 Pristine
filePaths = ["U87_pristine_dy/1.1.csv","U87_pristine_dy/3.9.csv","U87_pristine_dy/6.7.csv","U87_pristine_dy/11.6.csv","U87_pristine_dy/17.7.csv","U87_pristine_dy/22.5.csv"];
U87_Pristine_Direct = RunScript_Direct_Alpha_Beta('U87_Pristine_Direct', filePaths);
DirectAlphaBetaPlotter(U87_Pristine_Direct{1,1}{1,1}, filePaths);
sgtitle("U87 Pristine");
f = gcf;
exportgraphics(f,'U87_Pristine_AlphaBeta.png','Resolution',600)

%% U87 SOBP
filePaths = ["U87_sobp_dy/1.27.csv","U87_sobp_dy/3.csv","U87_sobp_dy/4.4.csv","U87_sobp_dy/13.7.csv","U87_sobp_dy/20.9.csv","U87_sobp_dy/25.4.csv"];
U87_SOBP_Direct = RunScript_Direct_Alpha_Beta('U87_SOBP_Direct', filePaths);
DirectAlphaBetaPlotter(U87_SOBP_Direct{1,1}{1,1}, filePaths);
sgtitle("U87 SOBP");
f = gcf;
exportgraphics(f,'U87_SOBP_AlphaBeta.png','Resolution',600)

%% AGO Pristine
filePaths = ["AGO_pristine_dy/1.1.csv","AGO_pristine_dy/3.9.csv","AGO_pristine_dy/6.7.csv","AGO_pristine_dy/11.6.csv","AGO_pristine_dy/17.7.csv","AGO_pristine_dy/22.5.csv"];
AGO_Pristine_Direct = RunScript_Direct_Alpha_Beta('AGO_Pristine_Direct', filePaths);
DirectAlphaBetaPlotter(AGO_Pristine_Direct{1,1}{1,1}, filePaths);
sgtitle("AGO Pristine");
f = gcf;
exportgraphics(f,'AGO_Pristine_AlphaBeta.png','Resolution',600)

%% AGO SOBP
filePaths = ["AGO_SOBP_dy/1.27.csv","AGO_SOBP_dy/3.csv","AGO_SOBP_dy/4.4.csv","AGO_SOBP_dy/13.7.csv","AGO_SOBP_dy/20.9.csv","AGO_SOBP_dy/25.4.csv"];
AGO_SOBP_Direct = RunScript_Direct_Alpha_Beta('AGO_SOBP_Direct', filePaths);
DirectAlphaBetaPlotter(AGO_SOBP_Direct{1,1}{1,1}, filePaths);
sgtitle("AGO SOBP");
f = gcf;
exportgraphics(f,'AGO_SOBP_AlphaBeta.png','Resolution',600)