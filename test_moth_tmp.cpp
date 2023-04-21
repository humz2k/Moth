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
class __MothObjectfile{
public:
std::ofstream raw_write;std::ifstream raw_read;__Mothint mode;__Mothstr name;__Mothvoid Moth__init__(__Mothstr filename){
name = filename;
mode = -1;

}

__Mothvoid Mothopen(__Mothstr in_mode){
if (__MothBaseEQUAL(mode,-1)){
if (__MothBaseEQUAL(in_mode,convString("w"))){
mode = 0;
raw_write.open(name);
return ;

}

if (__MothBaseEQUAL(in_mode,convString("r"))){
mode = 1;
raw_read.open(name);
return ;

}

if (__MothBaseEQUAL(in_mode,convString("wb"))){
mode = 0;
raw_write.open(name,std::ios::out | std::ios::binary);
return ;

}

if (__MothBaseEQUAL(in_mode,convString("rb"))){
mode = 1;
raw_read.open(name,std::ios::binary);
return ;

}

MoththrowErr(convString("Invalid file mode\n"));

}

else{
MoththrowErr(convString("File already open\n"));

}


}

__Mothvoid Mothclose(){
if (__MothBaseEQUAL(mode,0)){
mode = -1;
raw_write.close();
return ;

}

if (__MothBaseEQUAL(mode,1)){
mode = -1;
raw_read.close();
return ;

}

MoththrowErr(convString("No file open\n"));

}

__Mothvoid Mothwrite(__Mothstr line){
if (__MothBaseEQUAL(mode,0)){
raw_write << line;

}

else{
MoththrowErr(convString("File not in write mode\n"));

}


}

__Mothvoid Mothwrite(__Mothint line){
if (__MothBaseEQUAL(mode,0)){
raw_write << line;

}

else{
MoththrowErr(convString("File not in write mode\n"));

}


}

__Mothvoid Mothwrite_bytes(__MothArray<__Mothint> arr){
if (__MothBaseEQUAL(mode,0)){
raw_write.write(reinterpret_cast<char*>(arr.Mothtovector().data()),arr.size*sizeof(int));

}

else{
MoththrowErr(convString("File not in write mode\n"));

}


}


};
__Mothint Mothmain(){
__MothObjectfile f;__MothArray<__Mothint> arr;f.Moth__init__(convString("test.bin"));
f.Mothopen(convString("w"));
arr = __MothnmMothones(10);
f.Mothwrite_bytes(arr);
f.Mothclose();
return 0;

}

int main() {I.real = 0; I.imag = 1; return Mothmain();}
