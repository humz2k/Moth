


#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <complex.h>
struct floatArray; typedef struct floatArray floatArray;
struct floatList; typedef struct floatList floatList;struct doubleArray; typedef struct doubleArray doubleArray;
struct doubleList; typedef struct doubleList doubleList;struct doublecomplexArray; typedef struct doublecomplexArray doublecomplexArray;
struct doublecomplexList; typedef struct doublecomplexList doublecomplexList;struct floatcomplexArray; typedef struct floatcomplexArray floatcomplexArray;
struct floatcomplexList; typedef struct floatcomplexList floatcomplexList;struct intArray; typedef struct intArray intArray;
struct intList; typedef struct intList intList;struct voidArray; typedef struct voidArray voidArray;
struct Mothmath;typedef struct Mothmath Mothmath;
struct Mothcomplex;typedef struct Mothcomplex Mothcomplex;


#define printComplex(a) printf("%f + %fi",creal(a),cimag(a))


struct floatArray {
    int initialized;
    int ndims;
    int* dims;
    float* raw;
}; 

struct floatList {

    float val;
    int terminator;
    int initialized;
    struct floatList* next;
};
float* indexfloatList(floatList* input, int index) {

    floatList* indexer = input;
    if (indexer->initialized == 0){
        printf("LIST INDEX ERROR: index out of range in list typefloat\n");
        exit(1);
    }
    if (index == 0){
        return &indexer->val;
    }
    for (int i = 0; i < index; i++){
        if (indexer->terminator == 1){
            printf("LIST INDEX ERROR: index out of range in list typefloat\n");
            exit(1);
        }
        indexer = indexer->next;
    }
    return &indexer->val;
}
void appendfloatList(floatList* input, float new_val) {

    floatList* indexer = input;
    if (indexer->initialized == 0){
        indexer->val = new_val;
        indexer->initialized = 1;
        return;
    }
    while (indexer->terminator == 0){
        indexer = indexer->next;
    }
    indexer->next = (floatList*)malloc(sizeof(floatList));
    indexer->terminator = 0;
    indexer = indexer->next;
    indexer->val = new_val;
    indexer->terminator = 1;

}

void insertfloatList(floatList* input, float new_val, int index) {

    floatList* indexer = input;
    if (indexer->initialized == 0){
        if (index != 0){
            printf("LIST INSERT ERROR: index out of range in list type float\n");
            exit(1);
        }
        indexer->val = new_val;
        indexer->initialized = 1;
        indexer->terminator = 1;
        return;
    }
    int count = 0;
    while (indexer->terminator == 0){
        if (count == index){
            break;
        }
        indexer = indexer->next;
        count++;
    }
    if (count != index){
        printf("LIST INSERT ERROR: index out of range in list type float\n");
        exit(1);
    }
    floatList* temp = (floatList*)malloc(sizeof(floatList));
    temp->next = indexer->next;
    temp->terminator = indexer->terminator;
    temp->val = indexer->val;
    indexer->next = temp;
    indexer->terminator = 0;
    indexer->val = new_val;
    indexer->initialized = 1;

}

void removefloatList(floatList* input, int index) {

    floatList* indexer = input;
    floatList* temp;
    if (indexer->initialized == 0){
        printf("LIST REMOVE ERROR: index out of range in list typefloat\n");
        exit(1);
    }
    if (index == 0){
        if (indexer->terminator == 1){
            indexer->initialized = 0;
            return;
        }
        temp = indexer->next;
        indexer->next = temp->next;
        indexer->terminator = temp->terminator;
        indexer->val = temp->val;
        free(temp);
        return;
    }
    int count = 1;
    while (indexer->terminator == 0){
        if (count == index){
            break;
        }
        indexer = indexer->next;
        count++;
    }
    if (count != index){
        printf("LIST REMOVE ERROR: index out of range in list typefloat\n");
        exit(1);
    }
    temp = indexer->next->next;
    free(indexer->next);
    indexer->next = temp;

}

