main:
	moth test.moth -o test -keep_temp -ccmpic++

leak:
	leaks -atExit -- ./test | grep LEAK:

run:
	mpirun -n 8 ./test

clean:
	rm test