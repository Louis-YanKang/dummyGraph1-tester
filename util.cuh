#ifndef UTIL_CUH_
#define UTIL_CUH_


__device__ int myAtomicAdd(int *address, int incr);

__global__ void kernel(int *sharedInteger);

template<typename T> __device__ T fetch_and_add(T *x, T inc);


//template<typename T>
//__device__ bool compare_and_swap(T &x, const T &old_val, const T &new_val);


#endif
