

#include "moth_lib.hpp"


template <class arr_t>
__MothArray<arr_t> __MothnmMothzeros(__MothTuple<__Mothint> shape){
__Mothint size;__Mothint i;__MothArray<arr_t> out;
size = 1;
for (i = 0;i < shape.Mothlen();i = i + 1){

size = __MothBaseSTAR(size,__MothTupleINDEX(shape,1,i));

}

out = newArray<arr_t>(1,size);
for (i = 0;i < size;i = i + 1){

__MothArrayINDEX(out,1,i) = 0;

}

return out.Mothreshape(shape);

}

template <class arr_t>
__MothArray<arr_t> __MothnmMothones(__MothTuple<__Mothint> shape){
__Mothint size;__Mothint i;__MothArray<arr_t> out;
size = 1;
for (i = 0;i < shape.Mothlen();i = i + 1){

size = __MothBaseSTAR(size,__MothTupleINDEX(shape,1,i));

}

out = newArray<arr_t>(1,size);
for (i = 0;i < size;i = i + 1){

__MothArrayINDEX(out,1,i) = 1;

}

return out.Mothreshape(shape);

}

__Mothint Mothmain(){
__MothArray<__Mothint> a;__MothArray<__Mothint> b;__MothArray<__Mothint> c;
a = __MothnmMothones<__Mothint>(newTuple<__Mothint>(4,8,1,6,1));
b = __MothBaseSTAR(__MothnmMothones<__Mothint>(newTuple<__Mothint>(3,7,1,5)),2);
__MothPrint(a);
__MothPrint(b);
c = __MothBasePLUS(a,b);
__MothPrint(c.shape);
return 0;

}

int main() {I.real = 0; I.imag = 1; return Mothmain();}
