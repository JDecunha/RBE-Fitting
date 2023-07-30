__global__ void MorstinPenaltyFunction(const double* binWidth, const double* binCenter,  const int* numBins, const double * BWFParams, double* negativeArea, double* totalArea)
{
	for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < *numBins; i += blockDim.x * gridDim.x) 
	{
		double BWFVal = (BWFParams[0]*((1-exp(-binCenter[i]*BWFParams[1]-BWFParams[2]*binCenter[i]*binCenter[i]-BWFParams[3]*binCenter[i]*binCenter[i]*binCenter[i]))/binCenter[i]))+BWFParams[4];

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

