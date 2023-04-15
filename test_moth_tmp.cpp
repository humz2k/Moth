
#include "moth_lib.hpp"

__Mothint Mothmain(){
__Mothstr a;
a = "Hello World!";
a = __MothBasePLUS(a,"1");
__MothBaseINDEX(a,1,0) = 'T';
__MothPrint(a);
return 0;

}

int main() {I.real = 0; I.imag = 1; return Mothmain();}
