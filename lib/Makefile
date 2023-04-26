SRC = $(wildcard *.cpp)
CC = `"${R_HOME}/bin/R" CMD config CC`
CFLAGS = `"${R_HOME}/bin/R" CMD config CFLAGS`
CXX = `"${R_HOME}/bin/R" CMD config CXX`
CXXFLAGS = `"${R_HOME}/bin/R" CMD config CXXFLAGS`

all: lib.a

lib.a: $(SRC:.cpp=.o)
	ar crs lib.a $(SRC:.cpp=.o)

compile: 
	$(CXX) -c $(CXXFLAGS) $(SRC)

clean:
	rm -f $(SRC:.cpp=.o) lib.a
