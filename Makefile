CC = nvcc
CXX = nvc++


all: util dummygraph1 bin

util: 
	${CC} -c util.cu

dummygraph1:
	${CXX} -c -I. -mp=gpu -cuda -DUSE_OMP_ACCELERATOR dummyGraph1.cpp

bin:
	${CXX} -mp=gpu -cuda util.o dummyGraph1.o -o tt5

clean:
	rm -f util.o dummyGraph1.o tt5
