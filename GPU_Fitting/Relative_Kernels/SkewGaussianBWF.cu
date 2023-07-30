__global__ void SkewGaussianBWF(const double* binWidth, const double* binCenter, const double* binValues, const int* numBins, const double * BWFParams, double* alphaList)
{
	for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < *numBins; i += blockDim.x * gridDim.x) 
	{
		//double mag = BWFParams[1];
		double xi = BWFParams[2];
	    double omega = BWFParams[3];
	    double alpha = BWFParams[4];
	    double arg = (binCenter[i] - xi) / omega;

	    //Just the gaussian function
	    double smallphi = BWFParams[1]*exp(-((binCenter[i]-BWFParams[2])*(binCenter[i]-BWFParams[2]))/(BWFParams[3]*BWFParams[3]*2));

	    //This should work because there is a cuda version of erf actually
	    double bigphi = (1 + erf(alpha * arg/sqrt(2.)));

	    //Put it all together
	    double BWFVal = (smallphi * bigphi)+BWFParams[0];

		//Calculate the value of this bin (Integration is achieved by parallel summing later)
		alphaList[i] = binWidth[i]*binValues[i]*BWFVal;
	}
}

