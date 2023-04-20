#include <stdlib.h>
#include <stdio.h>
#include <math.h>
//#include <complex.h>
//#undef complex
#include <stdarg.h>
#include <memory>
#include <string>
#include <vector>

#define MothRuntimeError(err_t,...) fprintf(stderr, "\033[1;33mMothRuntimeError\033[0;0m(\033[1;31m%s\033[0;0m):\n\t",err_t); fprintf(stderr, __VA_ARGS__); exit(1);

void MoththrowErr(std::string c){
    MothRuntimeError("ThrownError","%s",c.c_str());
}

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
typedef std::string __Mothstr;
//typedef float __Mothcomplexf[2];
//typedef double __Mothcomplexd[2];

void __MothPrint(__Mothstr input){
    printf("%s",input.c_str());
}

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

__Mothstr operator*(const __Mothstr & lhs, long rhs) {
    __Mothstr out = "";
    for (int i = 0; i < rhs; i++){
        out = out + lhs;
    }
    return out;
}

__Mothstr convString (const char inp[]) {
    __Mothstr out(inp);
    return out;
}

typedef __Mothcomplex<float> __Mothcomplexf;
typedef __Mothcomplex<double> __Mothcomplexd;

__Mothcomplexf I;

//#define NUMARGS(...)  (sizeof((int[]){__VA_ARGS__})/sizeof(int))
#define __MothArrayINDEX(arr,n,...) arr[arr.get_index(n,__VA_ARGS__)]
#define __MothTupleINDEX(tup,n,idx) tup.findIndex(idx)
#define __MothListContainerINDEX(list,n,idx) list.findIndex(idx,0)
#define __MothBaseINDEX(base,n,idx) base[idx]
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
//#define __MothBaseSTARSTAR(f,s) pow(f,s)

inline int __MothBaseSTARSTAR(int f, int s){
    int out = 1;
    for (int i = 0; i < s; i++){
        out = out * f;
    }
    return out;
}

inline float __MothBaseSTARSTAR(double f, int s){
    float out = 1;
    for (int i = 0; i < s; i++){
        out = out * f;
    }
    return out;
}

inline float __MothBaseSTARSTAR(double f, double s){
    return pow(f,s);
}

inline float __MothBaseSTARSTAR(int f, double s){
    return pow(f,s);
}

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

//void __MothPrint(std::string f){
//
//}

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

template<class T>
void __MothPrint(T f){
    f.Moth__print__();
}

template <class T>
class __MothTuple {
    public:
        std::shared_ptr<T> raw;
        int size;
        __MothTuple(){
            size = 0;
        }
        __MothTuple(T item){
            size = 1;
            std::shared_ptr<T> tmp_raw (static_cast<T*>(malloc(size*sizeof(T))),free);
            tmp_raw.get()[0] = item;
            raw = tmp_raw;
        }
        __MothTuple(int in_size, T in_items[]){
            size = in_size;
            std::shared_ptr<T> tmp_raw (static_cast<T*>(malloc(in_size*sizeof(T))),free);
            for (int i = 0; i < size; i++){
                tmp_raw.get()[i] = in_items[i];
            }
            raw = tmp_raw;
        }

        __Mothbool operator == (const __MothTuple<T> &other){
            if (size != other.size){
                return false;
            }
            for (int i = 0; i < size; i++){
                if (raw.get()[i] != other.raw.get()[i]){
                    return false;
                }
            }
            return true;
        }

        __Mothbool operator != (const __MothTuple<T> &other){
            if (size != other.size){
                return true;
            }
            for (int i = 0; i < size; i++){
                if (raw.get()[i] != other.raw.get()[i]){
                    return true;
                }
            }
            return false;
        }

        T findIndex(int index){
            return raw.get()[index];
        }

        void __print__() const{
            printf("(");
            if (size > 0){
                for (int i = 0; i < (size-1); i++){
                    __MothPrint(raw.get()[i]);
                    printf(", ");
                }
                __MothPrint(raw.get()[size-1]);
            }
            printf(")");
        }
        int Mothlen(){
            return size;
        }
};

template <class T>
class __MothList {
    public:
        std::shared_ptr<__MothList<T> > next_item;
        int terminator;
        int initialized;
        T val;
        __MothList(){
            terminator = 1;
            initialized = 0;
        }
        void Mothappend(T new_val){
            if ((terminator==1) && (initialized == 0)){
                val = new_val;
                initialized = 1;
                return;
            }
            if (terminator == 1){
                terminator = 0;
                __MothList<T> new_next;
                new_next.Mothappend(new_val);
                new_next.terminator = 1;
                next_item = std::make_shared<__MothList<T> >(std::move(new_next));
                return;
            }
            next_item->Mothappend(new_val);
        }
        T Mothpop(int idx = 0){
            if ((terminator == 1) && (initialized == 0)){
                MothRuntimeError("ListPopError","List index \033[1;34m%d\033[0;0m out of range.\n",idx);
            }
            if ((terminator == 1) && (initialized == 1)){
                if (idx == 0){
                    initialized = 0;
                    return val;
                }else{
                    MothRuntimeError("ListPopError","List index \033[1;34m%d\033[0;0m out of range.\n",idx);
                }
            }
            if (idx == 0){
                std::shared_ptr<__MothList<T> > new_next = next_item->next_item;
                T new_val = next_item->val;
                int new_terminator = next_item->terminator;
                int new_initialize = 1;
                T out_val = val;
                val = new_val;
                terminator = new_terminator;
                initialized = new_initialize;
                next_item = new_next;
                return out_val;
            }
            T out = next_item->Mothpop(idx-1);
            if (next_item->initialized == 0){
                terminator = 1;
            }
            return out;
        }
        int Mothlen(){
            if ((terminator == 1) && (initialized == 0)){
                return 0;
            }
            if (terminator == 1){
                return 1;
            }
            return 1 + next_item->Mothlen();
        }
        void __print__() const{
            if ((terminator == 1) && (initialized == 0)){
                printf("]");
                return;
            }
            if ((terminator == 1) && (initialized == 1)){
                __MothPrint(val);
                printf("]");
                return;
            }
            __MothPrint(val);
            printf(",");
            next_item->__print__();
        }
        T& findIndex(int idx, int count){
            if (initialized == 0){
                MothRuntimeError("ListIndexError","Index \033[1;34m%d\033[0;0m out of range.\n",idx);
            }
            if (count == idx){
                return val;
            }else{
                if (terminator == 1){
                    MothRuntimeError("ListIndexError","Index \033[1;34m%d\033[0;0m out of range.\n",idx);
                }
                return next_item->findIndex(idx,count+1);
            }
        }
        //T& operator[](int idx){
        //    return val;
        //}
};

template <class T>
class __MothListContainer {
    public:
        std::shared_ptr<__MothList<T> > first_item;
        __MothListContainer(){
            __MothList<T> new_item;
            first_item = std::make_shared<__MothList<T> >(std::move(new_item));
        }
        void Mothreset(){
            __MothList<T> new_item;
            first_item = std::make_shared<__MothList<T> >(std::move(new_item));
        }
        void Mothappend(T var){
            first_item->Mothappend(var);
        }
        T Mothpop(int idx = 0){
            if (idx < 0){
                int len = first_item->Mothlen();
                int new_idx = len + idx;
                if (new_idx < 0){
                    MothRuntimeError("ListPopError","Index \033[1;34m%d\033[0;0m out of range.\n",idx);
                }
                return first_item->Mothpop(new_idx);
            }
            return first_item->Mothpop(idx);
        }
        int Mothlen(){
            return first_item->Mothlen();
        }
        void __print__() const{
            first_item->__print__();
        }
        T& findIndex(int idx, int count){
            if (idx < 0){
                int len = first_item->Mothlen();
                int new_idx = len + idx;
                if (new_idx < 0){
                    MothRuntimeError("ListIndexError","Index \033[1;34m%d\033[0;0m out of range.\n",idx);
                }
                return first_item->findIndex(new_idx,count);
            }
            return first_item->findIndex(idx,count);
        }

};

template <class T, class ...Args>
__MothTuple<T> newTuple(int nitems, Args&&... args){
    T items[] = {args...};
    __MothTuple<T> out(nitems,items);
    //for (int i = 0; i < nitems; i++){
    //    __MothPrint(items[i]);
    //}
    return out;
}

template <class T, class ...Args>
__MothTuple<T> newTuple(int nitems, T items[]){
    __MothTuple<T> out(nitems,items);
    //for (int i = 0; i < nitems; i++){
    //    __MothPrint(items[i]);
    //}
    return out;
}

template <class T>
class __MothArray {
    public:
        int ndims;
        int size;
        std::shared_ptr<int> dims;
        std::shared_ptr<int> muls;
        std::shared_ptr<T> raw;
        __MothTuple<int> shape;
        int initialized;

        __MothArray(){

        }

        __MothArray(int in_ndims){
            //printf("INIT!!\n");
            ndims = in_ndims;
            //dims = (int*)malloc(ndims * sizeof(int));
            //muls = (int*)malloc(ndims * sizeof(int));
            shape = newTuple<int>(0);
            std::shared_ptr<int> tmp_dims (static_cast<int*>(malloc(ndims*sizeof(int))),free);
            std::shared_ptr<int> tmp_muls (static_cast<int*>(malloc(ndims*sizeof(int))),free);
            dims = tmp_dims;
            muls = tmp_muls;

            initialized = 0;
        }

        T Mothsum(){
            T total = 0;
            for (int i = 0; i < size; i++){
                total = total + raw.get()[i];
            }
            return total;
        }

        T Mothmin(){
            T out = raw.get()[0];
            for (int i = 0; i < size; i++){
                if (out > raw.get()[i]){
                    out = raw.get()[i];
                }
            }
            return out;
        }

