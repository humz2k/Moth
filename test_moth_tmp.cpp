
#include "moth_lib.hpp"

template <class test,class test2>
__Mothvoid Mothtest(__Mothint a){
test ab;test2 abc;
ab = a;
abc = 100.5;
__MothPrint(ab);
__MothPrint("\n");__MothPrint(abc);

}
__Mothint Mothmain(){
__MothArray<__Mothint> fuckyou;
fuckyou = newArray<__Mothint>(1,10);
Mothtest<__Mothint,__Mothfloat>(5);
return 0;

}

int main() {I.real = 0; I.imag = 1; return Mothmain();}
