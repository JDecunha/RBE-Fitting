__global__ void LEBWFPenaltyFunction(const double* binWidth, const double* binCenter,  const int* numBins, const double * BWFParams, double* negativeArea, double* totalArea)
{
	for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < *numBins; i += blockDim.x * gridDim.x) 
	{
		double BWFVal = (BWFParams[1]*binCenter[i])+exp(-BWFParams[2]*binCenter[i])+BWFParams[0];

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