        T Mothmax(){
            T out = raw.get()[0];
            for (int i = 0; i < size; i++){
                if (out < raw.get()[i]){
                    out = raw.get()[i];
                }
            }
            return out;
        }

        __MothArray<T> Mothmax(int axis){
            if (axis < 0){
                axis += ndims;
            }
            if ((axis < 0) || (axis >= ndims)){
                MothRuntimeError("BroadcastAxis","Axis %d is out of range\n",axis);
            }
            int* new_dims = (int*)malloc(ndims*sizeof(int));
            int* index = (int*)malloc(ndims*sizeof(int));
            int* new_index = (int*)malloc(ndims*sizeof(int));
            for (int i = 0; i < ndims; i++){
                new_dims[i] = dims.get()[i];
                index[i] = 0;
                new_index[i] = 0;
            }
            new_dims[axis] = 1;
            __MothArray<T> out(ndims);
            out.init(new_dims);
            //out.Mothzero();
            T mymin = Mothmin();
            for (int i = 0; i < out.size; i++){
                out.raw.get()[i] = mymin;
            }

            for (int i = 0; i < size; i++){
                if (out.raw.get()[out.get_index_from_ptr(ndims,new_index)] < raw.get()[get_index_from_ptr(ndims,index)]){
                    out.raw.get()[out.get_index_from_ptr(ndims,new_index)] = raw.get()[get_index_from_ptr(ndims,index)];
                }
                index[ndims-1]++;
                for (int j = ndims-1; j > 0; j--){
                    if (index[j] == dims.get()[j]){
                        index[j] = 0;
                        index[j-1]++;
                    }
                }
                if (index[0] == dims.get()[0]){
                    break;
                }
                for (int j = 0; j < ndims; j++){
                    if(index[j] >= new_dims[j]){
                        new_index[j] = new_dims[j]-1;
                    }else{
                        new_index[j] = index[j];
                    }
                }
            }

            free(new_dims);
            free(index);
            free(new_index);
            return out;
        }

        __MothArray<T> Mothmin(int axis){
            if (axis < 0){
                axis += ndims;
            }
            if ((axis < 0) || (axis >= ndims)){
                MothRuntimeError("BroadcastAxis","Axis %d is out of range\n",axis);
            }
            int* new_dims = (int*)malloc(ndims*sizeof(int));
            int* index = (int*)malloc(ndims*sizeof(int));
            int* new_index = (int*)malloc(ndims*sizeof(int));
            for (int i = 0; i < ndims; i++){
                new_dims[i] = dims.get()[i];
                index[i] = 0;
                new_index[i] = 0;
            }
            new_dims[axis] = 1;
            __MothArray<T> out(ndims);
            out.init(new_dims);
            //out.Mothzero();
            T mymax = Mothmax();
            for (int i = 0; i < out.size; i++){
                out.raw.get()[i] = mymax;
            }

            for (int i = 0; i < size; i++){
                if (out.raw.get()[out.get_index_from_ptr(ndims,new_index)] > raw.get()[get_index_from_ptr(ndims,index)]){
                    out.raw.get()[out.get_index_from_ptr(ndims,new_index)] = raw.get()[get_index_from_ptr(ndims,index)];
                }
                index[ndims-1]++;
                for (int j = ndims-1; j > 0; j--){
                    if (index[j] == dims.get()[j]){
                        index[j] = 0;
                        index[j-1]++;
                    }
                }
                if (index[0] == dims.get()[0]){
                    break;
                }
                for (int j = 0; j < ndims; j++){
                    if(index[j] >= new_dims[j]){
                        new_index[j] = new_dims[j]-1;
                    }else{
                        new_index[j] = index[j];
                    }
                }
            }

            free(new_dims);
            free(index);
            free(new_index);
            return out;
        }

        __MothArray<T> Mothsum(int axis){
            if (axis < 0){
                axis += ndims;
            }
            if ((axis < 0) || (axis >= ndims)){
                MothRuntimeError("BroadcastAxis","Axis %d is out of range\n",axis);
            }
            int* new_dims = (int*)malloc(ndims*sizeof(int));
            int* index = (int*)malloc(ndims*sizeof(int));
            int* new_index = (int*)malloc(ndims*sizeof(int));
            for (int i = 0; i < ndims; i++){
                new_dims[i] = dims.get()[i];
                index[i] = 0;
                new_index[i] = 0;
            }
            new_dims[axis] = 1;
            __MothArray<T> out(ndims);
            out.init(new_dims);
            out.Mothzero();

            for (int i = 0; i < size; i++){
                out.raw.get()[out.get_index_from_ptr(ndims,new_index)] += raw.get()[get_index_from_ptr(ndims,index)];
                index[ndims-1]++;
                for (int j = ndims-1; j > 0; j--){
                    if (index[j] == dims.get()[j]){
                        index[j] = 0;
                        index[j-1]++;
                    }
                }
                if (index[0] == dims.get()[0]){
                    break;
                }
                for (int j = 0; j < ndims; j++){
                    if(index[j] >= new_dims[j]){
                        new_index[j] = new_dims[j]-1;
                    }else{
                        new_index[j] = index[j];
                    }
                }
            }

            free(new_dims);
            free(index);
            free(new_index);
            return out;
        }

        void Mothzero(){
            for (int i = 0; i < size; i++){
                raw.get()[i] = 0;
            }
        }

        T* Mothcptr(){
            return raw.get();
        }

        template<class T1>
        operator __MothArray<T1>() const{
            __MothArray<T1> out(ndims);
            out.init(dims.get());
            for (int i = 0; i < size; i++){
                out.raw.get()[i] = (T1)raw.get()[i];
            }
            return out;
        }

        void init(int in_dims[]){
            if (initialized){
                MothRuntimeError("ArrayReallocError","Array reallocated by Moth. This should not happen...\n")
            }
            shape = newTuple<int>(ndims,in_dims);
            initialized = 1;
            size = 1;
            int i;
            for (i = 0; i < ndims; i++){
                dims.get()[i] = in_dims[i];
                size = size * in_dims[i];
            }
            for (i = 0; i < ndims; i++){
                muls.get()[i] = 1;
                int start = i+1;
                for (int j = start; j < ndims; j++){
                    muls.get()[i] = muls.get()[i] * dims.get()[j];
            }
    }       std::shared_ptr<T> tmp_raw (static_cast<T*>(malloc(size*sizeof(T))),free);
            raw = tmp_raw;
        }
        
        int get_index(int nargs, int idx[]) const {
            int out = 0;
            if (nargs != ndims){
                //MothRuntimeError("ArrayIndexError: Tried to index %d dimensional array with %d dimensional index\n",ndims, nargs);
            }
            for (int i = 0; i < ndims; i++){
                if (idx[i] >= dims.get()[i]){
                    //MothRuntimeError("ArrayIndexError: Index %d in dimension %d is out of bounds for dimension with size %d\n",idx[i],i,dims[i]);
                }
                int dimidx = (idx[i] % dims.get()[i] + dims.get()[i]) % dims.get()[i];
                out = out + dimidx * muls.get()[i];
            }
            return out;
        }

        int get_index_from_ptr(int nargs, int idx[]) const {
            int out = 0;
            if (nargs != ndims){
                //MothRuntimeError("ArrayIndexError: Tried to index %d dimensional array with %d dimensional index\n",ndims, nargs);
            }
            for (int i = 0; i < ndims; i++){
                if (idx[i] >= dims.get()[i]){
                    //MothRuntimeError("ArrayIndexError: Index %d in dimension %d is out of bounds for dimension with size %d\n",idx[i],i,dims[i]);
                }
                int dimidx = (idx[i] % dims.get()[i] + dims.get()[i]) % dims.get()[i];
                out = out + dimidx * muls.get()[i];
            }
            return out;
        }

        template <class... Args>
        int get_index(int nargs, Args&&... args){
            int idx[] = {args...};
            int out = 0;
            if (nargs != ndims){
                MothRuntimeError("ArrayIndexError","Tried to index %d dimensional array with %d dimensional index\n",ndims, nargs);
            }
            for (int i = 0; i < ndims; i++){
                if (idx[i] >= dims.get()[i]){
                    MothRuntimeError("ArrayIndexError","Index %d in dimension %d is out of bounds for dimension with size %d\n",idx[i],i,dims.get()[i]);
                }
                int dimidx = (idx[i] % dims.get()[i] + dims.get()[i]) % dims.get()[i];
                out = out + dimidx * muls.get()[i];
            }
            //printf("GET IDX OUT %d\n",out);
            //printf("MULS %d %d\n",muls.get()[0],muls.get()[1]);
            //printf("DIMS %d %d\n",dims.get()[0],dims.get()[1]);
            return out;
        }

        __MothArray<T> Mothcopy(){
            __MothArray<T> out(ndims);
            out.init(dims.get());
            for (int i = 0; i < size; i++){
                out.raw.get()[i] = raw.get()[i];
            }
            return out;
        }

        void Mothinf2zero(){
            double inf = std::numeric_limits<double>::infinity();
            for (int i = 0; i < size; i++){
                if (raw.get()[i] == inf){
                    raw.get()[i] = 0;
                }
            }
        }

        template <class... Args>
        __MothArray<T> Mothreshape(Args&&... args){
            int new_shape[] = {args...};
            int new_ndims = sizeof(new_shape)/sizeof(int);
            int new_size = 1;
            for (int i = 0; i < new_ndims; i++){
                new_size = new_size * new_shape[i];
            }
            if (new_size != size){
                MothRuntimeError("ArrayReshapeError","Can't reshape array (trying to resize from %d to %d)\n",size,new_size);
            }

            //printf("size: %d\n",size);
            __MothArray<T> out(new_ndims);
            out.init(new_shape);
            for (int i = 0; i < size; i++){
                out.raw.get()[i] = raw.get()[i];
            }
            //printf("dims %d\n",out.ndims);
            return out;
        }

