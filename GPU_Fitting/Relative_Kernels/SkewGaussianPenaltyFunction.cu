__global__ void SkewGaussianPenaltyFunction(const double* binWidth, const double* binCenter,  const int* numBins, const double * BWFParams, double* negativeArea, double* totalArea)
{
	for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < *numBins; i += blockDim.x * gridDim.x) 
	{
		double mag = BWFParams[1];
		double xi = BWFParams[2];
	    double omega = BWFParams[3];
	    double alpha = BWFParams[4];
	    double arg = (binCenter[i] - xi) / omega;

	    //Just the gaussian function
	    double smallphi = BWFParams[1]*exp(-((binCenter[i]-BWFParams[2])*(binCenter[i]-BWFParams[2]))/(BWFParams[3]*BWFParams[3]*2));

	    //This should work because there is a cuda version of erf actually
	    double bigphi = 0.5 * (1 + erf(alpha * arg/sqrt(2.)));

	    //Put it all together
	    double BWFVal = ((2./omega) * smallphi * bigphi)+BWFParams[0];

		double area = binWidth[i]*BWFVal;

		if (area < 0)
		{
			area = -area;
			negativeArea[i] = area;
			totalArea[i] = area;
		}
		else
		{
			negativeArea[i] = 0;
			totalArea[i] = area;
		}
	}
}

