build:
	llc -filetype=obj tmp.ll -o tmp.o
	clang tmp.o gc_tools.o -o tmp

gc_tools:
	clang gc_tools.c /Users/humzaqureshi/GitHub/Moth/gc-8.2.2/gc.a -ogc_tools.o -shared