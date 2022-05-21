/*
 ============================================================================
 Name        : Q2b.cu
 Author      : Wish Suharitdamrong
 Version     :
 Copyright   : Your copyright notice
 Description : CUDA compute reciprocals
 ============================================================================
 */
/*************************************
**Question 2b
*************************************/
#include <stdio.h>

__global__ void printSuccessForCorrectExecutionConfiguration()
{

  /**
   *
   * Print 'Success' only when the thread Id is 1023 and block Id is 255
   *
   */
  if(threadIdx.x == 1023 && blockIdx.x == 255)
  {
    printf("Success!\n threadIDx : % d , BlockIdx : %d\n",threadIdx.x,blockIdx.x);

  }

}

int main(void)
{
  /*
   * Update the execution configuration so that the kernel
   * will print `"Success!"`.
   */



	// To print the success from the kernel we need the kernel to run thread id 1023 at the block id 255
	// Declare Number of block to 1024 (0-1023)
	int blockSize =1024;
	// Declare Number of threads in a block (0-255)
	int grid_size = 256;
	// Call Kernel
	printSuccessForCorrectExecutionConfiguration<<<grid_size, blockSize>>>();
	// Wait for GPU to finish execute
	cudaDeviceSynchronize();

	return 0;

}
