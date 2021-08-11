#include <iostream>

#if __CUDA_ARCH__ < 600
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
#endif

__global__ void kernel(int *sharedInteger)
{
    myAtomicAdd(sharedInteger, 1);
}

