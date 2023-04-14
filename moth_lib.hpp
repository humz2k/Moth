#include <stdlib.h>
#include <stdio.h>
#include <math.h>
//#include <complex.h>
//#undef complex
#include <stdarg.h>

typedef void __Mothvoid;
typedef char __Mothchar;
typedef unsigned char __Mothuchar;
typedef short __Mothshort;
typedef unsigned short __Mothushort;
typedef int __Mothint;
typedef unsigned int __Mothuint;
typedef long int __Mothlong;
typedef unsigned long int __Mothulong;
typedef float __Mothfloat;
typedef double __Mothdouble;
typedef bool __Mothbool;
//typedef float __Mothcomplexf[2];
//typedef double __Mothcomplexd[2];

template <typename C_t>
struct __Mothcomplex{
    C_t real;
    C_t imag;

    __Mothcomplex& operator=(const __Mothcomplex& other){
        real = other.real;
        imag = other.imag;
        return *this;
    }

    template <typename T>
    __Mothcomplex& operator=(T other){
        real = other;
        imag = 0;
        return *this;
    }
    
};

template <typename C_t, typename C2_t>
inline __Mothcomplex<C_t> operator+(const __Mothcomplex<C_t>& first, const __Mothcomplex<C2_t>& other){
    __Mothcomplex<C_t> out;
    out.real = first.real + other.real;
    out.imag = first.imag + other.imag;
    return out;
}
template <typename C_t, typename T>
inline __Mothcomplex<C_t> operator+(const __Mothcomplex<C_t>& first, T other){
    __Mothcomplex<C_t> out;
    out.real = first.real + other;
    out.imag = first.imag;
    return out;
}
template <typename C_t, typename T>
inline __Mothcomplex<C_t> operator+(T other, const __Mothcomplex<C_t>& first){
    __Mothcomplex<C_t> out;
    out.real = first.real + other;
    out.imag = first.imag;
    return out;
}
/*
template <typename T>
inline __Mothcomplexf operator+(const __Mothcomplexf& first, T other){
    __Mothcomplexf out;
    out.real = first.real + other;
    out.imag = first.imag;
    return out;
}

template <typename T>
inline __Mothcomplexf operator+(T other, const __Mothcomplexf& first){
    __Mothcomplexf out;
    out.real = first.real + other;
    out.imag = first.imag;
    return out;
}*/

typedef __Mothcomplex<float> __Mothcomplexf;
typedef __Mothcomplex<double> __Mothcomplexd;

__Mothcomplexf I;

#define NUMARGS(...)  (sizeof((int[]){__VA_ARGS__})/sizeof(int))
#define __MothArrayINDEX(arr,...) arr[arr.get_index(NUMARGS(__VA_ARGS__),__VA_ARGS__)]
/*
inline __Mothchar __MothBasePLUS(__Mothchar f, __Mothchar s){return (f+s);}
inline __Mothchar __MothBasePLUS(__Mothchar f, __Mothuchar s){return (f+s);}
inline __Mothchar __MothBasePLUS(__Mothchar f, __Mothshort s){return (f+s);}
inline __Mothchar __MothBasePLUS(__Mothchar f, __Mothushort s){return (f+s);}
inline __Mothint __MothBasePLUS(__Mothchar f, __Mothint s){return (f+s);}
inline __Mothint __MothBasePLUS(__Mothchar f, __Mothuint s){return (f+s);}
inline __Mothlong __MothBasePLUS(__Mothchar f, __Mothlong s){return (f+s);}
inline __Mothlong __MothBasePLUS(__Mothchar f, __Mothulong s){return (f+s);}
inline __Mothfloat __MothBasePLUS(__Mothchar f, __Mothfloat s){return (f+s);}
inline __Mothdouble __MothBasePLUS(__Mothchar f, __Mothdouble s){return (f+s);}
*/
#define __MothBasePLUS(f,s) (f+s)
#define __MothBaseMINUS(f,s) (f-s)
#define __MothBaseSTARSTAR(f,s) pow(f,s)
#define __MothBaseSTAR(f,s) (f*s)
#define __MothBaseSLASH(f,s) (f/s)
#define __MothBasePERCENT(f,s) (f%s)
#define __MothBaseEQUAL(f,s) (f == s)
#define __MothBaseNOT_EQUAL(f,s) (f != s)
#define __MothBaseGREATER(f,s) (f > s)
#define __MothBaseLESS(f,s) (f < s)
#define __MothBaseGREATER_OR_EQUAL(f,s) (f >= s)
#define __MothBaseLESS_OR_EQUAL(f,s) (f <= s)
#define __MothBaseAND(f,s) (f && s)
#define __MothBaseOR(f,s) (f || s)
#define __MothBaseNOT(f) (!f)
#define __MothBaseAMP(f,s) (f & s)
#define __MothBaseVERT(f,s) (f | s)

