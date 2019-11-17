CC=gcc
AR=ar
OBJECTS_MAIN=main.o
OBJECTS_LIB= power.o basicMath.o
FLAGS= -Wall -g

all: libmyMath.so libmyMath.a mymaths mymathd

mymaths: $(OBJECTS_MAIN) libmyMath.a 
	$(CC) $(FLAGS) -o mymaths $(OBJECTS_MAIN) libmyMath.a
libmyMath.a: $(OBJECTS_LIB)
	$(AR) -rcs libmyMath.a $(OBJECTS_LIB)

mymathd: $(OBJECTS_MAIN) libmyMath.so
	$(CC) $(FLAGS)  -o mymathd $(OBJECTS_MAIN) libmyMath.so	
libmyMath.so: $(OBJECTS_LIB)
	$(CC) -shared  -fPIC -o libmyMath.so $(OBJECTS_LIB)

mains: $(OBJECTS_MAIN) mymaths  
	gcc main.o -L. -lmyMath -o a.out1

maind: $(OBJECTS_MAIN) mymathd
	gcc main.o -L. -lmyMath -o a.out2


main.o: main.c myMath.h 
	$(CC) $(FLAGS) -c main.c
power.o: power.c myMath.h  
	$(CC) $(FLAGS) -c power.c 

basicMath.o: basicMath.c myMath.h  
	$(CC) $(FLAGS) -c basicMath.c  

.PHONY: clean all

clean:
	rm -f *.o *.a *.so progmains progmaind

