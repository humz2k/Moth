#include <llvm-c/Core.h>
#include <llvm-c/ExecutionEngine.h>
#include <llvm-c/Target.h>
#include <llvm-c/Analysis.h>
#include <llvm-c/BitWriter.h>

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "error.h"
#include <assert.h>
//#include "tables_llvm.h"
//#include "lists_llvm.h"
#include "simple_alloc.h"
#include "moth_llvm.h"

static LLVMModuleRef mod = NULL;
static LLVMBuilderRef builder = NULL;
static int _in_function = 0;

struct moth_llvm_value{
    VALUE_TYPE t;
    MOTH_TYPE type;
    LLVMValueRef value;
    enum scope_t scope;
    int modifiable;
    const char* moth_file;
    MOTH_VALUE_table table;
};

struct moth_llvm_field{
    MOTH_TYPE type;
    char* name;
};

struct moth_structure_descriptor{
    char* name;
    MOTH_FIELD_list fields;
};

struct moth_func_descriptor{
    int named;
    char* name;
    MOTH_VALUE ret_type;
    MOTH_VALUE_list inputs;
    MODIFIERS mods;
};

struct moth_llvm_type{
    enum type_type t;
    const char* moth_file;
    const char* id;
    MOTH_STRUCTURE struct_descriptor;
    MOTH_TYPE base;
    MOTH_TYPE specialize;
    int ndims;
    MOTH_FUNC_TYPE func_ty;
};

static int type_type_is_base(enum type_type t){
    switch (t){
        case TY_TEMPLATE:
            return 0;
        case TY_USER:
            return 0;
        case TY_REF:
            return 0;
        case TY_ARRAY:
            return 0;
        case TY_FUNC:
            return 0;
        case TY_MOTH_FILE:
            return 0;
        default:
            return 1;
    }
}

static MOTH_TYPE alloc_type(void){
    MOTH_TYPE out;
    VERIFY_ALLOC(out = alloc_struct_ptr(struct moth_llvm_type));
    return out;
}

#define check_val(val) { assert(val != NULL); assert((val->modifiable == 0) || (val->modifiable == 1)); }

static MOTH_VALUE make_moth_value(void){
    MOTH_VALUE out;
    VERIFY_ALLOC(out = alloc_struct_ptr(struct moth_llvm_value));
    return out;
}

MOTH_VALUE make_moth_file(const char* name){
    MOTH_VALUE out;
    VERIFY_ALLOC(out = alloc_struct_ptr(struct moth_llvm_value));
    out->t = MOTH_FILE;
    out->type = NULL;
    out->modifiable = 0;
    out->value = NULL;
    out->scope = FILE_SCOPE;
    out->moth_file = name;
    out->table = make_MOTH_VALUE_table();
    return out;
}

MOTH_VALUE_table get_table(MOTH_VALUE moth_file){
    assert(moth_file->t == MOTH_FILE);
    assert(moth_file->table != NULL);
    return moth_file->table;
}

int update_moth_file(MOTH_VALUE moth_file, const char* name, MOTH_VALUE value){
    return update_MOTH_VALUE_table(get_table(moth_file),name,value);
}

int find_in_moth_file(MOTH_VALUE moth_file, const char* name, MOTH_VALUE* out){
    return get_MOTH_VALUE_table(get_table(moth_file),name,out);
}

const char* get_moth_file_name(MOTH_VALUE moth_file){
    assert(moth_file->t == MOTH_FILE);
    return moth_file->moth_file;
}

int clear_module(void){
    LLVMDisposeModule(mod);
    mod = NULL;
    return 1;
}

int initialize_module(void){
    assert(mod == NULL);
    mod = LLVMModuleCreateWithName(get_active_moth_file_name());
    return 1;
}

void print_module(void){
    assert(mod != NULL);
    char *moduleStr = LLVMPrintModuleToString(mod);
    printf("%s\n", moduleStr);
    LLVMDisposeMessage(moduleStr);
}

int in_function(void){
    assert((_in_function == 0) || (_in_function == 1));
    return _in_function;
}

VALUE_TYPE get_type_of_value(MOTH_VALUE val){
    check_val(val);
    return val->t;
}

MOTH_TYPE val_to_type(MOTH_VALUE val){
    check_val(val);
    assert(val->type != NULL);
    assert(val->t == TYPE);
    return val->type;
}

MOTH_VALUE type_to_val(MOTH_TYPE typ){
    assert(typ != NULL);
    MOTH_VALUE out = make_moth_value();
    out->t = TYPE;
    out->moth_file = typ->moth_file;
    out->modifiable = 0;
    out->type = typ;
    return out;
}

MOTH_VALUE type_node_to_type(NODE node){
    assert(node != NULL);
    assert(node->t == TYPE_NODE);
    enum type_type t = node->data.type_data.t;
    if (type_type_is_base(t)){
        MOTH_TYPE type = alloc_type();
        type->t = t;
        type->moth_file = node->moth_file;
        return type_to_val(type);
    }
    if (t == TY_USER){
        MOTH_VALUE out;
        if (find_value(node->data.type_data.id,&out)){
            assert(out->t == TYPE);
            assert(strcmp(out->moth_file,node->moth_file) == 0);
            assert(out->type != NULL);
            return out;
        }
        RUNTIME_ERROR("Couldn't find type %s",node->data.type_data.id);
    }

    if (t == TY_REF){
        MOTH_VALUE out;
        out = eval(node->data.type_data.ref);
        assert(out->t == TYPE);
        assert(out->type != NULL);
        return out;
    }

    if (t == TY_ARRAY){
        MOTH_TYPE type = alloc_type();
        type->t = t;
        type->moth_file = node->moth_file;
        type->ndims = node->data.type_data.ndims;
        type->base = val_to_type(type_node_to_type(type->base));
        return type_to_val(type);
    }

    if (t == TY_TEMPLATE)NOT_IMPLEMENTED;

    PANIC("Something really bad happened");

}

