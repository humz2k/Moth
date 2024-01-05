#include "int_list.h"
#include <stdlib.h>
#include <stdio.h>
#include "error.h"
#include <assert.h>

int test_list(void){

    int_list my_int_list = make_int_list();

    TEST_TRUE(len_int_list(my_int_list) == 0);

    TEST_TRUE(append_int_list(my_int_list,0));

    TEST_TRUE(len_int_list(my_int_list) == 1);

    TEST_TRUE(get_int_list(my_int_list,0) == 0);

    TEST_TRUE(pop_int_list(my_int_list) == 0);

    TEST_TRUE(len_int_list(my_int_list) == 0);

    int correct_len = 1;
    int correct_get = 1;

    for (int i = 0; i < 50; i++){
        append_int_list(my_int_list,i);
        correct_len = correct_len && (len_int_list(my_int_list) == (i + 1));
        correct_get = correct_get && (get_int_list(my_int_list,i) == i);
    }

    TEST_TRUE(correct_len);
    TEST_TRUE(correct_get);

    TEST_TRUE(pop_idx_int_list(my_int_list,10) == 10);
    TEST_TRUE(len_int_list(my_int_list) == 49);

    correct_get = 1;

    for (int i = 10; i < 49; i++){
        correct_get = correct_get && (get_int_list(my_int_list,i) == (i + 1));
    }

    TEST_TRUE(correct_get);

    for (int i = 0; i < 49; i++){
        pop_int_list(my_int_list);
    }

    TEST_TRUE(len_int_list(my_int_list) == 0);

    for (int i = 0; i < 40; i++){
        append_int_list(my_int_list,i);
    }

    int_list new_int_list = copy_int_list(my_int_list);

    correct_get = 1;

    for (int i = 0; i < 40; i++){
        correct_get = correct_get && (get_int_list(new_int_list,i) == get_int_list(my_int_list,i)) && (get_int_list(my_int_list,i) == i);
    }

    TEST_TRUE(correct_get);

    int correct_pop = 1;

    for (int i = 0; i < 20; i++){
        correct_pop = correct_pop && (pop_int_list(my_int_list) == (40 - 1) - i);
    }

    TEST_TRUE(correct_pop);

    TEST_TRUE(len_int_list(my_int_list) == 20);
    TEST_TRUE(len_int_list(new_int_list) == 40);

    correct_get = 1;

    for (int i = 0; i < 40; i++){
        correct_get = correct_get && (get_int_list(new_int_list,i) == i);
    }

    TEST_TRUE(correct_get);
}