        __MothArray<T> Mothreshape(__MothTuple<int> input_shape){
            int* new_shape = input_shape.raw.get();
            int new_ndims = input_shape.size;
            int new_size = 1;
            for (int i = 0; i < new_ndims; i++){
                new_size = new_size * new_shape[i];
            }
            if (new_size != size){
                MothRuntimeError("ArrayReshapeError","Can't reshape array (trying to resize from %d to %d)\n",size,new_size);
            }

            //printf("size: %d\n",size);
            __MothArray<T> out(new_ndims);
            out.init(new_shape);
            for (int i = 0; i < size; i++){
                out.raw.get()[i] = raw.get()[i];
            }
            //printf("dims %d\n",out.ndims);
            return out;
        }

        void recursive_print(int* indexes) const {
            //printf("CALL %d %d\n",indexes[0],indexes[1]);
            int start = 1;
            for (int i = 0; i < ndims; i++){
                if (indexes[i] != 0){
                    start = 0;
                    break;
                }
            }
            int count = 0;
            for (int i = ndims-1; i >= 0; i--){
                if (i != ndims-1){
                    //printf("index[i] %d\n",indexes[i]);
                    //printf("index[i+1] %d\n",indexes[ndims-1]);
                    int good = 1;
                    for (int j = i+1; j < ndims; j++){
                        if (indexes[j] != 0){
                            good = 0;
                            break;
                        }
                    }
                    if (good){
                        count++;
                    }
                }
            }
            if (start){
                count++;
            }
            if (count > 0){
                for (int i = 0; i < (ndims-count); i++){
                    printf(" ");
                }
            }
            for (int i = 0; i < count; i++){
                printf("[");
            }
            __MothPrint(raw.get()[get_index(ndims,indexes)]);
            indexes[ndims-1]++;
            for (int i = ndims-1; i >= 0; i--){
                if (indexes[i] == dims.get()[i]){
                    printf("]");
                    if (i == 0){
                        return;
                    }
                    indexes[i] = 0;
                    indexes[i-1]++;
                }
            }
            if (ndims > 1){
                if (indexes[ndims-1] == 0){
                    printf("\n");
                    for (int i = 0; i < ndims-1; i++){
                        //printf(" ");
                    }
                }
            }
            if (indexes[ndims-1] != 0){
                printf(" ");
            }
            return recursive_print(indexes);
        }

        void __print__() const {
            int* indexes = (int*)malloc(ndims * sizeof(int));
            for (int i = 0; i < ndims; i++){
                indexes[i] = 0;
            }
            recursive_print(indexes);
            printf("\n");
            free(indexes);
        }

        T& operator[](int idx) const{
            return raw.get()[idx];
        }

        ~__MothArray(){
            //printf("FREE\n");
        }
};

template <>
class __MothArray<__Mothstr> {
    public:
        int ndims;
        int size;
        std::shared_ptr<int> dims;
        std::shared_ptr<int> muls;
        std::vector<__Mothstr> raw;
        __MothTuple<int> shape;
        int initialized;

        __MothArray(){

        }

        __MothArray(int in_ndims){
            //printf("INIT!!\n");
            ndims = in_ndims;
            //dims = (int*)malloc(ndims * sizeof(int));
            //muls = (int*)malloc(ndims * sizeof(int));
            shape = newTuple<int>(0);
            std::shared_ptr<int> tmp_dims (static_cast<int*>(malloc(ndims*sizeof(int))),free);
            std::shared_ptr<int> tmp_muls (static_cast<int*>(malloc(ndims*sizeof(int))),free);
            dims = tmp_dims;
            muls = tmp_muls;

            initialized = 0;
        }

        __Mothstr Mothsum(){
            __Mothstr total = "";
            for (int i = 0; i < size; i++){
                total = total + raw[i];
            }
            return total;
        }

        __MothArray<__Mothstr> Mothsum(int axis){
            if (axis < 0){
                axis += ndims;
            }
            if ((axis < 0) || (axis >= ndims)){
                MothRuntimeError("BroadcastAxis","Axis %d is out of range\n",axis);
            }
            int* new_dims = (int*)malloc(ndims*sizeof(int));
            int* index = (int*)malloc(ndims*sizeof(int));
            int* new_index = (int*)malloc(ndims*sizeof(int));
            for (int i = 0; i < ndims; i++){
                new_dims[i] = dims.get()[i];
                index[i] = 0;
                new_index[i] = 0;
            }
            new_dims[axis] = 1;
            __MothArray<__Mothstr> out(ndims);
            out.init(new_dims);
            out.Mothzero();

            for (int i = 0; i < size; i++){
                out.raw[out.get_index_from_ptr(ndims,new_index)] += raw[get_index_from_ptr(ndims,index)];
                index[ndims-1]++;
                for (int j = ndims-1; j > 0; j--){
                    if (index[j] == dims.get()[j]){
                        index[j] = 0;
                        index[j-1]++;
                    }
                }
                if (index[0] == dims.get()[0]){
                    break;
                }
                for (int j = 0; j < ndims; j++){
                    if(index[j] >= new_dims[j]){
                        new_index[j] = new_dims[j]-1;
                    }else{
                        new_index[j] = index[j];
                    }
                }
            }

            free(new_dims);
            free(index);
            free(new_index);
            return out;
        }

        void Mothzero(){
            for (int i = 0; i < size; i++){
                raw[i] = "";
            }
        }

        __Mothstr* Mothcptr(){
            return raw.data();
        }

        template<class T1>
        operator __MothArray<T1>() const{
            __MothArray<T1> out(ndims);
            out.init(dims.get());
            for (int i = 0; i < size; i++){
                out.raw.get()[i] = (T1)raw[i];
            }
            return out;
        }

        void init(int in_dims[]){
            if (initialized){
                MothRuntimeError("ArrayReallocError","Array reallocated by Moth. This should not happen...\n")
            }
            shape = newTuple<int>(ndims,in_dims);
            initialized = 1;
            size = 1;
            int i;
            for (i = 0; i < ndims; i++){
                dims.get()[i] = in_dims[i];
                size = size * in_dims[i];
            }
            for (i = 0; i < ndims; i++){
                muls.get()[i] = 1;
                int start = i+1;
                for (int j = start; j < ndims; j++){
                    muls.get()[i] = muls.get()[i] * dims.get()[j];
            }
    }       //std::shared_ptr<T> tmp_raw (static_cast<T*>(malloc(size*sizeof(T))),free);
            //raw = tmp_raw;
            raw.resize(size);
        }
        
        int get_index(int nargs, int idx[]) const {
            int out = 0;
            if (nargs != ndims){
                //MothRuntimeError("ArrayIndexError: Tried to index %d dimensional array with %d dimensional index\n",ndims, nargs);
            }
            for (int i = 0; i < ndims; i++){
                if (idx[i] >= dims.get()[i]){
                    //MothRuntimeError("ArrayIndexError: Index %d in dimension %d is out of bounds for dimension with size %d\n",idx[i],i,dims[i]);
                }
                int dimidx = (idx[i] % dims.get()[i] + dims.get()[i]) % dims.get()[i];
                out = out + dimidx * muls.get()[i];
            }
            return out;
        }

        int get_index_from_ptr(int nargs, int idx[]) const {
            int out = 0;
            if (nargs != ndims){
                //MothRuntimeError("ArrayIndexError: Tried to index %d dimensional array with %d dimensional index\n",ndims, nargs);
            }
            for (int i = 0; i < ndims; i++){
                if (idx[i] >= dims.get()[i]){
                    //MothRuntimeError("ArrayIndexError: Index %d in dimension %d is out of bounds for dimension with size %d\n",idx[i],i,dims[i]);
                }
                int dimidx = (idx[i] % dims.get()[i] + dims.get()[i]) % dims.get()[i];
                out = out + dimidx * muls.get()[i];
            }
            return out;
        }

        template <class... Args>
        int get_index(int nargs, Args&&... args){
            int idx[] = {args...};
            int out = 0;
            if (nargs != ndims){
                MothRuntimeError("ArrayIndexError","Tried to index %d dimensional array with %d dimensional index\n",ndims, nargs);
            }
            for (int i = 0; i < ndims; i++){
                if (idx[i] >= dims.get()[i]){
                    MothRuntimeError("ArrayIndexError","Index %d in dimension %d is out of bounds for dimension with size %d\n",idx[i],i,dims.get()[i]);
                }
                int dimidx = (idx[i] % dims.get()[i] + dims.get()[i]) % dims.get()[i];
                out = out + dimidx * muls.get()[i];
            }
            //printf("GET IDX OUT %d\n",out);
            //printf("MULS %d %d\n",muls.get()[0],muls.get()[1]);
            //printf("DIMS %d %d\n",dims.get()[0],dims.get()[1]);
            return out;
        }

        __MothArray<__Mothstr> Mothcopy(){
            __MothArray<__Mothstr> out(ndims);
            out.init(dims.get());
            for (int i = 0; i < size; i++){
                out.raw[i] = raw[i];
            }
            return out;
        }

        void Mothinf2zero(){
            
        }

        template <class... Args>
        __MothArray<__Mothstr> Mothreshape(Args&&... args){
            int new_shape[] = {args...};
            int new_ndims = sizeof(new_shape)/sizeof(int);
            int new_size = 1;
            for (int i = 0; i < new_ndims; i++){
                new_size = new_size * new_shape[i];
            }
            if (new_size != size){
                MothRuntimeError("ArrayReshapeError","Can't reshape array (trying to resize from %d to %d)\n",size,new_size);
            }

            //printf("size: %d\n",size);
            __MothArray<__Mothstr> out(new_ndims);
            out.init(new_shape);
            for (int i = 0; i < size; i++){
                out.raw[i] = raw[i];
            }
            //printf("dims %d\n",out.ndims);
            return out;
        }

