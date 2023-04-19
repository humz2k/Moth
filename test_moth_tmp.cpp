#include "/Users/humzaqureshi/GitHub/Moth/bin/moth_lib.hpp"


#include <time.h>

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

__Mothdouble Mothdot(__MothArray<__Mothdouble> a,__MothArray<__Mothdouble> b){
if (__MothBaseNOT_EQUAL(a.shape,b.shape)){
MoththrowErr(convString("Shapes not equal in \\dot\n"));

}

return __MothBaseSTAR(a,b).Mothsum();

}
__Mothfloat __MothmathMothacosf(__Mothfloat inp){
return acosf(inp);

}

__Mothdouble __MothmathMothacos(__Mothdouble inp){
return acos(inp);

}

__Mothfloat __MothmathMothasinf(__Mothfloat inp){
return asinf(inp);

}

__Mothdouble __MothmathMothasin(__Mothdouble inp){
return asin(inp);

}

__Mothfloat __MothmathMothatanf(__Mothfloat inp){
return atanf(inp);

}

__Mothdouble __MothmathMothatan(__Mothdouble inp){
return atan(inp);

}

__Mothfloat __MothmathMothatan2f(__Mothfloat inp1,__Mothfloat inp2){
return atan2f(inp1,inp2);

}

__Mothdouble __MothmathMothatan2(__Mothdouble inp1,__Mothdouble inp2){
return atan2(inp1,inp2);

}

__Mothfloat __MothmathMothcosf(__Mothfloat inp){
return cosf(inp);

}

__Mothdouble __MothmathMothcos(__Mothdouble inp){
return cos(inp);

}

__Mothfloat __MothmathMothcoshf(__Mothfloat inp){
return coshf(inp);

}

__Mothdouble __MothmathMothcosh(__Mothdouble inp){
return cosh(inp);

}

__Mothfloat __MothmathMothsinf(__Mothfloat inp){
return sinf(inp);

}

__Mothdouble __MothmathMothsin(__Mothdouble inp){
return sin(inp);

}

__Mothfloat __MothmathMothsinhf(__Mothfloat inp){
return sinhf(inp);

}

__Mothdouble __MothmathMothsinh(__Mothdouble inp){
return sinh(inp);

}

__Mothfloat __MothmathMothtanhf(__Mothfloat inp){
return tanhf(inp);

}

__Mothdouble __MothmathMothtanh(__Mothdouble inp){
return tanh(inp);

}

__Mothfloat __MothmathMothexpf(__Mothfloat inp){
return expf(inp);

}

__Mothdouble __MothmathMothexp(__Mothdouble inp){
return exp(inp);

}

__Mothfloat __MothmathMothlogf(__Mothfloat inp){
return logf(inp);

}

__Mothdouble __MothmathMothlog(__Mothdouble inp){
return log(inp);

}

__Mothfloat __MothmathMothlog10f(__Mothfloat inp){
return log10f(inp);

}

__Mothdouble __MothmathMothlog10(__Mothdouble inp){
return log10(inp);

}

__Mothfloat __MothmathMothpowf(__Mothfloat inp1,__Mothfloat inp2){
return powf(inp1,inp2);

}

__Mothdouble __MothmathMothpow(__Mothdouble inp1,__Mothdouble inp2){
return pow(inp1,inp2);

}

__Mothfloat __MothmathMothfabsf(__Mothfloat inp){
return fabsf(inp);

}

__Mothdouble __MothmathMothfabs(__Mothdouble inp){
return fabs(inp);

}

__Mothfloat __MothmathMothfmodf(__Mothfloat inp1,__Mothfloat inp2){
return fmodf(inp1,inp2);

}

__Mothdouble __MothmathMothfmod(__Mothdouble inp1,__Mothdouble inp2){
return fmod(inp1,inp2);

}

__Mothfloat __MothmathMothsqrtf(__Mothfloat inp){
return sqrtf(inp);

}

__Mothdouble __MothmathMothsqrt(__Mothdouble inp){
return sqrt(inp);

}

__Mothfloat __MothmathMothceilf(__Mothfloat inp){
return ceilf(inp);

}

__Mothdouble __MothmathMothceil(__Mothdouble inp){
return ceil(inp);

}

__Mothfloat __MothmathMothfloorf(__Mothfloat inp){
return floorf(inp);

}

__Mothdouble __MothmathMothfloor(__Mothdouble inp){
return floor(inp);

}

__Mothlong __MothtimerMothclock(){
return (__Mothlong)(clock());

}

__Mothdouble __MothtimerMothto_seconds(__Mothlong inp){
return __MothBaseSLASH((__Mothdouble)(inp),CLOCKS_PER_SEC);

}

class __MothObjectcomplex_test{
public:
__Mothint real;__Mothint imag;__Mothvoid Moth__init__(){

}

__Mothvoid Moth__print__(){
__MothPrint(real);__MothPrint(convString(" + "));__MothPrint(imag);__MothPrint(convString("i"));

}


};
__Mothint Mothmain(){
__MothArray<__Mothint> a;__MothArray<__Mothint> i;a = __MothnmMotharange(10).Mothreshape(2,5);
for (int i_MOTH_ITER = 0; i_MOTH_ITER < a.dims.get()[0]; i_MOTH_ITER++){
i = __MothGetSlice(a,6,i_MOTH_ITER,i_MOTH_ITER,0,0,a.dims.get()[1],1);
__MothPrint(i);

}

return 0;

}

int main() {I.real = 0; I.imag = 1; return Mothmain();}
