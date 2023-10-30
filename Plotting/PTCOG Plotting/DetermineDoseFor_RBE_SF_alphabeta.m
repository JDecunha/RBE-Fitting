function [DoseSF] = DetermineDoseFor_RBE_SF_alphabeta(alpha, beta, survivingFraction)

DoseSF= (alpha - sqrt((alpha*alpha)-4*-beta*-log(survivingFraction)))/(2*-beta);
 
end