int lenfloatList(floatList* input) {

    floatList* indexer = input;
    if (indexer->initialized == 0){
        return 0;
    }
    int count = 1;
    while (indexer->terminator == 0){
        indexer = indexer->next;
        count++;
    }
    return count;

}
float popfloatList(floatList* input) {

    floatList* indexer = input;
    if(indexer->terminator == 1){
        return indexer->val;
    }
    while (indexer->next->terminator == 0){
        indexer = indexer->next;
    }
    float out_val = indexer->next->val;
    free(indexer->next);
    indexer->terminator = 1;
    return out_val;

}

struct doubleArray {
    int initialized;
    int ndims;
    int* dims;
    double* raw;
}; 

struct doubleList {

    double val;
    int terminator;
    int initialized;
    struct doubleList* next;
};
double* indexdoubleList(doubleList* input, int index) {

    doubleList* indexer = input;
    if (indexer->initialized == 0){
        printf("LIST INDEX ERROR: index out of range in list typedouble\n");
        exit(1);
    }
    if (index == 0){
        return &indexer->val;
    }
    for (int i = 0; i < index; i++){
        if (indexer->terminator == 1){
            printf("LIST INDEX ERROR: index out of range in list typedouble\n");
            exit(1);
        }
        indexer = indexer->next;
    }
    return &indexer->val;
}
void appenddoubleList(doubleList* input, double new_val) {

    doubleList* indexer = input;
    if (indexer->initialized == 0){
        indexer->val = new_val;
        indexer->initialized = 1;
        return;
    }
    while (indexer->terminator == 0){
        indexer = indexer->next;
    }
    indexer->next = (doubleList*)malloc(sizeof(doubleList));
    indexer->terminator = 0;
    indexer = indexer->next;
    indexer->val = new_val;
    indexer->terminator = 1;

}

void insertdoubleList(doubleList* input, double new_val, int index) {

    doubleList* indexer = input;
    if (indexer->initialized == 0){
        if (index != 0){
            printf("LIST INSERT ERROR: index out of range in list type double\n");
            exit(1);
        }
        indexer->val = new_val;
        indexer->initialized = 1;
        indexer->terminator = 1;
        return;
    }
    int count = 0;
    while (indexer->terminator == 0){
        if (count == index){
            break;
        }
        indexer = indexer->next;
        count++;
    }
    if (count != index){
        printf("LIST INSERT ERROR: index out of range in list type double\n");
        exit(1);
    }
    doubleList* temp = (doubleList*)malloc(sizeof(doubleList));
    temp->next = indexer->next;
    temp->terminator = indexer->terminator;
    temp->val = indexer->val;
    indexer->next = temp;
    indexer->terminator = 0;
    indexer->val = new_val;
    indexer->initialized = 1;

}

void removedoubleList(doubleList* input, int index) {

    doubleList* indexer = input;
    doubleList* temp;
    if (indexer->initialized == 0){
        printf("LIST REMOVE ERROR: index out of range in list typedouble\n");
        exit(1);
    }
    if (index == 0){
        if (indexer->terminator == 1){
            indexer->initialized = 0;
            return;
        }
        temp = indexer->next;
        indexer->next = temp->next;
        indexer->terminator = temp->terminator;
        indexer->val = temp->val;
        free(temp);
        return;
    }
    int count = 1;
    while (indexer->terminator == 0){
        if (count == index){
            break;
        }
        indexer = indexer->next;
        count++;
    }
    if (count != index){
        printf("LIST REMOVE ERROR: index out of range in list typedouble\n");
        exit(1);
    }
    temp = indexer->next->next;
    free(indexer->next);
    indexer->next = temp;

}

int lendoubleList(doubleList* input) {

    doubleList* indexer = input;
    if (indexer->initialized == 0){
        return 0;
    }
    int count = 1;
    while (indexer->terminator == 0){
        indexer = indexer->next;
        count++;
    }
    return count;

}
double popdoubleList(doubleList* input) {

    doubleList* indexer = input;
    if(indexer->terminator == 1){
        return indexer->val;
    }
    while (indexer->next->terminator == 0){
        indexer = indexer->next;
    }
    double out_val = indexer->next->val;
    free(indexer->next);
    indexer->terminator = 1;
    return out_val;

}

