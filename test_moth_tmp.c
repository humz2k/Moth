#include <mpi.h>

#include <stdlib.h>
#include <stdio.h>
#include <math.h>

struct voidArray {
    int initialized;
    int ndims;
    int* dims;
    void* raw;
};
        
struct intArray {
    int initialized;
    int ndims;
    int* dims;
    int* raw;
};
        
struct charArray {
    int initialized;
    int ndims;
    int* dims;
    char* raw;
};
        struct Mothmpi_comm{
MPI_Comm raw_comm;

};
void OBJECT_mpi_comm_Moth__init__(struct Mothmpi_comm* self,MPI_Comm w_comm){

self->raw_comm = w_comm;

}

struct Mothmpi{


};
void OBJECT_mpi_Mothinit(struct intArray* argc,struct charArray* argv){

MPI_Init(NULL,NULL);

}

int OBJECT_mpi_Mothcomm_size(struct Mothmpi_comm* w_comm){
int world_size;
world_size = 0;
MPI_Comm_size(w_comm->raw_comm,&world_size);
return world_size;

}

void OBJECT_mpi_Mothfinalize(){

MPI_Finalize();

}

int Mothmain(){

return 0;

}

int main() { return Mothmain();}
