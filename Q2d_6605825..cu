/*
 ============================================================================
 Name        : Q2d.cu
 Author      : Wish Suharitdamrong
 Version     :
 Copyright   : Your copyright notice
 Description : CUDA compute reciprocals
 ============================================================================
 */
/*************************************
**Question 2c
*************************************/

#include <stdio.h>

/*
 * Refactor `loop` to be a CUDA Kernel. The new kernel should
 * only do the work of 1 iteration of the original loop.
 */

__global__ void loop(int N)
{
	// calculate the index of the thread
	int tid = threadIdx.x+blockDim.x*blockIdx.x;
	// only print if the index is less than the size of the array N
	if(tid<N){
		printf("This is iteration number %d\n",tid);
	}
}

int main(void)
{
  /*
   * When refactoring `loop` to launch as a kernel, be sure
   * to use the execution configuration to control how many
   * "iterations" to perform.
   *
   * For this question, use at leat 2 blocks of threads.
   */

	// Declare Number of thread in one block
	float N = 10;
	// Decalre Number of thread in block
	int blockSize = 3;
	// Declare Number of block
	int block_num =ceil(N/blockSize);
	// check the number of block size
	printf("%d \n",block_num);
	// Call kernel
	loop<<<block_num,blockSize>>>(N);
	// Wait for GPU to finish execute
	cudaDeviceSynchronize();

	return 0;
}
