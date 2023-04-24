CC = g++ # set this to environment variable to R compiler
SRC = $(wildcard *.cpp)

all: lib.a clean

lib.a: $(SRC:.cpp=.o)
	ar crs lib.a $(SRC:.cpp=.o)

compile: 
	$(CC) -c $(SRC)

clean:
	rm -f $(SRC:.cpp=.o)