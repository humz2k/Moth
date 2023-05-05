#include "/Users/humzaqureshi/GitHub/Moth/bin/moth_lib.hpp"


template <class arr_t>
__MothArray<arr_t> __MothnmMothzeros(__MothTuple<__Mothint> shape){
__Mothint size;__Mothint i;__MothArray<arr_t> out;size = 1;
for (i = 0;i < shape.Mothlen();i = i + 1){

size = __MothBaseSTAR(size,__MothTupleINDEX(shape,1,i));

}

out = newArray<arr_t>(1,size);
for (i = 0;i < size;i = i + 1){

__MothArrayINDEX(out,1,i) = 0;

}

return out.Mothreshape(shape);

}

__MothArray<__Mothint> __MothnmMothzeros(__MothTuple<__Mothint> shape){
__Mothint size;__Mothint i;__MothArray<__Mothint> out;size = 1;
for (i = 0;i < shape.Mothlen();i = i + 1){

size = __MothBaseSTAR(size,__MothTupleINDEX(shape,1,i));

}

out = newArray<__Mothint>(1,size);
for (i = 0;i < size;i = i + 1){

__MothArrayINDEX(out,1,i) = 0;

}

return out.Mothreshape(shape);

}

template <class arr_t>
__MothArray<arr_t> __MothnmMothones(__MothTuple<__Mothint> shape){
__Mothint size;__Mothint i;__MothArray<arr_t> out;size = 1;
for (i = 0;i < shape.Mothlen();i = i + 1){

size = __MothBaseSTAR(size,__MothTupleINDEX(shape,1,i));

}

out = newArray<arr_t>(1,size);
for (i = 0;i < size;i = i + 1){

__MothArrayINDEX(out,1,i) = 1;

}

return out.Mothreshape(shape);

}

__MothArray<__Mothint> __MothnmMothones(__MothTuple<__Mothint> shape){
__Mothint size;__Mothint i;__MothArray<__Mothint> out;size = 1;
for (i = 0;i < shape.Mothlen();i = i + 1){

size = __MothBaseSTAR(size,__MothTupleINDEX(shape,1,i));

}

out = newArray<__Mothint>(1,size);
for (i = 0;i < size;i = i + 1){

__MothArrayINDEX(out,1,i) = 1;

}

return out.Mothreshape(shape);

}

template <class arr_t>
__MothArray<arr_t> __MothnmMotharange(__Mothint start,__Mothint stop,__Mothint step){
__Mothint size;__MothArray<arr_t> out;__Mothint i;size = __MothBaseSLASH(__MothBaseMINUS(stop,start),step);
out = newArray<arr_t>(1,size);
for (i = 0;i < size;i = i + 1){

__MothArrayINDEX(out,1,i) = __MothBasePLUS(__MothBaseSTAR(i,step),start);

}

return out;

}

__MothArray<__Mothint> __MothnmMotharange(__Mothint start,__Mothint stop,__Mothint step){
__Mothint size;__MothArray<__Mothint> out;__Mothint i;size = __MothBaseSLASH(__MothBaseMINUS(stop,start),step);
out = newArray<__Mothint>(1,size);
for (i = 0;i < size;i = i + 1){

__MothArrayINDEX(out,1,i) = __MothBasePLUS(__MothBaseSTAR(i,step),start);

}

return out;

}

template <class arr_t>
__MothArray<arr_t> __MothnmMotharange(__Mothint start,__Mothint stop){
__Mothint step;__Mothint size;__MothArray<arr_t> out;__Mothint i;step = 1;
size = __MothBaseSLASH(__MothBaseMINUS(stop,start),step);
out = newArray<arr_t>(1,size);
for (i = 0;i < size;i = i + 1){

__MothArrayINDEX(out,1,i) = __MothBasePLUS(__MothBaseSTAR(i,step),start);

}

return out;

}

__MothArray<__Mothint> __MothnmMotharange(__Mothint start,__Mothint stop){
__Mothint step;__Mothint size;__MothArray<__Mothint> out;__Mothint i;step = 1;
size = __MothBaseSLASH(__MothBaseMINUS(stop,start),step);
out = newArray<__Mothint>(1,size);
for (i = 0;i < size;i = i + 1){

__MothArrayINDEX(out,1,i) = __MothBasePLUS(__MothBaseSTAR(i,step),start);

}

return out;

}

template <class arr_t>
__MothArray<arr_t> __MothnmMotharange(__Mothint stop){
__Mothint step;__Mothint start;__Mothint size;__MothArray<arr_t> out;__Mothint i;step = 1;
start = 0;
size = __MothBaseSLASH(__MothBaseMINUS(stop,start),step);
out = newArray<arr_t>(1,size);
for (i = 0;i < size;i = i + 1){

__MothArrayINDEX(out,1,i) = __MothBasePLUS(__MothBaseSTAR(i,step),start);

}

return out;

}

