build:
	moth test.moth -o test.o -O3 --save-temps

gc_tools:
	clang mothpy/gc_tools.c -o mothpy/gc_tools.o -c

file_tools:
	clang mothpy/file_tools.c -o mothpy/file_tools.o -c

c_tools:
	clang mothpy/c_tools.c -o mothpy/c_tools.o -c
	