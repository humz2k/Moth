#include "ast.h"

NODE make_ref_base(char* left, char* right){
    NODE out = make_ast_node();
    out->t = REFERENCE_NODE;
    out->data.reference_data.left = left;
    out->data.reference_data.right = right;
    out->data.reference_data.ref_base = 1;
    return out;
}

NODE make_ref_ref(NODE ref, char* right){
    NODE out = make_ast_node();
    out->t = REFERENCE_NODE;
    out->data.reference_data.ref = ref;
    out->data.reference_data.right = right;
    out->data.reference_data.ref_base = 0;
    return out;
}
