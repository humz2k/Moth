#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <complex.h>
#undef complex
#include <stdarg.h>

#define __Mothvoid void
#define __Mothchar char
#define __Mothuchar unsigned char
#define __Mothshort short
#define __Mothushort unsigned short
#define __Mothint int
#define __Mothuint unsigned int
#define __Mothlong long int
#define __Mothulong unsigned long int
#define __Mothfloat float
#define __Mothdouble double
#define __Mothbool int
#define __Mothcomplexf float _Complex
#define __Mothcomplexd double _Complex

#define NUMARGS(...)  (sizeof((int[]){__VA_ARGS__})/sizeof(int))
#define __MothArrayINDEX(arr,...) arr[arr.get_index(NUMARGS(__VA_ARGS__),__VA_ARGS__)]

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

void __MothPrint(__Mothcomplexf f){
    printf("%d %di",creal(f),cimag(f));
}

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