main:
	moth driver.moth -o driver -keep_temp -ccmpic++ -I/opt/homebrew/include/ -L/opt/homebrew/Cellar/fftw/3.3.10_1/lib -lfftw3 -lm

leak:
	leaks -atExit -- ./driver | grep LEAK:

run:
	mpirun -n 8 ./driver

clean:
	rm test