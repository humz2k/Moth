#include "moth_llvm.h"
#include <assert.h>

int initialize_backend(void){
    LLVMLinkInMCJIT();
    assert(LLVMInitializeNativeTarget() == 0);
    assert(LLVMInitializeNativeAsmPrinter() == 0);
    return 1;
}