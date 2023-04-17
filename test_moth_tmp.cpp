
#include "moth_lib.hpp"

template <class arr_t>
__MothArray<arr_t> Mothzeros(__MothTuple<__Mothint> shape){
__Mothint size;__Mothint i;__MothArray<arr_t> out;
__MothPrint(shape.Mothlen());__MothPrint("\n");
size = 1;
for (i = 0;i < shape.Mothlen();i = i + 1){

size = __MothBaseSTAR(size,__MothTupleINDEX(shape,1,i));

}

__MothPrint(size);__MothPrint("\n");
out = newArray<arr_t>(1,10);
return out;

}
__Mothint Mothmain(){
__MothArray<__Mothint> a;
a = Mothzeros<__Mothint>(newTuple<__Mothint>(1,10));
return 0;

}

int main() {I.real = 0; I.imag = 1; return Mothmain();}
