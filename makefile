build:
	moth test.moth -o test.o -O3

gc_tools:
	clang mothpy/gc_tools.c -o mothpy/gc_tools.o -c

c_tools:
	clang mothpy/c_tools.c -o mothpy/c_tools.o -c

thing:
	/Users/humzaqureshi/GitHub/Moth/bdwgc/libgc.a