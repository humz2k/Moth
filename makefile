build:
	mpimoth test.moth -o test.o -O3 --save-temps --echo

gc_tools:
	gcc-13 mothpy/gc_tools.c -o mothpy/gc_tools.o -c

file_tools:
	gcc-13 mothpy/file_tools.c -o mothpy/file_tools.o -c

c_tools:
	gcc-13 mothpy/c_tools.c -o mothpy/c_tools.o -c

threading_tools:
	gcc-13 mothpy/threading_tools.c -o mothpy/threading_tools.o -c -O3
	