function [RBE] = McNamara(dose_proton,alphaBetaPhoton,LETd)

p0 = 0.99064;
p1 = 0.35605;
p2 = 1.1012;
p3 = -0.0038703;

term1 = alphaBetaPhoton*alphaBetaPhoton;
term2 = 4*dose_proton*alphaBetaPhoton*(p0+((p1/alphaBetaPhoton)*LETd));
term3 = 4*dose_proton*dose_proton*(p2+p3*sqrt(alphaBetaPhoton)*LETd)*(p2+p3*sqrt(alphaBetaPhoton)*LETd);

RBE = (1/(2*dose_proton))*((sqrt(term1+term2+term3))-alphaBetaPhoton);

end

