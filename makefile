main:
	moth test.moth -o test -keep_temp -ccg++-12

leak:
	leaks -atExit -- ./test | grep LEAK:

nbody:
	moth nbody_fast.moth -o nbody_fast
	moth nbody_slow.moth -o nbody_slow
	moth nbody_semi_slow.moth -o nbody_semi_slow
	moth nbody_broadcast.moth -o nbody_broadcast

run:
	mpirun -n 8 ./test

clean:
	rm test