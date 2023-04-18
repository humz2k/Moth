main:
	moth test.moth -o test -keep_temp

leak:
	leaks -atExit -- ./test | grep LEAK:

clean:
	rm test