CC = nvcc
CXX = nvc++


all: util dummygraph1

util: 
	${CC} -c util.cu

dummygraph1:
	${CXX}  util.o dummygraph1.cpp -o tt5

clean:
	rm util.o tt5




