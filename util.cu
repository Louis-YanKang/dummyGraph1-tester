#include <iostream>

#if !defined(__CUDA_ARCH__) || __CUDA_ARCH__ >= 600


__device__ int myAtomicAdd(int *address, int incr)
{
    // Create an initial guess for the value stored at *address.
    int guess = *address;
    int oldValue = atomicCAS(address, guess, guess + incr);

    // Loop while the guess is incorrect.
    while (oldValue != guess)
    {
        guess = oldValue;
        oldValue = atomicCAS(address, guess, guess + incr);
    }

    return oldValue;
}

template<typename T>
__device__ T fetch_and_add(T *x, T inc) {
    T orig_val = myAtomicAdd(x,inc);
    return orig_val;
}

__global__ void kernel(int *sharedInteger)
{
    myAtomicAdd(sharedInteger, 1);
}

//template __device__ int fetch_and_add<int>(int*, int);

#endif
