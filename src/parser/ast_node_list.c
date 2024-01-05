#include "parser/ast_node.h"
#include "gc.h"
#include <assert.h>
#include "simple_alloc.h"
#include "error.h"

#define NODES_PER_BLOCK 20

//block of nodes
struct ast_node_vector_block{
    int used;
    NODE nodes[NODES_PER_BLOCK];
    struct ast_node_vector_block* next;
};


//makes empty block
static struct ast_node_vector_block* make_ast_node_vector_block(void){
    struct ast_node_vector_block* out;
    VERIFY_ALLOC(out = alloc_struct_ptr(struct ast_node_vector_block));
    out->next = NULL;
    out->used = 0;
    return out;
}

//makes an empty vector (i.e. just makes an empty block and a poitner to it)
NODE_VEC make_empty_node_vec(void){
    NODE_VEC out;
    out.len = 0;
    out.first = make_ast_node_vector_block();
    return out;
}

NODE_VEC make_node_vec(NODE elem){
    NODE_VEC out = make_empty_node_vec();
    out = append_node_vec(out,elem);
    assert(out.len == 1);
    return out;
}

//adds a node to a block
static void add_node_to_block(struct ast_node_vector_block* blk, NODE elem){

    assert(blk != NULL);
    assert(elem != NULL);
    
    //if we have space in this block
    if (blk->used < NODES_PER_BLOCK){
        blk->nodes[blk->used] = elem;
        blk->used++;
        return;
    }

    //if the next block is allocated already
    if(blk->next){
        add_node_to_block(blk->next,elem);
        return;
    }

    //if the next block is not allocated
    blk->next = make_ast_node_vector_block();
    add_node_to_block(blk->next,elem);
    return;
}

//just calls add_node_to_block on the first block of lst and increments len
NODE_VEC append_node_vec(NODE_VEC lst, NODE elem){
    assert(lst.first != NULL);
    assert(elem != NULL);

    add_node_to_block(lst.first,elem);

    lst.len++;
    return lst;
}

//getter for len
int len_node_vec(NODE_VEC lst){
    return lst.len;
}

//recrusively find the index
static NODE get_node_vec_block_elem(struct ast_node_vector_block* blk, int idx){
    
    assert(blk != NULL);

    assert(idx >= 0);

    if (idx < blk->used){
        return blk->nodes[idx];
    }

    assert(blk->next != NULL);

    return get_node_vec_block_elem(blk->next,idx - NODES_PER_BLOCK);
}

NODE get_node_vec_elem(NODE_VEC lst, int idx){
    assert(idx < lst.len);
    return get_node_vec_block_elem(lst.first,idx);
}