struct doublecomplexArray {
    int initialized;
    int ndims;
    int* dims;
    double complex* raw;
}; 

struct doublecomplexList {

    double complex val;
    int terminator;
    int initialized;
    struct doublecomplexList* next;
};
double complex* indexdoublecomplexList(doublecomplexList* input, int index) {

    doublecomplexList* indexer = input;
    if (indexer->initialized == 0){
        printf("LIST INDEX ERROR: index out of range in list typedoublecomplex\n");
        exit(1);
    }
    if (index == 0){
        return &indexer->val;
    }
    for (int i = 0; i < index; i++){
        if (indexer->terminator == 1){
            printf("LIST INDEX ERROR: index out of range in list typedoublecomplex\n");
            exit(1);
        }
        indexer = indexer->next;
    }
    return &indexer->val;
}
void appenddoublecomplexList(doublecomplexList* input, double complex new_val) {

    doublecomplexList* indexer = input;
    if (indexer->initialized == 0){
        indexer->val = new_val;
        indexer->initialized = 1;
        return;
    }
    while (indexer->terminator == 0){
        indexer = indexer->next;
    }
    indexer->next = (doublecomplexList*)malloc(sizeof(doublecomplexList));
    indexer->terminator = 0;
    indexer = indexer->next;
    indexer->val = new_val;
    indexer->terminator = 1;

}

void insertdoublecomplexList(doublecomplexList* input, double complex new_val, int index) {

    doublecomplexList* indexer = input;
    if (indexer->initialized == 0){
        if (index != 0){
            printf("LIST INSERT ERROR: index out of range in list type doublecomplex\n");
            exit(1);
        }
        indexer->val = new_val;
        indexer->initialized = 1;
        indexer->terminator = 1;
        return;
    }
    int count = 0;
    while (indexer->terminator == 0){
        if (count == index){
            break;
        }
        indexer = indexer->next;
        count++;
    }
    if (count != index){
        printf("LIST INSERT ERROR: index out of range in list type doublecomplex\n");
        exit(1);
    }
    doublecomplexList* temp = (doublecomplexList*)malloc(sizeof(doublecomplexList));
    temp->next = indexer->next;
    temp->terminator = indexer->terminator;
    temp->val = indexer->val;
    indexer->next = temp;
    indexer->terminator = 0;
    indexer->val = new_val;
    indexer->initialized = 1;

}

void removedoublecomplexList(doublecomplexList* input, int index) {

    doublecomplexList* indexer = input;
    doublecomplexList* temp;
    if (indexer->initialized == 0){
        printf("LIST REMOVE ERROR: index out of range in list typedoublecomplex\n");
        exit(1);
    }
    if (index == 0){
        if (indexer->terminator == 1){
            indexer->initialized = 0;
            return;
        }
        temp = indexer->next;
        indexer->next = temp->next;
        indexer->terminator = temp->terminator;
        indexer->val = temp->val;
        free(temp);
        return;
    }
    int count = 1;
    while (indexer->terminator == 0){
        if (count == index){
            break;
        }
        indexer = indexer->next;
        count++;
    }
    if (count != index){
        printf("LIST REMOVE ERROR: index out of range in list typedoublecomplex\n");
        exit(1);
    }
    temp = indexer->next->next;
    free(indexer->next);
    indexer->next = temp;

}

int lendoublecomplexList(doublecomplexList* input) {

    doublecomplexList* indexer = input;
    if (indexer->initialized == 0){
        return 0;
    }
    int count = 1;
    while (indexer->terminator == 0){
        indexer = indexer->next;
        count++;
    }
    return count;

}
double complex popdoublecomplexList(doublecomplexList* input) {

    doublecomplexList* indexer = input;
    if(indexer->terminator == 1){
        return indexer->val;
    }
    while (indexer->next->terminator == 0){
        indexer = indexer->next;
    }
    double complex out_val = indexer->next->val;
    free(indexer->next);
    indexer->terminator = 1;
    return out_val;

}

