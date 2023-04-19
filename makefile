main:
	moth test.moth -o test -keep_temp

leak:
	leaks -atExit -- ./test | grep LEAK:

nbody:
	moth nbody_fast.moth -o nbody_fast
	moth nbody_slow.moth -o nbody_slow
	moth nbody_semi_slow.moth -o nbody_semi_slow
	moth nbody_broadcast.moth -o nbody_broadcast

clean:
	rm test