        __MothArray<__Mothstr> Mothreshape(__MothTuple<int> input_shape){
            int* new_shape = input_shape.raw.get();
            int new_ndims = input_shape.size;
            int new_size = 1;
            for (int i = 0; i < new_ndims; i++){
                new_size = new_size * new_shape[i];
            }
            if (new_size != size){
                MothRuntimeError("ArrayReshapeError","Can't reshape array (trying to resize from %d to %d)\n",size,new_size);
            }

            //printf("size: %d\n",size);
            __MothArray<__Mothstr> out(new_ndims);
            out.init(new_shape);
            for (int i = 0; i < size; i++){
                out.raw[i] = raw[i];
            }
            //printf("dims %d\n",out.ndims);
            return out;
        }

        void recursive_print(int* indexes) const {
            //printf("CALL %d %d\n",indexes[0],indexes[1]);
            int start = 1;
            for (int i = 0; i < ndims; i++){
                if (indexes[i] != 0){
                    start = 0;
                    break;
                }
            }
            int count = 0;
            for (int i = ndims-1; i >= 0; i--){
                if (i != ndims-1){
                    //printf("index[i] %d\n",indexes[i]);
                    //printf("index[i+1] %d\n",indexes[ndims-1]);
                    int good = 1;
                    for (int j = i+1; j < ndims; j++){
                        if (indexes[j] != 0){
                            good = 0;
                            break;
                        }
                    }
                    if (good){
                        count++;
                    }
                }
            }
            if (start){
                count++;
            }
            if (count > 0){
                for (int i = 0; i < (ndims-count); i++){
                    printf(" ");
                }
            }
            for (int i = 0; i < count; i++){
                printf("[");
            }
            __MothPrint(raw[get_index(ndims,indexes)]);
            indexes[ndims-1]++;
            for (int i = ndims-1; i >= 0; i--){
                if (indexes[i] == dims.get()[i]){
                    printf("]");
                    if (i == 0){
                        return;
                    }
                    indexes[i] = 0;
                    indexes[i-1]++;
                }
            }
            if (ndims > 1){
                if (indexes[ndims-1] == 0){
                    printf("\n");
                    for (int i = 0; i < ndims-1; i++){
                        //printf(" ");
                    }
                }
            }
            if (indexes[ndims-1] != 0){
                printf(" ");
            }
            return recursive_print(indexes);
        }

        void __print__() const {
            int* indexes = (int*)malloc(ndims * sizeof(int));
            for (int i = 0; i < ndims; i++){
                indexes[i] = 0;
            }
            recursive_print(indexes);
            printf("\n");
            free(indexes);
        }

        __Mothstr& operator[](int idx){
            return raw[idx];
        }

        ~__MothArray(){
            //printf("FREE\n");
        }
};

template <class T, class ...Args>
__MothArray<T> newArray(int ndims, Args&&... args){
    int dims[] = {args...};
    __MothArray<T> out(ndims);
    out.init(dims);
    return out;
}

template <class T>
__MothArray<T> newArray(int pass, __MothTuple<int> shape){
    int ndims = shape.size;
    __MothArray<T> out(ndims);
    out.init(shape.raw.get());
    return out;
}

template <class T>
class __MothArraySlice {
    public:
        int ndims;
        int size;
        std::shared_ptr<int> dims;
        __MothArray<T> parent;
        __MothTuple<int> shape;
        int initialized;
        std::shared_ptr<int> active_dims;
        std::shared_ptr<int> dim_starts;
        std::shared_ptr<int> dim_ends;
        std::shared_ptr<int> dim_steps;
        __MothArraySlice(){

        }

        void assign(int* indexes, const __MothArray<T> &arr){
            for (int j = 0; j < arr.size; j++){
                parent.raw.get()[get_index_from_ptr(ndims,indexes)] = arr.raw.get()[j];
                indexes[ndims-1]++;
                for (int i = ndims-1; i > 0; i--){
                    if (indexes[i] == dims.get()[i]){
                        indexes[i] = 0;
                        indexes[i-1]++;
                    }
                }
                if (indexes[0] == dims.get()[0]){
                    return;
                }
            }
            return;
            //return recursive_assign(indexes,arr,count+1);
        }

        void operator=(const __MothArray<T> &arr){
            if (ndims != arr.ndims){
                MothRuntimeError("SliceAssign","Slice assign shape is wrong");
            }
            for (int i = 0; i < ndims; i++){
                if (dims.get()[i] != arr.dims.get()[i]){
                    MothRuntimeError("SliceAssign","Slice assign shape is wrong");
                }
            }
            int* indexes = (int*)malloc(ndims*sizeof(int));
            for (int i = 0; i < ndims; i++){
                indexes[i] = 0;
            }
            for (int j = 0; j < arr.size; j++){
                parent.raw.get()[get_index_from_ptr(ndims,indexes)] = arr.raw.get()[j];
                indexes[ndims-1]++;
                for (int i = ndims-1; i > 0; i--){
                    if (indexes[i] == dims.get()[i]){
                        indexes[i] = 0;
                        indexes[i-1]++;
                    }
                }
                if (indexes[0] == dims.get()[0]){
                    break;
                }
            }
            free(indexes);
        }

        __MothArray<T> Mothcopy(){
            __MothArray<T> out = newArray<T>(0,shape);
            int* indexes = (int*)malloc(ndims*sizeof(int));
            for (int i = 0; i < ndims; i++){
                indexes[i] = 0;
            }
            for (int j = 0; j < out.size; j++){
                out.raw.get()[j] = parent.raw.get()[get_index_from_ptr(ndims,indexes)];
                indexes[ndims-1]++;
                for (int i = ndims-1; i > 0; i--){
                    if (indexes[i] == dims.get()[i]){
                        indexes[i] = 0;
                        indexes[i-1]++;
                    }
                }
                if (indexes[0] == dims.get()[0]){
                    break;
                }
            }
            free(indexes);
            return out;
        }

        template <class... Args>
        __MothArray<T> Mothreshape(Args&&... args){
            __MothArray<T> out = Mothcopy();
            return out.Mothreshape(args...);
        }

        __MothArray<T> Mothreshape(__MothTuple<int> input_shape){
            __MothArray<T> out = Mothcopy();
            return out.Mothreshape(input_shape);

        }

        __MothArray<T> Mothsum(int axis){
            __MothArray<T> out = Mothcopy();
            return out.Mothsum(axis);
        }

        T Mothsum(){
            __MothArray<T> out = Mothcopy();
            return out.Mothsum();
        }

        __MothArray<T> Mothmin(int axis){
            __MothArray<T> out = Mothcopy();
            return out.Mothmin(axis);
        }

        T Mothmin(){
            __MothArray<T> out = Mothcopy();
            return out.Mothmin();
        }

        __MothArray<T> Mothmax(int axis){
            __MothArray<T> out = Mothcopy();
            return out.Mothmax(axis);
        }

        T Mothmax(){
            __MothArray<T> out = Mothcopy();
            return out.Mothmax();
        }

        template<class T1>
        void copy(int* indexes, __MothArray<T1> out) const {
            for (int j = 0; j < out.size; j++){
                out.raw.get()[j] = (T1)parent.raw.get()[get_index_from_ptr(ndims,indexes)];
                indexes[ndims-1]++;
                for (int i = ndims-1; i > 0; i--){
                    if (indexes[i] == dims.get()[i]){
                        indexes[i] = 0;
                        indexes[i-1]++;
                    }
                }
                if (indexes[0] == dims.get()[0]){
                    return;
                }
            }
            return;
            //return recursive_copy(indexes,out,count+1);
        }

        template<class T1>
        operator __MothArray<T1>() const {
            __MothArray<T1> out = newArray<T1>(0,shape);
            int* indexes = (int*)malloc(ndims*sizeof(int));
            for (int i = 0; i < ndims; i++){
                indexes[i] = 0;
            }
            for (int j = 0; j < out.size; j++){
                out.raw.get()[j] = (T1)parent.raw.get()[get_index_from_ptr(ndims,indexes)];
                indexes[ndims-1]++;
                for (int i = ndims-1; i > 0; i--){
                    if (indexes[i] == dims.get()[i]){
                        indexes[i] = 0;
                        indexes[i-1]++;
                    }
                }
                if (indexes[0] == dims.get()[0]){
                    break;
                }
            }
            free(indexes);
            return out;
        }

        int get_index_from_ptr(int nargs, int index[]) const {
            if (nargs != ndims){
                MothRuntimeError("ArrayIndexError","Tried to index %d dimensional slice with %d dimensional index\n",ndims, nargs);
            }
            int* fixed_index = (int*)malloc(parent.ndims * sizeof(int));
            int count = 0;
            for (int i = 0; i < parent.ndims; i++){
                if (active_dims.get()[i] == 0){
                    fixed_index[i] = dim_starts.get()[i];
                }
                else{
                    if (index[count] < 0){
                        index[count] = index[count] + dims.get()[count];
                    }
                    fixed_index[i] = (index[count] * dim_steps.get()[i]) + dim_starts.get()[i];
                    if (dim_steps.get()[i] < 0){
                        if (fixed_index[i] > dim_starts.get()[i]){
                            MothRuntimeError("ArrayIndexError","Index out of range in slice\n");
                        }
                        if (fixed_index[i] <= dim_ends.get()[i]){
                            MothRuntimeError("ArrayIndexError","Index out of range in slice\n");
                        }
                    }
                    else{
                        if (fixed_index[i] >= dim_ends.get()[i]){
                            MothRuntimeError("ArrayIndexError","Index out of range in slice\n");
                        }
                        if (fixed_index[i] < dim_starts.get()[i]){
                            MothRuntimeError("ArrayIndexError","Index out of range in slice\n");
                        }
                    }
                    count++;
                }
            }
            int out = 0;
            for (int i = 0; i < parent.ndims; i++){
                if (fixed_index[i] >= parent.dims.get()[i]){
                    MothRuntimeError("ArrayIndexError","Index %d in dimension %d is out of bounds for dimension with size %d\n",fixed_index[i],i,parent.dims.get()[i]);
                }
                int dimidx = (fixed_index[i] % parent.dims.get()[i] + parent.dims.get()[i]) % parent.dims.get()[i];
                out = out + dimidx * parent.muls.get()[i];
            }
            free(fixed_index);
            return out;
        }