struct floatcomplexArray {
    int initialized;
    int ndims;
    int* dims;
    float complex* raw;
}; 

struct floatcomplexList {

    float complex val;
    int terminator;
    int initialized;
    struct floatcomplexList* next;
};
float complex* indexfloatcomplexList(floatcomplexList* input, int index) {

    floatcomplexList* indexer = input;
    if (indexer->initialized == 0){
        printf("LIST INDEX ERROR: index out of range in list typefloatcomplex\n");
        exit(1);
    }
    if (index == 0){
        return &indexer->val;
    }
    for (int i = 0; i < index; i++){
        if (indexer->terminator == 1){
            printf("LIST INDEX ERROR: index out of range in list typefloatcomplex\n");
            exit(1);
        }
        indexer = indexer->next;
    }
    return &indexer->val;
}
void appendfloatcomplexList(floatcomplexList* input, float complex new_val) {

    floatcomplexList* indexer = input;
    if (indexer->initialized == 0){
        indexer->val = new_val;
        indexer->initialized = 1;
        return;
    }
    while (indexer->terminator == 0){
        indexer = indexer->next;
    }
    indexer->next = (floatcomplexList*)malloc(sizeof(floatcomplexList));
    indexer->terminator = 0;
    indexer = indexer->next;
    indexer->val = new_val;
    indexer->terminator = 1;

}

void insertfloatcomplexList(floatcomplexList* input, float complex new_val, int index) {

    floatcomplexList* indexer = input;
    if (indexer->initialized == 0){
        if (index != 0){
            printf("LIST INSERT ERROR: index out of range in list type floatcomplex\n");
            exit(1);
        }
        indexer->val = new_val;
        indexer->initialized = 1;
        indexer->terminator = 1;
        return;
    }
    int count = 0;
    while (indexer->terminator == 0){
        if (count == index){
            break;
        }
        indexer = indexer->next;
        count++;
    }
    if (count != index){
        printf("LIST INSERT ERROR: index out of range in list type floatcomplex\n");
        exit(1);
    }
    floatcomplexList* temp = (floatcomplexList*)malloc(sizeof(floatcomplexList));
    temp->next = indexer->next;
    temp->terminator = indexer->terminator;
    temp->val = indexer->val;
    indexer->next = temp;
    indexer->terminator = 0;
    indexer->val = new_val;
    indexer->initialized = 1;

}

void removefloatcomplexList(floatcomplexList* input, int index) {

    floatcomplexList* indexer = input;
    floatcomplexList* temp;
    if (indexer->initialized == 0){
        printf("LIST REMOVE ERROR: index out of range in list typefloatcomplex\n");
        exit(1);
    }
    if (index == 0){
        if (indexer->terminator == 1){
            indexer->initialized = 0;
            return;
        }
        temp = indexer->next;
        indexer->next = temp->next;
        indexer->terminator = temp->terminator;
        indexer->val = temp->val;
        free(temp);
        return;
    }
    int count = 1;
    while (indexer->terminator == 0){
        if (count == index){
            break;
        }
        indexer = indexer->next;
        count++;
    }
    if (count != index){
        printf("LIST REMOVE ERROR: index out of range in list typefloatcomplex\n");
        exit(1);
    }
    temp = indexer->next->next;
    free(indexer->next);
    indexer->next = temp;

}

int lenfloatcomplexList(floatcomplexList* input) {

    floatcomplexList* indexer = input;
    if (indexer->initialized == 0){
        return 0;
    }
    int count = 1;
    while (indexer->terminator == 0){
        indexer = indexer->next;
        count++;
    }
    return count;

}
float complex popfloatcomplexList(floatcomplexList* input) {

    floatcomplexList* indexer = input;
    if(indexer->terminator == 1){
        return indexer->val;
    }
    while (indexer->next->terminator == 0){
        indexer = indexer->next;
    }
    float complex out_val = indexer->next->val;
    free(indexer->next);
    indexer->terminator = 1;
    return out_val;

}

