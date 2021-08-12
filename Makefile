CXX = nvc++
CC = nvcc

CXXFLAGS = -mp=gpu -cuda -DUSE_OMP_ACCELERATOR

OBJ = util.o dummyGraph1.o 
TARGET = tt5

all: $(TARGET)

%.o: %.cu
	$(CC) -c -o $@ $^

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $^

$(TARGET):  $(OBJ)
	$(CXX) $(CXXFLAGS) $^ -o $@

clean:
	rm -rf *~ $(OBJ) $(TARGET)
