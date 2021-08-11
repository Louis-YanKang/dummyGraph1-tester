CC = nvcc
CXX = nvc++


all: util dummygraph1 bin

util: 
	${CC} -c util.cu

dummygraph1:
	${CXX} -c -mp=gpu -cuda dummyGraph1.cpp

bin:
	${CXX} -mp=gpu -cuda dummyGraph1.o util.o -o tt5

clean:
	rm -f util.o dummyGraph1.o tt5
