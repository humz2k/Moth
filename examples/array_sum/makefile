main:
	moth fast_sum.moth -o fast_sum_moth.o -O3 --save-temps
	gcc-12 fast_sum.c -o fast_sum_c.o -O3

clean .PHONY:
	rm *.ll
	rm *.o