void __MothPrint(const char* f){
    printf("%s",f);
}

void __MothPrint(__Mothchar f){
    printf("%c",f);
}
void __MothPrint(__Mothuchar f){
    printf("%c",f);
}
void __MothPrint(__Mothshort f){
    printf("%hi",f);
}
void __MothPrint(__Mothushort f){
    printf("%hu",f);
}
void __MothPrint(__Mothint f){
    printf("%d",f);
}
void __MothPrint(__Mothuint f){
    printf("%i",f);
}
void __MothPrint(__Mothlong f){
    printf("%ld",f);
}
void __MothPrint(__Mothulong f){
    printf("%lu",f);
}
void __MothPrint(__Mothfloat f){
    printf("%f",f);
}
void __MothPrint(__Mothdouble f){
    printf("%lf",f);
}
void __MothPrint(__Mothbool f){
    if (f){
        printf("True");
    }else{
        printf("False");
    }
}
void __MothPrint(__Mothcomplexf f){
    printf("%f %fi",f.real,f.imag);
}
void __MothPrint(__Mothcomplexd f){
    printf("%f %fi",f.real,f.imag);
}

//void __MothPrint(__Mothcomplexf f){
//    printf("%d %di",creal(f),cimag(f));
//}

template <class T>
class __MothArray {
    public:
        int ndims;
        int size;
        int* dims;
        int* muls;
        T* raw;
        int initialized;
        __MothArray(int in_ndims){
            ndims = in_ndims;
            dims = (int*)malloc(ndims * sizeof(int));
            muls = (int*)malloc(ndims * sizeof(int));
            initialized = 0;
        }

        template <class... Args>
        void init(Args&&... args){
            initialized = 1;
            int in_dims[] = {args...};
            size = 1;
            int i;
            for (i = 0; i < ndims; i++){
                dims[i] = in_dims[i];
                size = size * in_dims[i];
            }
            for (i = 0; i < ndims; i++){
                muls[i] = 1;
                int start = i+1;
                for (int i = start; i < ndims; i++){
                    muls[i] = muls[i] * dims[i];
            }
    }
            raw = (T*)malloc(size * sizeof(T));
        }

        template <class... Args>
        int get_index(int nargs, Args&&... args){
            int idx[] = {args...};
            int out = 0;
            if (nargs != ndims){
                printf("ARRAY INDEX DIMENSION ERROR\n");
                exit(1);
            }
            for (int i = 0; i < ndims; i++){
                if (idx[i] >= dims[i]){
                    printf("ARRAY INDEX BOUNDS ERROR\n");
                    exit(1);
                }
                int dimidx = (idx[i] % dims[i] + dims[i]) % dims[i];
                out = out + dimidx * muls[i];
            }
            return out;
        }

        T& operator[](int idx){
            return raw[idx];
        }

        ~__MothArray(){
            free(dims);
            free(muls);
            if (initialized == 1){
                free(raw);
            }
        }
};

//int main(){
    //printf("RUNNING\n");
    //__MothArray<float> array1(2);
    //array1.init(10,1);
    //printf("%f\n",__MothIndexArray(array1,0,0));
    //__MothIndexArray(array1,0,0) = 5.0;
    //printf("%f\n",__MothIndexArray(array1,0,0));
    //__MothIndexArray(array1,1,0) = __MothIndexArray(array1,0,0) + 0.5;
    //printf("%f\n",__MothIndexArray(array1,1,0));
    //return 0;
//}