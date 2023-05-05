main:
	moth test.moth -o test -keep_temp -ccg++-12 -I/Library/Frameworks/Python.framework/Versions/3.9/include/python3.9 -I/Users/humzaqureshi/GitHub/Moth/moth-libs -L/Library/Frameworks/Python.framework/Versions/3.9/lib -lpython3.9

leak:
	leaks -atExit -- ./test | grep LEAK:

run:
	mpirun -n 8 ./test

clean:
	rm test