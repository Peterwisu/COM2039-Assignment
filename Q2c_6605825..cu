/*
 ============================================================================
 Name        : Q2c.cu
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

__global__ void loop()
{

    printf("This is iteration number %d\n", threadIdx.x);


}

int main()
{
  /*
   * to use the execution configuration to control how many
   * "iterations" to perform.
   *
   * For this question, only use 1 block of threads.
   */

  // Declare Number of threads
  int N = 10;
  // Number of threads is a block since the question specify only use 1 block of thread
  int blockSize = N;
  // Declare number of block since the question specify only use 1 block of thread
  int block_num =1;
  // Call Kernel
  loop<<<block_num,blockSize>>>();
  // Wait for GPU to finish execute
  cudaDeviceSynchronize();
  return 0;
}