struct intArray {
    int initialized;
    int ndims;
    int* dims;
    int* raw;
}; 

struct intList {

    int val;
    int terminator;
    int initialized;
    struct intList* next;
};
int* indexintList(intList* input, int index) {

    intList* indexer = input;
    if (indexer->initialized == 0){
        printf("LIST INDEX ERROR: index out of range in list typeint\n");
        exit(1);
    }
    if (index == 0){
        return &indexer->val;
    }
    for (int i = 0; i < index; i++){
        if (indexer->terminator == 1){
            printf("LIST INDEX ERROR: index out of range in list typeint\n");
            exit(1);
        }
        indexer = indexer->next;
    }
    return &indexer->val;
}
void appendintList(intList* input, int new_val) {

    intList* indexer = input;
    if (indexer->initialized == 0){
        indexer->val = new_val;
        indexer->initialized = 1;
        return;
    }
    while (indexer->terminator == 0){
        indexer = indexer->next;
    }
    indexer->next = (intList*)malloc(sizeof(intList));
    indexer->terminator = 0;
    indexer = indexer->next;
    indexer->val = new_val;
    indexer->terminator = 1;

}

void insertintList(intList* input, int new_val, int index) {

    intList* indexer = input;
    if (indexer->initialized == 0){
        if (index != 0){
            printf("LIST INSERT ERROR: index out of range in list type int\n");
            exit(1);
        }
        indexer->val = new_val;
        indexer->initialized = 1;
        indexer->terminator = 1;
        return;
    }
    int count = 0;
    while (indexer->terminator == 0){
        if (count == index){
            break;
        }
        indexer = indexer->next;
        count++;
    }
    if (count != index){
        printf("LIST INSERT ERROR: index out of range in list type int\n");
        exit(1);
    }
    intList* temp = (intList*)malloc(sizeof(intList));
    temp->next = indexer->next;
    temp->terminator = indexer->terminator;
    temp->val = indexer->val;
    indexer->next = temp;
    indexer->terminator = 0;
    indexer->val = new_val;
    indexer->initialized = 1;

}

void removeintList(intList* input, int index) {

    intList* indexer = input;
    intList* temp;
    if (indexer->initialized == 0){
        printf("LIST REMOVE ERROR: index out of range in list typeint\n");
        exit(1);
    }
    if (index == 0){
        if (indexer->terminator == 1){
            indexer->initialized = 0;
            return;
        }
        temp = indexer->next;
        indexer->next = temp->next;
        indexer->terminator = temp->terminator;
        indexer->val = temp->val;
        free(temp);
        return;
    }
    int count = 1;
    while (indexer->terminator == 0){
        if (count == index){
            break;
        }
        indexer = indexer->next;
        count++;
    }
    if (count != index){
        printf("LIST REMOVE ERROR: index out of range in list typeint\n");
        exit(1);
    }
    temp = indexer->next->next;
    free(indexer->next);
    indexer->next = temp;

}

int lenintList(intList* input) {

    intList* indexer = input;
    if (indexer->initialized == 0){
        return 0;
    }
    int count = 1;
    while (indexer->terminator == 0){
        indexer = indexer->next;
        count++;
    }
    return count;

}
int popintList(intList* input) {

    intList* indexer = input;
    if(indexer->terminator == 1){
        return indexer->val;
    }
    while (indexer->next->terminator == 0){
        indexer = indexer->next;
    }
    int out_val = indexer->next->val;
    free(indexer->next);
    indexer->terminator = 1;
    return out_val;

}

struct voidArray {
    int initialized;
    int ndims;
    int* dims;
    void* raw;
}; 
struct Mothmath{


};
float OBJECT_math_Mothacosf(float inp){

return acosf(inp);

}

double OBJECT_math_Mothacos(double inp){

return acos(inp);

}

float OBJECT_math_Mothasinf(float inp){

return asinf(inp);

}

double OBJECT_math_Mothasin(double inp){

return asin(inp);

}

float OBJECT_math_Mothatanf(float inp){

return atanf(inp);

}

double OBJECT_math_Mothatan(double inp){

return atan(inp);

}

