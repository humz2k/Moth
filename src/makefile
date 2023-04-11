build:
	/usr/local/bin/python3 main.py mothTest.moth -o mothTest -keep_temp -ccmpicc -I/opt/homebrew/include/ -L/opt/homebrew/Cellar/fftw/3.3.10_1/lib -lfftw3 -lm

run:
	mpirun -n 8 ./mothTest