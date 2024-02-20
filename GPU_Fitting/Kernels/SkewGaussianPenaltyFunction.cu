__global__ void SkewGaussianPenaltyFunction(const double* binWidth, const double* binCenter,  const int* numBins, const double * BWFParams, double* negativeArea, double* totalArea)
{
	for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < *numBins; i += blockDim.x * gridDim.x) 
	{
		double mag = BWFParams[0];
		double xi = BWFParams[1];
	    double omega = BWFParams[2];
	    double alpha = BWFParams[3];
	    double arg = (binCenter[i] - xi) / omega;

	    //Just the gaussian function
	    double smallphi = BWFParams[0]*exp(-((binCenter[i]-BWFParams[1])*(binCenter[i]-BWFParams[1]))/(BWFParams[2]*BWFParams[2]*2));

	    //This should work because there is a cuda version of erf actually
	    double bigphi = (1 + erf(alpha * arg/sqrt(2.)));

	    //Put it all together
	    double BWFVal = (smallphi * bigphi);

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

