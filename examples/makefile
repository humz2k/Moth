main: hello_world fibonacci arrays lists nbody speed_test plotting

hello_world:
	moth hello_world.moth -o hello_world.o

fibonacci:
	moth fibonacci.moth -o fibonacci.o

arrays:
	moth arrays.moth -o arrays.o

nbody:
	moth nbody_fast.moth -o nbody_fast.o
	moth nbody_slow.moth -o nbody_slow.o
	moth nbody_semi_slow.moth -o nbody_semi_slow.o
	moth nbody_broadcast.moth -o nbody_broadcast.o

speed_test:
	moth speed_test.moth -o speed_test.o

lists:
	moth lists.moth -o lists.o

plotting:
	moth plotting.moth -o plotting.o -ccg++-12 -I/Library/Frameworks/Python.framework/Versions/3.9/include/python3.9 -I/Users/humzaqureshi/GitHub/Moth/moth-libs -L/Library/Frameworks/Python.framework/Versions/3.9/lib -lpython3.9

clean:
	rm *.o