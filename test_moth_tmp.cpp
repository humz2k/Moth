


#include "moth_lib.hpp"


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


__Mothcomplexd __MothcomplexMothcmplx(__Mothdouble real,__Mothdouble imag){

return __MothBasePLUS(real,__MothBaseSTAR(I,imag));

}

__Mothcomplexf __MothcomplexMothcmplxf(__Mothfloat real,__Mothfloat imag){

return __MothBasePLUS(real,__MothBaseSTAR(I,imag));

}

__Mothdouble __MothcomplexMothreal(__Mothcomplexd inp){

return creal(inp);

}

__Mothfloat __MothcomplexMothrealf(__Mothcomplexf inp){

return crealf(inp);

}

__Mothdouble __MothcomplexMothimag(__Mothcomplexd inp){

return cimag(inp);

}

__Mothfloat __MothcomplexMothimagf(__Mothcomplexf inp){

return cimagf(inp);

}

__Mothdouble __MothcomplexMothabs(__Mothcomplexd inp){

return cabs(inp);

}

__Mothfloat __MothcomplexMothabsf(__Mothcomplexf inp){

return cabsf(inp);

}

__Mothdouble __MothcomplexMotharg(__Mothcomplexd inp){

return carg(inp);

}

__Mothfloat __MothcomplexMothargf(__Mothcomplexf inp){

return cargf(inp);

}

__Mothcomplexd __MothcomplexMothconj(__Mothcomplexd inp){

return conj(inp);

}

__Mothcomplexf __MothcomplexMothconjf(__Mothcomplexf inp){

return conjf(inp);

}

__Mothcomplexd __MothcomplexMothproj(__Mothcomplexd inp){

return cproj(inp);

}

__Mothcomplexf __MothcomplexMothprojf(__Mothcomplexf inp){

return cprojf(inp);

}

__Mothint Mothmain(){
__Mothcomplexf b;
b = I;
__MothPrint(b);
return 0;

}

int main() { return Mothmain();}
