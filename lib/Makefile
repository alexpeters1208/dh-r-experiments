CC = g++ # set this to environment variable to R compiler

all: add_one.so
	echo "Step 3"

add_one.so: add_one.o
	echo "Step two"
	$(CC) -shared -o add_one.so add_one.o

add_one.o: add_one.cpp
	echo "Step one"
	$(CC) -c add_one.cpp
