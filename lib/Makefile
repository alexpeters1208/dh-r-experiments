SRC = $(wildcard *.cpp)
CC = `"${R_HOME}/bin/R" CMD config CC`
CFLAGS = `"${R_HOME}/bin/R" CMD config CFLAGS`
CXX17 = `"${R_HOME}/bin/R" CMD config CXX17`
CXX17STD=`"${R_HOME}/bin/R" CMD config CXX17STD`
CXXFLAGS = `"${R_HOME}/bin/R" CMD config CXX17FLAGS`

all: lib.a

lib.a: $(SRC:.cpp=.o)
	ar crs lib.a $(SRC:.cpp=.o)

$(SRC:.cpp=.o): 
	$(CXX) -c -fPIC $(CXXFLAGS) $(SRC)

clean:
	rm -f $(SRC:.cpp=.o) lib.a
