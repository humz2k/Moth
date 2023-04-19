#include "/Users/humzaqureshi/GitHub/Moth/bin/moth_lib.hpp"


#include <time.h>
#include <mpi.h>

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

class __MothObjectmpi_datatype{
public:
MPI_Datatype raw_type;__Mothvoid Mothset(MPI_Datatype input){
raw_type = input;

}


};
class __MothObjectmpi_comm{
public:
MPI_Comm raw_comm;__Mothvoid Moth__init__(MPI_Comm w_comm){
raw_comm = w_comm;

}


};
__Mothvoid __MothmpiMothinit(__MothArray<__Mothint> argc,__MothArray<__Mothchar> argv){
MPI_Init(NULL,NULL);

}

__Mothvoid __MothmpiMothinit(){
MPI_Init(NULL,NULL);

}

__MothObjectmpi_comm __MothmpiMothget_comm_world(){
__MothObjectmpi_comm out;out.Moth__init__(MPI_COMM_WORLD);
return out;

}

__Mothint __MothmpiMothcomm_size(__MothObjectmpi_comm w_comm){
__Mothint world_size;world_size = 0;
MPI_Comm_size(w_comm.raw_comm,&world_size);
return world_size;

}

__Mothint __MothmpiMothcomm_rank(__MothObjectmpi_comm w_comm){
__Mothint world_rank;world_rank = 0;
MPI_Comm_rank(w_comm.raw_comm,&world_rank);
return world_rank;

}

__MothArray<__Mothint> __MothmpiMothdims_create(__Mothint world_size,__Mothint ndims){
__MothArray<__Mothint> dims;dims = newArray<__Mothint>(1,ndims);
dims.Mothzero();
MPI_Dims_create(world_size,ndims,dims.raw.get());
return dims;

}

__MothObjectmpi_datatype __MothmpiMothtype_contiguous(__Mothint size){
__MothObjectmpi_datatype mpitype;MPI_Type_contiguous(size,MPI_BYTE,&mpitype.raw_type);
MPI_Type_commit(&mpitype.raw_type);
return mpitype;

}

__Mothvoid __MothmpiMothtype_commit(__MothObjectmpi_datatype mpitype){
MPI_Type_commit(&mpitype.raw_type);

}

__Mothvoid __MothmpiMothtype_free(__MothObjectmpi_datatype mpitype){
MPI_Type_free(&mpitype.raw_type);

}

__Mothvoid __MothmpiMothbarrier(__MothObjectmpi_comm w_comm){
MPI_Barrier(w_comm.raw_comm);

}

__Mothvoid __MothmpiMothalltoall(__MothArray<__Mothdouble> input,__Mothint nsends1,__MothObjectmpi_datatype type1,__MothArray<__Mothdouble> output,__Mothint nsends2,__MothObjectmpi_datatype type2,__MothObjectmpi_comm w_comm){
MPI_Alltoall(input.raw.get(),nsends1,type1.raw_type,output.raw.get(),nsends2,type2.raw_type,w_comm.raw_comm);

}

__Mothvoid __MothmpiMothalltoall(__MothArray<__Mothint> input,__Mothint nsends1,__MothObjectmpi_datatype type1,__MothArray<__Mothint> output,__Mothint nsends2,__MothObjectmpi_datatype type2,__MothObjectmpi_comm w_comm){
MPI_Alltoall(input.raw.get(),nsends1,type1.raw_type,output.raw.get(),nsends2,type2.raw_type,w_comm.raw_comm);

}

__Mothvoid __MothmpiMothfinalize(){
MPI_Finalize();

}

__Mothint Mothmain(){
__MothObjectmpi_comm comm;__Mothint world_size;__Mothint world_rank;__MothArray<__Mothint> dims;__MothObjectmpi_datatype fft_t;__MothArray<__Mothdouble> buff1;__MothArray<__Mothdouble> buff2;__Mothint nsends;__MothmpiMothinit();
comm = __MothmpiMothget_comm_world();
world_size = __MothmpiMothcomm_size(comm);
world_rank = __MothmpiMothcomm_rank(comm);
dims = __MothmpiMothdims_create(world_size,3);
fft_t = __MothmpiMothtype_contiguous(__MothBaseSTAR(8,2));
if (__MothBaseEQUAL(world_rank,0)){
__MothPrint(convString("WORLD_SIZE = "));__MothPrint(world_size);__MothPrint(convString("\n"));
__MothPrint(convString("WORLD_RANK = "));__MothPrint(world_rank);__MothPrint(convString("\n"));
__MothPrint(convString("DIMS:\n"));
__MothPrint(dims);

}

buff1 = __MothnmMotharange(__MothBaseSTAR(64,2));
buff2 = __MothnmMothzeros(__MothBaseSTAR(64,2));
if (__MothBaseEQUAL(world_rank,0)){
__MothPrint(buff1);

}

nsends = 8;
__MothmpiMothalltoall(buff1,nsends,fft_t,buff2,nsends,fft_t,comm);
if (__MothBaseEQUAL(world_rank,5)){
__MothPrint(buff2);

}

__MothmpiMothtype_free(fft_t);
__MothmpiMothfinalize();
return 0;

}

int main() {I.real = 0; I.imag = 1; return Mothmain();}
