/*
 ============================================================================
 Name        : Q2e.cu
 Author      : Wish Suharitdamrong
 Version     :
 Copyright   : Your copyright notice
 Description : CUDA compute reciprocals
 ============================================================================
 */
/*************************************
**Question 2e
*************************************/
#include <stdio.h>

/**
 *
 * Initialize value in global memory
 *
 */
void init(int *a, int N)
{
  int i;
  for (i = 0; i < N; ++i)
  {
    a[i] = i;
    printf("%d ,%d\n",i,a[i]);


  }
}

/**
 *
 * Kernel function to double a value in each index
 *
 */
__global__ void doubleElements(int *a, int N)
{
  int i;
  // calculate the index of the thread
  i = blockIdx.x * blockDim.x + threadIdx.x;
  // if the index is less than the size of the array
  if (i < N)
  {

	// multiply the value of the array at index i by 2
    a[i] *= 2;
    // print out to check the value assigned in the array
    printf("%d ,%d\n",i,a[i]);



  }
}


/**
 *
 *  Check the value in each index is double value of its index
 *
 */
bool checkElementsAreDoubled(int *a, int N)
{
  int i;
  for (i = 0; i < N; ++i)
  {
	printf("%d ,%d\n",i,a[i]);
    if (a[i] != i*2) return false;
  }
  return true;
}

int main()
{
  //  number of thread
  int N = 100;

  int *a;
  // size of memory
  size_t size = N * sizeof(int);
  // Allocate memory into Unified memory which is accessible for both GPU and CPU
  cudaMallocManaged(&a,size);

  // call init function to initialise a value of array n
  init(a, N);
  // initialise number of blocks and thread for Gridsize and BLocksize
  size_t threads_per_block = 10;
  size_t number_of_blocks = 10;


  // Call Kernel
  doubleElements<<<number_of_blocks, threads_per_block>>>(a, N);
  // wait for gpu to finish execute
  cudaDeviceSynchronize();


  // Call function to check value is double
  bool areDoubled = checkElementsAreDoubled(a, N);
  printf("All elements were doubled? %s\n", areDoubled ? "TRUE" : "FALSE");

  // Free unified memory
  cudaFree(a);

}


