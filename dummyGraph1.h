#ifndef UTIL_H_
#define UTIL_H_


__device__ int myAtomicAdd(int *address, int incr);

__global__ void kernel(int *sharedInteger);



#endif
