#include "lists_llvm.h"
#include "moth_llvm.h"

struct moth_llvm_field{
    MOTH_TYPE type;
    char* name;
};

struct moth_structure_descriptor{
    char* name;
    MOTH_FIELD_list fields;
};

struct moth_llvm_type{
    enum type_type t;
    char* moth_file;
    MOTH_STRUCTURE struct_descriptor;
    MOTH_TYPE base;
    MOTH_TYPE specialize;
    int ndims;
};