float OBJECT_math_Mothatan2f(float inp1,float inp2){

return atan2f(inp1,inp2);

}

double OBJECT_math_Mothatan2(double inp1,double inp2){

return atan2(inp1,inp2);

}

float OBJECT_math_Mothcosf(float inp){

return cosf(inp);

}

double OBJECT_math_Mothcos(double inp){

return cos(inp);

}

float OBJECT_math_Mothcoshf(float inp){

return coshf(inp);

}

double OBJECT_math_Mothcosh(double inp){

return cosh(inp);

}

float OBJECT_math_Mothsinf(float inp){

return sinf(inp);

}

double OBJECT_math_Mothsin(double inp){

return sin(inp);

}

float OBJECT_math_Mothsinhf(float inp){

return sinhf(inp);

}

double OBJECT_math_Mothsinh(double inp){

return sinh(inp);

}

float OBJECT_math_Mothtanhf(float inp){

return tanhf(inp);

}

double OBJECT_math_Mothtanh(double inp){

return tanh(inp);

}

float OBJECT_math_Mothexpf(float inp){

return expf(inp);

}

double OBJECT_math_Mothexp(double inp){

return exp(inp);

}

float OBJECT_math_Mothlogf(float inp){

return logf(inp);

}

double OBJECT_math_Mothlog(double inp){

return log(inp);

}

float OBJECT_math_Mothlog10f(float inp){

return log10f(inp);

}

double OBJECT_math_Mothlog10(double inp){

return log10(inp);

}

float OBJECT_math_Mothpowf(float inp1,float inp2){

return powf(inp1,inp2);

}

double OBJECT_math_Mothpow(double inp1,double inp2){

return pow(inp1,inp2);

}

float OBJECT_math_Mothfabsf(float inp){

return fabsf(inp);

}

double OBJECT_math_Mothfabs(double inp){

return fabs(inp);

}

float OBJECT_math_Mothfmodf(float inp1,float inp2){

return fmodf(inp1,inp2);

}

double OBJECT_math_Mothfmod(double inp1,double inp2){

return fmod(inp1,inp2);

}

float OBJECT_math_Mothsqrtf(float inp){

return sqrtf(inp);

}

double OBJECT_math_Mothsqrt(double inp){

return sqrt(inp);

}

float OBJECT_math_Mothceilf(float inp){

return ceilf(inp);

}

double OBJECT_math_Mothceil(double inp){

return ceil(inp);

}

float OBJECT_math_Mothfloorf(float inp){

return floorf(inp);

}

double OBJECT_math_Mothfloor(double inp){

return floor(inp);

}

struct Mothcomplex{


};
double complex OBJECT_complex_Mothcmplx(double real,double imag){

return CMPLX(real,imag);

}

float complex OBJECT_complex_Mothcmplxf(float real,float imag){

return CMPLXF(real,imag);

}

double OBJECT_complex_Mothreal(double complex inp){

return creal(inp);

}

float OBJECT_complex_Mothrealf(float complex inp){

return crealf(inp);

}

double OBJECT_complex_Mothimag(double complex inp){

return cimag(inp);

}

float OBJECT_complex_Mothimagf(float complex inp){

return cimagf(inp);

}

double OBJECT_complex_Mothabs(double complex inp){

return cabs(inp);

}

float OBJECT_complex_Mothabsf(float complex inp){

return cabsf(inp);

}

double OBJECT_complex_Motharg(double complex inp){

return carg(inp);

}

float OBJECT_complex_Mothargf(float complex inp){

return cargf(inp);

}

double complex OBJECT_complex_Mothconj(double complex inp){

return conj(inp);

}

float complex OBJECT_complex_Mothconjf(float complex inp){

return conjf(inp);

}

double complex OBJECT_complex_Mothproj(double complex inp){

return cproj(inp);

}

float complex OBJECT_complex_Mothprojf(float complex inp){

return cprojf(inp);

}

int Mothmain(){

printf("%lf",OBJECT_math_Mothfloor(1.03));
return 0;

}

int main() { return Mothmain();}