__MothArray<__Mothint> __MothnmMotharange(__Mothint stop){
__Mothint step;__Mothint start;__Mothint size;__MothArray<__Mothint> out;__Mothint i;step = 1;
start = 0;
size = __MothBaseSLASH(__MothBaseMINUS(stop,start),step);
out = newArray<__Mothint>(1,size);
for (i = 0;i < size;i = i + 1){

__MothArrayINDEX(out,1,i) = __MothBasePLUS(__MothBaseSTAR(i,step),start);

}

return out;

}

template <class arr_t>
__MothArray<arr_t> __MothnmMothlinspace(__Mothdouble start,__Mothdouble stop,__Mothint num){
__MothArray<arr_t> out;__Mothdouble scale;__Mothint i;out = newArray<arr_t>(1,num);
scale = __MothBaseSLASH(__MothBaseMINUS(stop,start),(__Mothdouble)(__MothBaseMINUS(num,1)));
for (i = 0;i < num;i = i + 1){

__MothArrayINDEX(out,1,i) = __MothBasePLUS(__MothBaseSTAR(i,scale),start);

}

return out;

}

__MothArray<__Mothdouble> __MothnmMothlinspace(__Mothdouble start,__Mothdouble stop,__Mothint num){
__MothArray<__Mothdouble> out;__Mothdouble scale;__Mothint i;out = newArray<__Mothdouble>(1,num);
scale = __MothBaseSLASH(__MothBaseMINUS(stop,start),(__Mothdouble)(__MothBaseMINUS(num,1)));
for (i = 0;i < num;i = i + 1){

__MothArrayINDEX(out,1,i) = __MothBasePLUS(__MothBaseSTAR(i,scale),start);

}

return out;

}

template <class arr_t>
__MothArray<arr_t> __MothnmMothlinspace(__Mothdouble start,__Mothdouble stop){
__Mothint num;__MothArray<arr_t> out;__Mothdouble scale;__Mothint i;num = 50;
out = newArray<arr_t>(1,num);
scale = __MothBaseSLASH(__MothBaseMINUS(stop,start),(__Mothdouble)(__MothBaseMINUS(num,1)));
for (i = 0;i < num;i = i + 1){

__MothArrayINDEX(out,1,i) = __MothBasePLUS(__MothBaseSTAR(i,scale),start);

}

return out;

}

__MothArray<__Mothdouble> __MothnmMothlinspace(__Mothdouble start,__Mothdouble stop){
__Mothint num;__MothArray<__Mothdouble> out;__Mothdouble scale;__Mothint i;num = 50;
out = newArray<__Mothdouble>(1,num);
scale = __MothBaseSLASH(__MothBaseMINUS(stop,start),(__Mothdouble)(__MothBaseMINUS(num,1)));
for (i = 0;i < num;i = i + 1){

__MothArrayINDEX(out,1,i) = __MothBasePLUS(__MothBaseSTAR(i,scale),start);

}

return out;

}

__Mothdouble __MothnmMothmax(__MothArray<__Mothdouble> arr){
__Mothint start;__Mothint i;start = __MothArrayINDEX(arr,1,0);
for (i = 0;i < __MothTupleINDEX(arr.shape,1,0);i = i + 1){

if (__MothBaseGREATER(__MothArrayINDEX(arr,1,i),start)){
start = __MothArrayINDEX(arr,1,i);

}


}

return start;

}

__Mothdouble __MothnmMothmin(__MothArray<__Mothdouble> arr){
__Mothint start;__Mothint i;start = __MothArrayINDEX(arr,1,0);
for (i = 0;i < __MothTupleINDEX(arr.shape,1,0);i = i + 1){

if (__MothBaseLESS(__MothArrayINDEX(arr,1,i),start)){
start = __MothArrayINDEX(arr,1,i);

}


}

return start;

}

__Mothdouble Mothdot(__MothArray<__Mothdouble> a,__MothArray<__Mothdouble> b){
if (__MothBaseNOT_EQUAL(a.shape,b.shape)){
MoththrowErr(convString("Shapes not equal in \\dot\n"));

}

return __MothBaseSTAR(a,b).Mothsum();

}
__Mothint Mothmain(){
__MothArray<__Mothfloat> ys;__MothArray<__Mothfloat> xs;__MothListContainer<__Mothstr> a;ys = __MothnmMotharange(10);
xs = __MothnmMotharange(10);
a.Mothreset();a.Mothappend(convString("Hello"));a.Mothappend(convString("TWO"));a.Mothappend(convString("three"));
a.Mothappend(convString("HELLO2"));
__MothPrint(__MothGetSlice(a,3,0,a.Mothlen(),-1));
return 0;

}

int main() {I.real = 0; I.imag = 1; return Mothmain();}
