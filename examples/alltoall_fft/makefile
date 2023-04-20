main:
	moth driver.moth -o driver.o -keep_temp -ccmpic++ -I/opt/homebrew/include/ -L/opt/homebrew/Cellar/fftw/3.3.10_1/lib -lfftw3 -lm -fopenmp -O3 -printCompileLine

leak:
	leaks -atExit -- ./driver.o | grep LEAK:

run:
	mpirun -n 8 ./driver.o

clean:
	rm driver.o