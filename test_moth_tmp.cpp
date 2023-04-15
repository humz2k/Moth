
#include "moth_lib.hpp"

__Mothint Mothmain(){
__MothList<__Mothint> test;__MothList<__Mothint> test2;
test.Mothappend(1);test.Mothappend(2);
test2 = test;
__MothPrint(test);__MothPrint("\n");
test.Mothappend(3);
__MothPrint(test2);__MothPrint("\n");
test2.Mothpop(0);
__MothPrint(test2);__MothPrint("\n");
return 0;

}

int main() {I.real = 0; I.imag = 1; return Mothmain();}