        template <class... Args>
        int get_index(int nargs, Args&&... args){
            int index[] = {args...};
            return get_index_from_ptr(nargs,index);
        }

        T& operator[](int idx){
            return parent[idx];
        }

        void recursive_print(int* indexes) const {
            //printf("CALL %d %d\n",indexes[0],indexes[1]);
            int start = 1;
            for (int i = 0; i < ndims; i++){
                if (indexes[i] != 0){
                    start = 0;
                    break;
                }
            }
            int count = 0;
            for (int i = ndims-1; i >= 0; i--){
                if (i != ndims-1){
                    //printf("index[i] %d\n",indexes[i]);
                    //printf("index[i+1] %d\n",indexes[ndims-1]);
                    int good = 1;
                    for (int j = i+1; j < ndims; j++){
                        if (indexes[j] != 0){
                            good = 0;
                            break;
                        }
                    }
                    if (good){
                        count++;
                    }
                }
            }
            if (start){
                count++;
            }
            if (count > 0){
                for (int i = 0; i < (ndims-count); i++){
                    printf(" ");
                }
            }
            for (int i = 0; i < count; i++){
                printf("[");
            }
            __MothPrint(parent.raw.get()[get_index_from_ptr(ndims,indexes)]);
            indexes[ndims-1]++;
            for (int i = ndims-1; i >= 0; i--){
                if (indexes[i] == dims.get()[i]){
                    printf("]");
                    if (i == 0){
                        return;
                    }
                    indexes[i] = 0;
                    indexes[i-1]++;
                }
            }
            if (ndims > 1){
                if (indexes[ndims-1] == 0){
                    printf("\n");
                    for (int i = 0; i < ndims-1; i++){
                        //printf(" ");
                    }
                }
            }
            if (indexes[ndims-1] != 0){
                printf(" ");
            }
            return recursive_print(indexes);
        }

        void __print__() const {
            int* indexes = (int*)malloc(ndims * sizeof(int));
            for (int i = 0; i < ndims; i++){
                indexes[i] = 0;
            }
            recursive_print(indexes);
            printf("\n");
            free(indexes);
        }

};

template<class T, class ...Args>
__MothListContainer<T> __MothGetSlice(__MothListContainer<T> input, int nargs, int start, int stop, int step){
    int begin = start;
    int end = stop;
    if (step < 0){
        end = start-1;
        begin = stop-1;
    }
    int new_size = (end-begin)/step;
    __MothListContainer<T> out;
    out.Mothreset();
    for (int i = 0; i < new_size; i++){
        int index = begin + i*step;
        out.Mothappend(input.findIndex(index,0));
    }
    return out;

}

template<class T, class ...Args>
__MothArraySlice<T> __MothGetSlice(__MothArray<T> input, int nargs, Args&&... args){
    int slice_dims[] = {args...};
    if (nargs != (input.ndims*3)){
        MothRuntimeError("ArraySliceErr","Wrong number of inputs to MothGetSlice (%d instead of %d)\n",nargs/3,input.ndims);
    }
    __MothArraySlice<T> out;
    std::shared_ptr<int> new_dim_starts (static_cast<int*>(malloc(input.ndims*sizeof(int))),free);
    std::shared_ptr<int> new_dim_ends (static_cast<int*>(malloc(input.ndims*sizeof(int))),free);
    std::shared_ptr<int> new_dim_steps (static_cast<int*>(malloc(input.ndims*sizeof(int))),free);
    std::shared_ptr<int> new_active_dims (static_cast<int*>(malloc(input.ndims*sizeof(int))),free);
    int new_shape_size = 0;
    for (int index = 0; index < input.ndims; index++){
        new_dim_starts.get()[index] = slice_dims[index*3];
        new_dim_ends.get()[index] = slice_dims[index*3+1];
        new_dim_steps.get()[index] = slice_dims[index*3+2];
        if (new_dim_steps.get()[index] < 0){
            new_dim_starts.get()[index] = slice_dims[index*3+1]-1;
            new_dim_ends.get()[index] = slice_dims[index*3]-1;
        }
        if (slice_dims[index*3+2] == 0){
            new_active_dims.get()[index] = 0;
        }else{
            new_active_dims.get()[index] = 1;
            new_shape_size++;
        }
    }
    std::shared_ptr<int> new_dims (static_cast<int*>(malloc(new_shape_size*sizeof(int))),free);
    int count = 0;
    int size = 1;
    for (int index = 0; index < input.ndims; index++){
        //new_dim_starts.get()[index] = slice_dims[index*3];
        //new_dim_ends.get()[index] = slice_dims[index*3+1];
        //new_dim_steps.get()[index] = slice_dims[index*3+2];
        if (slice_dims[index*3+2] == 0){
            
        }else{
            new_dims.get()[count] = abs((slice_dims[index*3+1] - slice_dims[index*3])/(slice_dims[index*3+2]));
            size = size * new_dims.get()[count];
            count++;
        }
    }
    __MothTuple<int> new_shape = newTuple<int>(new_shape_size,new_dims.get());
    out.dims = new_dims;
    out.size = size;
    out.ndims = new_shape_size;
    out.dim_starts = new_dim_starts;
    out.dim_ends = new_dim_ends;
    out.dim_steps = new_dim_steps;
    out.active_dims = new_active_dims;
    out.shape = new_shape;
    out.initialized = 1;
    out.parent = input;
    return out;
}

/*template <class T, class ...Args>
__MothListContainer<T> newList(int nitems, Args&&... args){
    T items[] = {args...};
    __MothListContainer<T> out;
    out.Mothreset();
    for (int i = 0; i < nitems; i++){
        out.Mothappend(items[i]);
    }
    return out;
}*/

#define ArrayBroadcast(op_,T1,T2,T3) \
    inline __MothArray<T1> operator op_(const __MothArray<T2>& arr1, const __MothArray<T3>& arr2){\
        int found = 1;\
        int dim1; int dim2;\
        int output_ndims = arr1.ndims;\
        if (arr2.ndims > output_ndims){\
            output_ndims = arr2.ndims;\
        }\
        int* arr1dims = (int*)malloc(output_ndims*sizeof(int));\
        int* arr2dims = (int*)malloc(output_ndims*sizeof(int));\
        for (int i = 0; i < output_ndims; i++){\
            arr1dims[i] = 1;\
            arr2dims[i] = 1;\
        }\
        int* output_dims = (int*)malloc(output_ndims*sizeof(int));\
        int count = output_ndims -1;\
        for (dim1 = arr1.ndims-1; dim1 >= 0; dim1--){\
            arr1dims[count] = arr1.dims.get()[dim1];\
            count--;\
        }\
        count = output_ndims -1;\
        for (dim2 = arr2.ndims-1; dim2 >= 0; dim2--){\
            arr2dims[count] = arr2.dims.get()[dim2];\
            count--;\
        }\
        for (int i = output_ndims - 1; i >= 0; i--){\
            if (!(((arr1dims[i] == arr2dims[i]) || (arr1dims[i] == 1)) || (arr2dims[i] == 1))){\
                found = 0;break;\
            }\
            output_dims[i] = arr1dims[i];\
            if(arr2dims[i] > output_dims[i]){\
                output_dims[i] = arr2dims[i];\
            }\
        }\
        if (found == 0){\
            free(arr1dims);free(arr2dims);free(output_dims);\
            MothRuntimeError("BroadcastErr","Array shapes are not broadcastable");\
        }\
        __MothArray<T1> out = newArray<T1>(0,newTuple<int>(output_ndims,output_dims));\
        int size = 1;\
        for (int i = 0; i < output_ndims; i++){\
            size = size * output_dims[i];\
            output_dims[i]--;\
        }\
        int arr1offset = output_ndims - arr1.ndims;\
        int arr2offset = output_ndims - arr2.ndims;\
        for (int i = 0; i < size; i++){\
            int output_index = 0;\
            int arr1_index = 0;\
            int arr2_index = 0;\
            for (int j = 0; j < output_ndims; j++){\
                output_index = output_index + out.muls.get()[j]*output_dims[j];\
            }\
            for (int j = arr1offset; j < output_ndims; j++){\
                if (arr1dims[j] != 1){\
                    arr1_index = arr1_index + arr1.muls.get()[j-arr1offset]*output_dims[j];\
                }\
            }\
            for (int j = arr2offset; j < output_ndims; j++){\
                if (arr2dims[j] != 1){\
                    arr2_index = arr2_index + arr2.muls.get()[j-arr2offset]*output_dims[j];\
                }\
            }\
            out.raw.get()[output_index] = arr1.raw.get()[arr1_index] op_ arr2.raw.get()[arr2_index];\
            output_dims[output_ndims-1]--;\
            for (int j = output_ndims-1; j > 0; j--){\
                if (output_dims[j] < 0){\
                    output_dims[j] = out.dims.get()[j] - 1;\
                    output_dims[j-1]--;\
                }\
            }\
            if (output_dims[0] < 0){\
                break;\
            }\
        }\
        free(arr1dims);free(arr2dims);free(output_dims);\
        return out;\
    }

