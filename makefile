main:
	moth test.moth -o test -keep_temp -fopenmp -L/opt/homebrew/opt/libomp/lib -I/opt/homebrew/opt/libomp/include -lomp

leak:
	leaks -atExit -- ./test | grep LEAK:

clean:
	rm test