MOTH_VALUE make_function_type(const char* name, MOTH_VALUE ret_type, MOTH_VALUE_list inputs, MODIFIERS mods){
    MOTH_FUNC_TYPE func_ty;
    VERIFY_ALLOC(func_ty = alloc_struct_ptr(struct moth_func_descriptor));
    func_ty->inputs = inputs;
    func_ty->mods = mods;
    func_ty->name = name;
    func_ty->named = 1;
    func_ty->ret_type = ret_type;
    MOTH_TYPE type = alloc_type();
    type->t = TY_FUNC;
    type->moth_file = get_active_moth_file_name();
    type->func_ty = func_ty;
    MOTH_VALUE out = type_to_val(type);
    update_value_in_current_moth_file(name,out);
    return out;
}

static LLVMTypeRef moth_type_to_llvm_type(MOTH_TYPE moth_type){
    assert(moth_type != NULL);
    if (type_type_is_base(moth_type->t)){
        switch(moth_type->t){
            case TY_I1:
                return LLVMInt1Type();
            case TY_I8:
                return LLVMInt8Type();
            case TY_I16:
                return LLVMInt16Type();
            case TY_I32:
                return LLVMInt32Type();
            case TY_I64:
                return LLVMInt64Type();
            case TY_F16:
                return LLVMHalfType();
            case TY_F32:
                return LLVMFloatType();
            case TY_F64:
                return LLVMDoubleType();
            case TY_STR:
                return LLVMPointerType(LLVMInt8Type(),0);
            case TY_VOID:
                return LLVMVoidType();
            default:
                PANIC("SOMETHING BAD HAPPENED");
        }
    }

    if (moth_type->t == TY_FUNC){
        MOTH_FUNC_TYPE func_ty = moth_type->func_ty;
        LLVMTypeRef ret_type = moth_type_to_llvm_type(func_ty->ret_type);
        int n_inputs = len_MOTH_VALUE_list(func_ty->inputs);
        LLVMTypeRef param_types[n_inputs];
        for (int i = 0; i < n_inputs; i++){
            param_types[i] = moth_type_to_llvm_type(get_MOTH_VALUE_list(func_ty->inputs,i));
        }
        LLVMTypeRef out = LLVMFunctionType(ret_type,param_types,n_inputs,0);
        return out;
    }

    NOT_IMPLEMENTED;
}

static LLVMTypeRef _initialize_function(MOTH_TYPE func_ty){
    assert(func_ty != NULL);
    assert(func_ty->t == TY_FUNC);

    LLVMTypeRef out = moth_type_to_llvm_type(func_ty);

    return out;
}

int initialize_function_declaration(MOTH_VALUE func_ty){
    assert(func_ty != NULL);
    assert(func_ty->t == TYPE);
    assert(func_ty->type != NULL);
    return (_initialize_function(func_ty->type) != NULL);
}

static const char* type_to_string(MOTH_VALUE type){
    assert(type->t == TYPE);
    switch(type->t){
        case TY_I1:
            return "i1";
        case TY_I8:
            return "i8";
        case TY_I16:
            return "i16";
        case TY_I32:
            return "i32";
        case TY_I64:
            return "i64";
        case TY_F16:
            return "f16";
        case TY_F32:
            return "f32";
        case TY_F64:
            return "f64";
        case TY_STR:
            return "str";
        case TY_VOID:
            return "void";
        default:
            NOT_IMPLEMENTED;
    }
}

static const char* mangle_function_name(const char* name, MOTH_VALUE_list inputs){

    int n_inputs = len_MOTH_VALUE_list(inputs);

    int len = strlen(name) + 2;

    const char* strings[n_inputs];
    for (int i = 0; i < n_inputs; i++){
        strings[i] = type_to_string(get_MOTH_VALUE_list(inputs,i));
        len += strlen(strings[i]) + 1;
    }

    char* out = GC_MALLOC(sizeof(char) * len);

    strcpy(out,name);

    strcat(out,"_");

    for (int i = 0; i < n_inputs; i++){
        strcat(out,strings[i]);
        strcat(out,"_");
    }

    return out;
}

int initialize_function_definition(MOTH_VALUE func_ty){
    assert(func_ty != NULL);
    assert(func_ty->t == TYPE);
    assert(func_ty->type != NULL);
    assert(in_function() == 0);
    assert(builder == NULL);
    LLVMTypeRef llvm_func_ty = _initialize_function(func_ty);
    return 1;
}

/*
LLVMValueRef get_llvm_value_of_value(MOTH_VALUE val){
    check_val(val);
    return val->value;
}

enum scope_t get_scope_of_value(MOTH_VALUE val){
    check_val(val);
    return val->scope;
}

int value_is_local_scope(MOTH_VALUE val){
    return get_scope_of_value(val) == LOCAL_SCOPE;
}

int value_is_file_scope(MOTH_VALUE val){
    return get_scope_of_value(val) == FILE_SCOPE;
}

int value_is_modifiable(MOTH_VALUE val){
    check_val(val);
    return val->modifiable;
}*/
