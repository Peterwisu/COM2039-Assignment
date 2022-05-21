/*
 ============================================================================
 Name        : Q2a.cu
 Author      : Wish Suharitdamrong
 Version     :
 Copyright   : Your copyright notice
 Description : CUDA compute reciprocals
 ============================================================================
 */

/*************************************
**Question 2a
*************************************/
#include <stdio.h>

/**
 * Function to print Hello from the CPU
 *
 */
void helloCPU(){
    printf("Hello from the CPU.\n");
}
/**
 * Function use a kernel to print Hello from GPU
 *
 */
__global__ void helloGPU()
{
  printf("Hello  from the GPU.\n");
}

int main(void)
{

  // Call  Kernel to print Hello from GPU with 1 block and 1 thread so that it's execute only 1 times.
  helloGPU<<<1,1>>>();
  // Wait for GPU to finish execute
  cudaDeviceSynchronize();
  // print Hello from the CPU
  helloCPU();
  return 0;
}
