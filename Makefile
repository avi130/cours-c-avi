CC=gcc
AR=ar
OBJECTS_MAIN=main.o
OBJECTS_LIB= power.o basicMath.o
FLAGS= -Wall -g

all: mymathd mymaths mains maind	

mymathd: $(OBJECTS_LIB)
	$(CC) -shared -fPIC -o libmyMath.so $(OBJECTS_LIB)
mymaths: $(OBJECTS_LIB)
	$(AR) -rcs libmyMath.a $(OBJECTS_LIB)	

mains: $(OBJECTS_MAIN) libmyMath.a 
	$(CC) $(FLAGS) -o mains $(OBJECTS_MAIN) libmyMath.a
maind: $(OBJECTS_MAIN) libmyMath.so
	$(CC) $(FLAGS) -o maind $(OBJECTS_MAIN) ./libmyMath.so

basicMath.o: basicMath.c myMath.h 
	$(CC) $(FLAGS)  -c basicMath.c
power.o: power.c myMath.h 
	$(CC) $(FLAGS)  -c power.c
main.o: main.c myMath.h   
	$(CC) $(FLAGS)  -c main.c 

.PHONY: clean all

clean:
	rm -f *.o *.a *.so mains maind 