
#include "moth_lib.hpp"

__Mothint Mothmain(){
__MothArray<__Mothint> a(2);
a.init(2,2);
__MothArrayINDEX(a,2,0,0) = 1;
__MothArrayINDEX(a,2,1,1) = 1;
__MothPrint(a);
return 0;

}

int main() {I.real = 0; I.imag = 1; return Mothmain();}
