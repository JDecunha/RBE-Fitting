function [SF] = LQ_Model(alpha, beta, dose)

SF = exp((-alpha*dose)+(-beta*dose*dose));

end

