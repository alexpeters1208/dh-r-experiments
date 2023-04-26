SRC = $(wildcard *.cpp)
CC = clang -arch arm64
CFLAGS = -falign-functions=64 -Wall -g -O2
CXX = clang++ -arch arm64 -std=gnu++14
CXXFLAGS = -falign-functions=64 -Wall -g -O2

all: lib.a

lib.a: $(SRC:.cpp=.o)
	ar crs lib.a $(SRC:.cpp=.o)

compile: 
	$(CXX) -c $(CXXFLAGS) $(SRC)

clean:
	rm -f $(SRC:.cpp=.o) lib.a
