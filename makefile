build:
	llc -filetype=obj tmp.ll -o tmp.o
	clang tmp.o -o tmp