#define ArrayBroadcastSlice1(op_,T1,T2,T3) \
    inline __MothArray<T1> operator op_(const __MothArraySlice<T2>& slice1, const __MothArray<T3>& arr2){\
        __MothArray<T2> arr1 = slice1;\
        int found = 1;\
        int dim1; int dim2;\
        int output_ndims = arr1.ndims;\
        if (arr2.ndims > output_ndims){\
            output_ndims = arr2.ndims;\
        }\
        int* arr1dims = (int*)malloc(output_ndims*sizeof(int));\
        int* arr2dims = (int*)malloc(output_ndims*sizeof(int));\
        for (int i = 0; i < output_ndims; i++){\
            arr1dims[i] = 1;\
            arr2dims[i] = 1;\
        }\
        int* output_dims = (int*)malloc(output_ndims*sizeof(int));\
        int count = output_ndims -1;\
        for (dim1 = arr1.ndims-1; dim1 >= 0; dim1--){\
            arr1dims[count] = arr1.dims.get()[dim1];\
            count--;\
        }\
        count = output_ndims -1;\
        for (dim2 = arr2.ndims-1; dim2 >= 0; dim2--){\
            arr2dims[count] = arr2.dims.get()[dim2];\
            count--;\
        }\
        for (int i = output_ndims - 1; i >= 0; i--){\
            if (!(((arr1dims[i] == arr2dims[i]) || (arr1dims[i] == 1)) || (arr2dims[i] == 1))){\
                found = 0;break;\
            }\
            output_dims[i] = arr1dims[i];\
            if(arr2dims[i] > output_dims[i]){\
                output_dims[i] = arr2dims[i];\
            }\
        }\
        if (found == 0){\
            free(arr1dims);free(arr2dims);free(output_dims);\
            MothRuntimeError("BroadcastErr","Array shapes are not broadcastable");\
        }\
        __MothArray<T1> out = newArray<T1>(0,newTuple<int>(output_ndims,output_dims));\
        int size = 1;\
        for (int i = 0; i < output_ndims; i++){\
            size = size * output_dims[i];\
            output_dims[i]--;\
        }\
        int arr1offset = output_ndims - arr1.ndims;\
        int arr2offset = output_ndims - arr2.ndims;\
        for (int i = 0; i < size; i++){\
            int output_index = 0;\
            int arr1_index = 0;\
            int arr2_index = 0;\
            for (int j = 0; j < output_ndims; j++){\
                output_index = output_index + out.muls.get()[j]*output_dims[j];\
            }\
            for (int j = arr1offset; j < output_ndims; j++){\
                if (arr1dims[j] != 1){\
                    arr1_index = arr1_index + arr1.muls.get()[j-arr1offset]*output_dims[j];\
                }\
            }\
            for (int j = arr2offset; j < output_ndims; j++){\
                if (arr2dims[j] != 1){\
                    arr2_index = arr2_index + arr2.muls.get()[j-arr2offset]*output_dims[j];\
                }\
            }\
            out.raw.get()[output_index] = arr1.raw.get()[arr1_index] op_ arr2.raw.get()[arr2_index];\
            output_dims[output_ndims-1]--;\
            for (int j = output_ndims-1; j > 0; j--){\
                if (output_dims[j] < 0){\
                    output_dims[j] = out.dims.get()[j] - 1;\
                    output_dims[j-1]--;\
                }\
            }\
            if (output_dims[0] < 0){\
                break;\
            }\
        }\
        free(arr1dims);free(arr2dims);free(output_dims);\
        return out;\
    }

#define ArrayBroadcastSlice2(op_,T1,T2,T3) \
    inline __MothArray<T1> operator op_(const __MothArray<T2>& arr1, const __MothArraySlice<T3>& slice2){\
        __MothArray<T3> arr2 = slice2;\
        int found = 1;\
        int dim1; int dim2;\
        int output_ndims = arr1.ndims;\
        if (arr2.ndims > output_ndims){\
            output_ndims = arr2.ndims;\
        }\
        int* arr1dims = (int*)malloc(output_ndims*sizeof(int));\
        int* arr2dims = (int*)malloc(output_ndims*sizeof(int));\
        for (int i = 0; i < output_ndims; i++){\
            arr1dims[i] = 1;\
            arr2dims[i] = 1;\
        }\
        int* output_dims = (int*)malloc(output_ndims*sizeof(int));\
        int count = output_ndims -1;\
        for (dim1 = arr1.ndims-1; dim1 >= 0; dim1--){\
            arr1dims[count] = arr1.dims.get()[dim1];\
            count--;\
        }\
        count = output_ndims -1;\
        for (dim2 = arr2.ndims-1; dim2 >= 0; dim2--){\
            arr2dims[count] = arr2.dims.get()[dim2];\
            count--;\
        }\
        for (int i = output_ndims - 1; i >= 0; i--){\
            if (!(((arr1dims[i] == arr2dims[i]) || (arr1dims[i] == 1)) || (arr2dims[i] == 1))){\
                found = 0;break;\
            }\
            output_dims[i] = arr1dims[i];\
            if(arr2dims[i] > output_dims[i]){\
                output_dims[i] = arr2dims[i];\
            }\
        }\
        if (found == 0){\
            free(arr1dims);free(arr2dims);free(output_dims);\
            MothRuntimeError("BroadcastErr","Array shapes are not broadcastable");\
        }\
        __MothArray<T1> out = newArray<T1>(0,newTuple<int>(output_ndims,output_dims));\
        int size = 1;\
        for (int i = 0; i < output_ndims; i++){\
            size = size * output_dims[i];\
            output_dims[i]--;\
        }\
        int arr1offset = output_ndims - arr1.ndims;\
        int arr2offset = output_ndims - arr2.ndims;\
        for (int i = 0; i < size; i++){\
            int output_index = 0;\
            int arr1_index = 0;\
            int arr2_index = 0;\
            for (int j = 0; j < output_ndims; j++){\
                output_index = output_index + out.muls.get()[j]*output_dims[j];\
            }\
            for (int j = arr1offset; j < output_ndims; j++){\
                if (arr1dims[j] != 1){\
                    arr1_index = arr1_index + arr1.muls.get()[j-arr1offset]*output_dims[j];\
                }\
            }\
            for (int j = arr2offset; j < output_ndims; j++){\
                if (arr2dims[j] != 1){\
                    arr2_index = arr2_index + arr2.muls.get()[j-arr2offset]*output_dims[j];\
                }\
            }\
            out.raw.get()[output_index] = arr1.raw.get()[arr1_index] op_ arr2.raw.get()[arr2_index];\
            output_dims[output_ndims-1]--;\
            for (int j = output_ndims-1; j > 0; j--){\
                if (output_dims[j] < 0){\
                    output_dims[j] = out.dims.get()[j] - 1;\
                    output_dims[j-1]--;\
                }\
            }\
            if (output_dims[0] < 0){\
                break;\
            }\
        }\
        free(arr1dims);free(arr2dims);free(output_dims);\
        return out;\
    }

#define ArrayBroadcastSlice3(op_,T1,T2,T3) \
    inline __MothArray<T1> operator op_(const __MothArraySlice<T2>& slice1, const __MothArraySlice<T3>& slice2){\
        __MothArray<T2> arr1 = slice1;\
        __MothArray<T3> arr2 = slice2;\
        int found = 1;\
        int dim1; int dim2;\
        int output_ndims = arr1.ndims;\
        if (arr2.ndims > output_ndims){\
            output_ndims = arr2.ndims;\
        }\
        int* arr1dims = (int*)malloc(output_ndims*sizeof(int));\
        int* arr2dims = (int*)malloc(output_ndims*sizeof(int));\
        for (int i = 0; i < output_ndims; i++){\
            arr1dims[i] = 1;\
            arr2dims[i] = 1;\
        }\
        int* output_dims = (int*)malloc(output_ndims*sizeof(int));\
        int count = output_ndims -1;\
        for (dim1 = arr1.ndims-1; dim1 >= 0; dim1--){\
            arr1dims[count] = arr1.dims.get()[dim1];\
            count--;\
        }\
        count = output_ndims -1;\
        for (dim2 = arr2.ndims-1; dim2 >= 0; dim2--){\
            arr2dims[count] = arr2.dims.get()[dim2];\
            count--;\
        }\
        for (int i = output_ndims - 1; i >= 0; i--){\
            if (!(((arr1dims[i] == arr2dims[i]) || (arr1dims[i] == 1)) || (arr2dims[i] == 1))){\
                found = 0;break;\
            }\
            output_dims[i] = arr1dims[i];\
            if(arr2dims[i] > output_dims[i]){\
                output_dims[i] = arr2dims[i];\
            }\
        }\
        if (found == 0){\
            free(arr1dims);free(arr2dims);free(output_dims);\
            MothRuntimeError("BroadcastErr","Array shapes are not broadcastable");\
        }\
        __MothArray<T1> out = newArray<T1>(0,newTuple<int>(output_ndims,output_dims));\
        int size = 1;\
        for (int i = 0; i < output_ndims; i++){\
            size = size * output_dims[i];\
            output_dims[i]--;\
        }\
        int arr1offset = output_ndims - arr1.ndims;\
        int arr2offset = output_ndims - arr2.ndims;\
        for (int i = 0; i < size; i++){\
            int output_index = 0;\
            int arr1_index = 0;\
            int arr2_index = 0;\
            for (int j = 0; j < output_ndims; j++){\
                output_index = output_index + out.muls.get()[j]*output_dims[j];\
            }\
            for (int j = arr1offset; j < output_ndims; j++){\
                if (arr1dims[j] != 1){\
                    arr1_index = arr1_index + arr1.muls.get()[j-arr1offset]*output_dims[j];\
                }\
            }\
            for (int j = arr2offset; j < output_ndims; j++){\
                if (arr2dims[j] != 1){\
                    arr2_index = arr2_index + arr2.muls.get()[j-arr2offset]*output_dims[j];\
                }\
            }\
            out.raw.get()[output_index] = arr1.raw.get()[arr1_index] op_ arr2.raw.get()[arr2_index];\
            output_dims[output_ndims-1]--;\
            for (int j = output_ndims-1; j > 0; j--){\
                if (output_dims[j] < 0){\
                    output_dims[j] = out.dims.get()[j] - 1;\
                    output_dims[j-1]--;\
                }\
            }\
            if (output_dims[0] < 0){\
                break;\
            }\
        }\
        free(arr1dims);free(arr2dims);free(output_dims);\
        return out;\
    }

