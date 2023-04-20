main:
	moth test.moth -o test -keep_temp -ccg++-12

leak:
	leaks -atExit -- ./test | grep LEAK:

run:
	mpirun -n 8 ./test

clean:
	rm test