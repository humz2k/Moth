#include <stdlib.h>
#include <stdio.h>
#include <mpi.h>

void* mpi_comm_world;

void* mpi_int;
void* mpi_char;
void* mpi_byte;
void* mpi_long;
void* mpi_float;
void* mpi_double;
void* mpi_half;
void* mpi_bool;

void* mpi_max;
void* mpi_min;
void* mpi_sum;
void* mpi_prod;
void* mpi_land;
void* mpi_band;
void* mpi_lor;
void* mpi_bor;
void* mpi_lxor;
void* mpi_bxor;
void* mpi_minloc;
void* mpi_maxloc;
void* mpi_replace;
void* mpi_no_op;

int __init_mpi(void* a,void* b){
    int out = MPI_Init(a,b);
    mpi_comm_world = MPI_COMM_WORLD;
    
    mpi_int = MPI_INT32_T;
    mpi_char = MPI_INT8_T;
    mpi_byte = MPI_BYTE;
    mpi_long = MPI_INT64_T;
    mpi_float = MPI_FLOAT;
    mpi_double = MPI_DOUBLE;
    mpi_half = MPI_INT16_T;
    mpi_bool = MPI_C_BOOL;

    mpi_max = MPI_MAX;
    mpi_min = MPI_MIN;
    mpi_prod = MPI_PROD;
    mpi_land = MPI_LAND;
    mpi_band = MPI_BAND;
    mpi_lor = MPI_LOR;
    mpi_bor = MPI_BOR;
    mpi_lxor = MPI_LXOR;
    mpi_bxor = MPI_BXOR;
    mpi_minloc = MPI_MINLOC;
    mpi_maxloc = MPI_MAXLOC;
    mpi_replace = MPI_REPLACE;
    mpi_no_op = MPI_NO_OP;
    return out;

}