//#define ArrayBroadcastSlice(op_) 
//    template<class T>
//    inline __MothArray<T> operator op_(const __MothArraySlice<T>& arr1, const __MothArray<T>& arr2){
//        __MothArray<T>
//    }
#define ArrayBroadcastSTARSTAR(T1,T2,T3) \
__MothArray<T1> __MothBaseSTARSTAR(const __MothArray<T2>& arr1, const __MothArray<T3>& arr2){ \
    int found = 1;\
    int dim1; int dim2;\
    int output_ndims = arr1.ndims;\
    if (arr2.ndims > output_ndims){\
        output_ndims = arr2.ndims;\
    }\
    int* arr1dims = (int*)malloc(output_ndims*sizeof(int));\
    int* arr2dims = (int*)malloc(output_ndims*sizeof(int));\
    for (int i = 0; i < output_ndims; i++){\
        arr1dims[i] = 1;\
        arr2dims[i] = 1;\
    }\
    int* output_dims = (int*)malloc(output_ndims*sizeof(int));\
    int count = output_ndims -1;\
    for (dim1 = arr1.ndims-1; dim1 >= 0; dim1--){\
        arr1dims[count] = arr1.dims.get()[dim1];\
        count--;\
    }\
    count = output_ndims -1;\
    for (dim2 = arr2.ndims-1; dim2 >= 0; dim2--){\
        arr2dims[count] = arr2.dims.get()[dim2];\
        count--;\
    }\
    for (int i = output_ndims - 1; i >= 0; i--){\
        if (!(((arr1dims[i] == arr2dims[i]) || (arr1dims[i] == 1)) || (arr2dims[i] == 1))){\
            found = 0;break;\
        }\
        output_dims[i] = arr1dims[i];\
        if(arr2dims[i] > output_dims[i]){\
            output_dims[i] = arr2dims[i];\
        }\
    }\
    if (found == 0){\
        free(arr1dims);free(arr2dims);free(output_dims);\
        MothRuntimeError("BroadcastErr","Array shapes are not broadcastable");\
    }\
    __MothArray<T1> out = newArray<T1>(0,newTuple<int>(output_ndims,output_dims));\
    int size = 1;\
    for (int i = 0; i < output_ndims; i++){\
        size = size * output_dims[i];\
        output_dims[i]--;\
    }\
    int arr1offset = output_ndims - arr1.ndims;\
    int arr2offset = output_ndims - arr2.ndims;\
    for (int i = 0; i < size; i++){\
        int output_index = 0;\
        int arr1_index = 0;\
        int arr2_index = 0;\
        for (int j = 0; j < output_ndims; j++){\
            output_index = output_index + out.muls.get()[j]*output_dims[j];\
        }\
        for (int j = arr1offset; j < output_ndims; j++){\
            if (arr1dims[j] != 1){\
                arr1_index = arr1_index + arr1.muls.get()[j-arr1offset]*output_dims[j];\
            }\
        }\
        for (int j = arr2offset; j < output_ndims; j++){\
            if (arr2dims[j] != 1){\
                arr2_index = arr2_index + arr2.muls.get()[j-arr2offset]*output_dims[j];\
            }\
        }\
        out.raw.get()[output_index] = __MothBaseSTARSTAR(arr1.raw.get()[arr1_index],arr2.raw.get()[arr2_index]);\
        output_dims[output_ndims-1]--;\
        for (int j = output_ndims-1; j > 0; j--){\
            if (output_dims[j] < 0){\
                output_dims[j] = out.dims.get()[j] - 1;\
                output_dims[j-1]--;\
            }\
        }\
        if (output_dims[0] < 0){\
            break;\
        }\
    }\
    free(arr1dims);free(arr2dims);free(output_dims);\
    return out;\
}

#define ArrayBroadcastAllTypes(op) \
    ArrayBroadcast(op,__Mothchar,__Mothchar,__Mothchar);\
    ArrayBroadcastSlice1(op,__Mothchar,__Mothchar,__Mothchar);\
    ArrayBroadcastSlice2(op,__Mothchar,__Mothchar,__Mothchar);\
    ArrayBroadcastSlice3(op,__Mothchar,__Mothchar,__Mothchar);\
    ArrayBroadcast(op,__Mothuchar,__Mothuchar,__Mothuchar);\
    ArrayBroadcastSlice1(op,__Mothuchar,__Mothuchar,__Mothuchar);\
    ArrayBroadcastSlice2(op,__Mothuchar,__Mothuchar,__Mothuchar);\
    ArrayBroadcastSlice3(op,__Mothuchar,__Mothuchar,__Mothuchar);\
    ArrayBroadcast(op,__Mothshort,__Mothshort,__Mothshort);\
    ArrayBroadcastSlice1(op,__Mothshort,__Mothshort,__Mothshort);\
    ArrayBroadcastSlice2(op,__Mothshort,__Mothshort,__Mothshort);\
    ArrayBroadcastSlice3(op,__Mothshort,__Mothshort,__Mothshort);\
    ArrayBroadcast(op,__Mothushort,__Mothushort,__Mothushort);\
    ArrayBroadcastSlice1(op,__Mothushort,__Mothushort,__Mothushort);\
    ArrayBroadcastSlice2(op,__Mothushort,__Mothushort,__Mothushort);\
    ArrayBroadcastSlice3(op,__Mothushort,__Mothushort,__Mothushort);\
    ArrayBroadcast(op,__Mothint,__Mothint,__Mothint);\
    ArrayBroadcastSlice1(op,__Mothint,__Mothint,__Mothint);\
    ArrayBroadcastSlice2(op,__Mothint,__Mothint,__Mothint);\
    ArrayBroadcastSlice3(op,__Mothint,__Mothint,__Mothint);\
    ArrayBroadcast(op,__Mothuint,__Mothuint,__Mothuint);\
    ArrayBroadcastSlice1(op,__Mothuint,__Mothuint,__Mothuint);\
    ArrayBroadcastSlice2(op,__Mothuint,__Mothuint,__Mothuint);\
    ArrayBroadcastSlice3(op,__Mothuint,__Mothuint,__Mothuint);\
    ArrayBroadcast(op,__Mothlong,__Mothlong,__Mothlong);\
    ArrayBroadcastSlice1(op,__Mothlong,__Mothlong,__Mothlong);\
    ArrayBroadcastSlice2(op,__Mothlong,__Mothlong,__Mothlong);\
    ArrayBroadcastSlice3(op,__Mothlong,__Mothlong,__Mothlong);\
    ArrayBroadcast(op,__Mothulong,__Mothulong,__Mothulong);\
    ArrayBroadcastSlice1(op,__Mothulong,__Mothulong,__Mothulong);\
    ArrayBroadcastSlice2(op,__Mothulong,__Mothulong,__Mothulong);\
    ArrayBroadcastSlice3(op,__Mothulong,__Mothulong,__Mothulong);\
    ArrayBroadcast(op,__Mothfloat,__Mothfloat,__Mothfloat);\
    ArrayBroadcastSlice1(op,__Mothfloat,__Mothfloat,__Mothfloat);\
    ArrayBroadcastSlice2(op,__Mothfloat,__Mothfloat,__Mothfloat);\
    ArrayBroadcastSlice3(op,__Mothfloat,__Mothfloat,__Mothfloat);\
    ArrayBroadcast(op,__Mothfloat,__Mothint,__Mothfloat);\
    ArrayBroadcastSlice1(op,__Mothfloat,__Mothint,__Mothfloat);\
    ArrayBroadcastSlice2(op,__Mothfloat,__Mothint,__Mothfloat);\
    ArrayBroadcastSlice3(op,__Mothfloat,__Mothint,__Mothfloat);\
    ArrayBroadcast(op,__Mothfloat,__Mothfloat,__Mothint);\
    ArrayBroadcastSlice1(op,__Mothfloat,__Mothfloat,__Mothint);\
    ArrayBroadcastSlice2(op,__Mothfloat,__Mothfloat,__Mothint);\
    ArrayBroadcastSlice3(op,__Mothfloat,__Mothfloat,__Mothint);\
    ArrayBroadcast(op,__Mothdouble,__Mothdouble,__Mothdouble);\
    ArrayBroadcastSlice1(op,__Mothdouble,__Mothdouble,__Mothdouble);\
    ArrayBroadcastSlice2(op,__Mothdouble,__Mothdouble,__Mothdouble);\
    ArrayBroadcastSlice3(op,__Mothdouble,__Mothdouble,__Mothdouble);\
    ArrayBroadcast(op,__Mothdouble,__Mothfloat,__Mothdouble);\
    ArrayBroadcastSlice1(op,__Mothdouble,__Mothfloat,__Mothdouble);\
    ArrayBroadcastSlice2(op,__Mothdouble,__Mothfloat,__Mothdouble);\
    ArrayBroadcastSlice3(op,__Mothdouble,__Mothfloat,__Mothdouble);\
    ArrayBroadcast(op,__Mothdouble,__Mothdouble,__Mothfloat);\
    ArrayBroadcastSlice1(op,__Mothdouble,__Mothdouble,__Mothfloat);\
    ArrayBroadcastSlice2(op,__Mothdouble,__Mothdouble,__Mothfloat);\
    ArrayBroadcastSlice3(op,__Mothdouble,__Mothdouble,__Mothfloat);\

