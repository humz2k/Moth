#include <stdlib.h>
#include <stdio.h>
#include <math.h>
//#include <complex.h>
//#undef complex
#include <stdarg.h>
#include <memory>
#include <string>

#define MothRuntimeError(err_t,...) fprintf(stderr, "\033[1;33mMothRuntimeError\033[0;0m(\033[1;31m%s\033[0;0m):\n\t",err_t); fprintf(stderr, __VA_ARGS__); exit(1);

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

typedef __Mothcomplex<float> __Mothcomplexf;
typedef __Mothcomplex<double> __Mothcomplexd;

__Mothcomplexf I;

//#define NUMARGS(...)  (sizeof((int[]){__VA_ARGS__})/sizeof(int))
#define __MothArrayINDEX(arr,n,...) arr[arr.get_index(n,__VA_ARGS__)]
#define __MothTupleINDEX(tup,n,idx) tup->findIndex(idx)
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

template <class T>
class __MothTuple {
    public:
        std::shared_ptr<T> raw;
        int size;
        __MothTuple(){
            size = 0;
        }
        __MothTuple(int in_size, int in_items[]){
            size = in_size;
            std::shared_ptr<T> tmp_raw (static_cast<int*>(malloc(in_size*sizeof(T))),free);
            for (int i = 0; i < size; i++){
                tmp_raw.get()[i] = in_items[i];
            }
            raw = tmp_raw;
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
        std::shared_ptr<__MothList<T>> next_item;
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
                next_item = std::make_shared<__MothList<T>>(std::move(new_next));
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
                std::shared_ptr<__MothList<T>> new_next = next_item->next_item;
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
        std::shared_ptr<__MothList<T>> first_item;
        __MothListContainer(){
            __MothList<T> new_item;
            first_item = std::make_shared<__MothList<T>>(std::move(new_item));
        }
        void Mothreset(){
            __MothList<T> new_item;
            first_item = std::make_shared<__MothList<T>>(std::move(new_item));
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
        std::shared_ptr<__MothTuple<int>> shape;
        int initialized;
        int freed;

        __MothArray(){

        }

        __MothArray(int in_ndims){
            //printf("INIT!!\n");
            ndims = in_ndims;
            //dims = (int*)malloc(ndims * sizeof(int));
            //muls = (int*)malloc(ndims * sizeof(int));
            __MothTuple<int> new_shape = newTuple<int>(0);
            shape = std::make_shared<__MothTuple<int>>(std::move(new_shape));
            std::shared_ptr<int> tmp_dims (static_cast<int*>(malloc(ndims*sizeof(int))),free);
            std::shared_ptr<int> tmp_muls (static_cast<int*>(malloc(ndims*sizeof(int))),free);
            dims = tmp_dims;
            muls = tmp_muls;

            initialized = 0;
            freed = 0;
        }

        void init(int in_dims[]){
            if (initialized){
                MothRuntimeError("ArrayReallocError","Array reallocated by Moth. This should not happen...\n")
            }
            __MothTuple<int> new_shape = newTuple<int>(ndims,in_dims);
            shape = std::make_shared<__MothTuple<int>>(std::move(new_shape));
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

        /*template <class... Args>
        void init(Args&&... args){
            int in_dims[] = {args...};
            if (initialized){
                MothRuntimeError("ArrayReallocError","Array reallocated. array(...) is a special constructor and does not return an array type.\n")
            }
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
    }
            //raw = (T*)malloc(size * sizeof(T));
            std::shared_ptr<T> tmp_raw (static_cast<T*>(malloc(size*sizeof(T))),free);
            raw = tmp_raw;
        }*/

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

        T& operator[](int idx){
            return raw.get()[idx];
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

template <class T, class ...Args>
__MothList<T> newList(int nitems, Args&&... args){
    T items[] = {args...};
    __MothList<T> out;
    for (int i = 0; i < nitems; i++){
        out.append(items[i]);
    }
    return out;
}

template<class T>
void __MothPrint(const __MothArray<T>& arr){
    arr.__print__();
}

template<class T>
void __MothPrint(const __MothListContainer<T>& list){
    printf("[");
    list.__print__();
}

template<class T>
void __MothPrint(__MothTuple<T>* input){
    input->__print__();
}

void __MothPrint(__Mothstr input){
    printf("%s",input.c_str());
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