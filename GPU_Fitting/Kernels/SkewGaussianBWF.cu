__global__ void SkewGaussianBWF(const double* binWidth, const double* binCenter, const double* binValues, const int* numBins, const double * BWFParams, double* alphaList)
{
	for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < *numBins; i += blockDim.x * gridDim.x) 
	{

		double xi = BWFParams[1];
	    double omega = BWFParams[2];
	    double alpha = BWFParams[3];
	    double arg = (binCenter[i] - xi) / omega;
	    double smallphi = Gaus(arg, 0.0, 1.0, true);
	    double bigphi = 0.5 * (1 + erf(alpha * arg/sqrt(2)));
	    double BWFVal = ((2./omega) * smallphi * bigphi)+BWFParams[0];

		//Calculate the value of this bin (Integration is achieved by parallel summing later)
		alphaList[i] = binWidth[i]*binValues[i]*BWFVal;
	}
}