#define ArrayBroadcastIntTypes(op) \
    ArrayBroadcast(op,__Mothchar,__Mothchar,__Mothchar);\
    ArrayBroadcastSlice1(op,__Mothchar,__Mothchar,__Mothchar);\
    ArrayBroadcastSlice2(op,__Mothchar,__Mothchar,__Mothchar);\
    ArrayBroadcastSlice3(op,__Mothchar,__Mothchar,__Mothchar);\
    ArrayBroadcast(op,__Mothuchar,__Mothuchar,__Mothuchar);\
    ArrayBroadcastSlice1(op,__Mothuchar,__Mothuchar,__Mothuchar);\
    ArrayBroadcastSlice2(op,__Mothuchar,__Mothuchar,__Mothuchar);\
    ArrayBroadcastSlice3(op,__Mothuchar,__Mothuchar,__Mothuchar);\
    ArrayBroadcast(op,__Mothshort,__Mothshort,__Mothshort);\
    ArrayBroadcastSlice1(op,__Mothshort,__Mothshort,__Mothshort);\
    ArrayBroadcastSlice2(op,__Mothshort,__Mothshort,__Mothshort);\
    ArrayBroadcastSlice3(op,__Mothshort,__Mothshort,__Mothshort);\
    ArrayBroadcast(op,__Mothushort,__Mothushort,__Mothushort);\
    ArrayBroadcastSlice1(op,__Mothushort,__Mothushort,__Mothushort);\
    ArrayBroadcastSlice2(op,__Mothushort,__Mothushort,__Mothushort);\
    ArrayBroadcastSlice3(op,__Mothushort,__Mothushort,__Mothushort);\
    ArrayBroadcast(op,__Mothint,__Mothint,__Mothint);\
    ArrayBroadcastSlice1(op,__Mothint,__Mothint,__Mothint);\
    ArrayBroadcastSlice2(op,__Mothint,__Mothint,__Mothint);\
    ArrayBroadcastSlice3(op,__Mothint,__Mothint,__Mothint);\
    ArrayBroadcast(op,__Mothuint,__Mothuint,__Mothuint);\
    ArrayBroadcastSlice1(op,__Mothuint,__Mothuint,__Mothuint);\
    ArrayBroadcastSlice2(op,__Mothuint,__Mothuint,__Mothuint);\
    ArrayBroadcastSlice3(op,__Mothuint,__Mothuint,__Mothuint);\
    ArrayBroadcast(op,__Mothlong,__Mothlong,__Mothlong);\
    ArrayBroadcastSlice1(op,__Mothlong,__Mothlong,__Mothlong);\
    ArrayBroadcastSlice2(op,__Mothlong,__Mothlong,__Mothlong);\
    ArrayBroadcastSlice3(op,__Mothlong,__Mothlong,__Mothlong);\
    ArrayBroadcast(op,__Mothulong,__Mothulong,__Mothulong);\
    ArrayBroadcastSlice1(op,__Mothulong,__Mothulong,__Mothulong);\
    ArrayBroadcastSlice2(op,__Mothulong,__Mothulong,__Mothulong);\
    ArrayBroadcastSlice3(op,__Mothulong,__Mothulong,__Mothulong);\

ArrayBroadcastAllTypes(-);
ArrayBroadcastAllTypes(+);
ArrayBroadcastAllTypes(/);
//ArrayBroadcastAllTypes(%);
ArrayBroadcastAllTypes(*);
ArrayBroadcastIntTypes(%);

ArrayBroadcastSTARSTAR(__Mothchar,__Mothchar,__Mothchar);
ArrayBroadcastSTARSTAR(__Mothuchar,__Mothuchar,__Mothuchar);
ArrayBroadcastSTARSTAR(__Mothshort,__Mothshort,__Mothshort);
ArrayBroadcastSTARSTAR(__Mothushort,__Mothushort,__Mothushort);
ArrayBroadcastSTARSTAR(__Mothint,__Mothint,__Mothint);
//ArrayBroadcastSTARSTAR(__Mothuint,__Mothuint,__Mothuint);
//ArrayBroadcastSTARSTAR(__Mothlong,__Mothlong,__Mothlong);
//ArrayBroadcastSTARSTAR(__Mothulong,__Mothulong,__Mothulong);
ArrayBroadcastSTARSTAR(__Mothfloat,__Mothfloat,__Mothfloat);
ArrayBroadcastSTARSTAR(__Mothfloat,__Mothint,__Mothfloat);
ArrayBroadcastSTARSTAR(__Mothfloat,__Mothfloat,__Mothint);
ArrayBroadcastSTARSTAR(__Mothdouble,__Mothdouble,__Mothdouble);
ArrayBroadcastSTARSTAR(__Mothdouble,__Mothfloat,__Mothdouble);
ArrayBroadcastSTARSTAR(__Mothdouble,__Mothdouble,__Mothfloat);

#define ArrayBroadcastScalar_t(op,scalar_t) \
template <class T> \
inline __MothArray<T> operator op (const __MothArray<T>& arr, scalar_t scalar){ \
    __MothArray<T> out = newArray<T>(0,arr.shape); \
    for (int i = 0; i < arr.size; i++){ \
        out[i] = arr[i] op scalar; \
    } \
    return out; \
} \
 \
template <class T> \
inline __MothArray<T> operator op (scalar_t scalar, const __MothArray<T>& arr){ \
    __MothArray<T> out = newArray<T>(0,arr.shape); \
    for (int i = 0; i < arr.size; i++){ \
        out[i] = scalar op arr[i]; \
    } \
    return out; \
} \
 \
template <class T> \
inline __MothArray<T> operator op (const __MothArraySlice<T>& arr, scalar_t scalar){ \
    __MothArray<T> out = arr; \
    for (int i = 0; i < arr.size; i++){ \
        out[i] = out[i] op scalar; \
    } \
    return out; \
} \
 \
template <class T> \
inline __MothArray<T> operator op (scalar_t scalar, const __MothArraySlice<T>& arr){ \
    __MothArray<T> out = arr; \
    for (int i = 0; i < arr.size; i++){ \
        out[i] = scalar op out[i]; \
    } \
    return out; \
}\

#define ArrayBroadcastScalar(op) \
ArrayBroadcastScalar_t(op,__Mothchar)\
ArrayBroadcastScalar_t(op,__Mothuchar)\
ArrayBroadcastScalar_t(op,__Mothshort)\
ArrayBroadcastScalar_t(op,__Mothushort)\
ArrayBroadcastScalar_t(op,__Mothint)\
ArrayBroadcastScalar_t(op,__Mothuint)\
ArrayBroadcastScalar_t(op,__Mothlong)\
ArrayBroadcastScalar_t(op,__Mothulong)\
ArrayBroadcastScalar_t(op,__Mothfloat)\
ArrayBroadcastScalar_t(op,__Mothdouble)

ArrayBroadcastScalar(/)
ArrayBroadcastScalar(-)
ArrayBroadcastScalar(+)
ArrayBroadcastScalar(*)
ArrayBroadcastScalar(%)

#define ArrayBroadcastScalarSTARSTAR(scalar_t) \
template <class T>\
__MothArray<T> __MothBaseSTARSTAR(const __MothArray<T>& arr, scalar_t s){\
    __MothArray<T> out = newArray<T>(0,arr.shape);\
    for (int i = 0; i < arr.size; i++){\
        out[i] = __MothBaseSTARSTAR(arr[i], s);\
    }\
    return out;\
}\
\
template <class T>\
__MothArray<T> __MothBaseSTARSTAR(scalar_t s, const __MothArray<T>& arr){\
    __MothArray<T> out = newArray<T>(0,arr.shape);\
    for (int i = 0; i < arr.size; i++){\
        out[i] = __MothBaseSTARSTAR(s,arr[i]);\
    }\
    return out;\
}\
\
template <class T>\
__MothArray<T> __MothBaseSTARSTAR(const __MothArraySlice<T>& arr, scalar_t s){\
    __MothArray<T> out = arr;\
    for (int i = 0; i < arr.size; i++){\
        out[i] = __MothBaseSTARSTAR(out[i], s);\
    }\
    return out;\
}\
\
template <class T>\
__MothArray<T> __MothBaseSTARSTAR(scalar_t s, const __MothArraySlice<T>& arr){\
    __MothArray<T> out = arr;\
    for (int i = 0; i < arr.size; i++){\
        out[i] = __MothBaseSTARSTAR(s,out[i]);\
    }\
    return out;\
}\

ArrayBroadcastScalarSTARSTAR(__Mothchar);
ArrayBroadcastScalarSTARSTAR(__Mothuchar);
ArrayBroadcastScalarSTARSTAR(__Mothshort);
ArrayBroadcastScalarSTARSTAR(__Mothushort);
ArrayBroadcastScalarSTARSTAR(__Mothint);
ArrayBroadcastScalarSTARSTAR(__Mothuint);
ArrayBroadcastScalarSTARSTAR(__Mothlong);
ArrayBroadcastScalarSTARSTAR(__Mothulong);
ArrayBroadcastScalarSTARSTAR(__Mothfloat);
ArrayBroadcastScalarSTARSTAR(__Mothdouble);

template<class T>
void __MothPrint(const __MothArray<T>& arr){
    arr.__print__();
}

template<class T>
void __MothPrint(const __MothArraySlice<T>& arr){
    arr.__print__();
}

template<class T>
void __MothPrint(const __MothListContainer<T>& list){
    printf("[");
    list.__print__();
}

template<class T>
void __MothPrint(const __MothTuple<T>& input){
    input.__print__();
}

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