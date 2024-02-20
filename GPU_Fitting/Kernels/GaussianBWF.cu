__global__ void GaussianBWF(const double* binWidth, const double* binCenter, const double* binValues, const int* numBins, const double * BWFParams, double* alphaList)
{
	for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < *numBins; i += blockDim.x * gridDim.x) 
	{

		double BWFVal = BWFParams[0]*exp(-((binCenter[i]-BWFParams[1])*(binCenter[i]-BWFParams[1]))/(BWFParams[2]*BWFParams[2]*2));

		//Calculate the value of this bin (Integration is achieved by parallel summing later)
		alphaList[i] = binWidth[i]*binValues[i]*BWFVal;
	}
}

