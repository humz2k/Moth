
#include <mpi.h>



#include <fftw3.h>

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
        
struct doubleArray {
    int initialized;
    int ndims;
    int* dims;
    double* raw;
};
        float Mothsqrtf(float inp){

return sqrtf(inp);

}
struct Mothmpi_datatype{
MPI_Datatype raw_type;

};
void OBJECT_mpi_datatype_Moth__init__(struct Mothmpi_datatype* self){


}

void OBJECT_mpi_datatype_Mothset(struct Mothmpi_datatype* self,MPI_Datatype input){

self->raw_type = input;

}

void OBJECT_mpi_datatype_Moth__free__(struct Mothmpi_datatype* self){


}

struct Mothcomm{
MPI_Comm raw_comm;

};
void OBJECT_comm_Moth__init__(struct Mothcomm* self,MPI_Comm input){

self->raw_comm = input;

}

void OBJECT_comm_Moth__free__(struct Mothcomm* self){


}

struct MothMPI{
struct Mothcomm* comm_world;

};
void OBJECT_MPI_Moth__init__(struct MothMPI* self){
struct voidArray* tmp;
tmp = (struct voidArray*)malloc(sizeof(struct voidArray));
tmp->dims = (int*)malloc(1*sizeof(int));
tmp->dims[0] = 1;
tmp->raw = (void*)malloc(1*sizeof(void));
free(tmp->dims);free(tmp->raw);free(tmp);
self->comm_world = (struct Mothcomm*)malloc(sizeof(struct Mothcomm));OBJECT_comm_Moth__init__(self->comm_world,MPI_COMM_WORLD);

}

void OBJECT_MPI_Mothinit(struct MothMPI* self){

MPI_Init(NULL,NULL);

}

int OBJECT_MPI_Mothcomm_size(struct MothMPI* self,struct Mothcomm* w_comm){
int world_size;
world_size = 0;
MPI_Comm_size(w_comm->raw_comm,&world_size);
return world_size;

}

int OBJECT_MPI_Mothcomm_rank(struct MothMPI* self,struct Mothcomm* w_comm){
int world_rank;
world_rank = 0;
MPI_Comm_rank(w_comm->raw_comm,&world_rank);
return world_rank;

}

struct intArray* OBJECT_MPI_Mothdims_create(struct MothMPI* self,int world_size,int ndims){
struct intArray* dims;int i;
dims = (struct intArray*)malloc(sizeof(struct intArray));
dims->dims = (int*)malloc(1*sizeof(int));
dims->dims[0] = world_size;
dims->raw = (int*)malloc(world_size*sizeof(int));
for (i = 0;i < world_size;i = i + 1){

dims->raw[(i*1)] = 0;

}

MPI_Dims_create(world_size,ndims,dims->raw);
return dims;

}

void OBJECT_MPI_Mothtype_contiguous(struct MothMPI* self,int size,struct Mothmpi_datatype* type){

MPI_Type_contiguous(size,MPI_BYTE,&type->raw_type);

}

void OBJECT_MPI_Mothtype_commit(struct MothMPI* self,struct Mothmpi_datatype* type){

MPI_Type_commit(&type->raw_type);

}

void OBJECT_MPI_Mothbarrier(struct MothMPI* self,struct Mothcomm* w_comm){

MPI_Barrier(w_comm->raw_comm);

}

void OBJECT_MPI_Mothalltoall(struct MothMPI* self,struct doubleArray* input,int nsends1,struct Mothmpi_datatype* type1,struct doubleArray* output,int nsends2,struct Mothmpi_datatype* type2,struct Mothcomm* w_comm){

MPI_Alltoall(input->raw,nsends1,type1->raw_type,output->raw,nsends2,type2->raw_type,w_comm->raw_comm);

}

void OBJECT_MPI_Moth__free__(struct MothMPI* self){


}

void OBJECT_MPI_Mothfinalize(struct MothMPI* self){

OBJECT_comm_Moth__free__(self->comm_world);free(self->comm_world);
MPI_Finalize();
OBJECT_MPI_Moth__free__(self);free(self);

}

void Mothz_a2a_to_z_pencils(struct doubleArray* source,struct doubleArray* dest,int world_size,int n_cells,struct intArray* local_grid_size,struct intArray* dims){
int n_cells_per_rank;int n_cells_mini_pencils;int n_mini_pencils_per_rank;int n_mini_pencils_stacked;int idx;
n_cells_per_rank = (n_cells) / (world_size);
n_cells_mini_pencils = local_grid_size->raw[(2*1)];
n_mini_pencils_per_rank = (n_cells_per_rank) / (n_cells_mini_pencils);
n_mini_pencils_stacked = dims->raw[(2*1)];
for (idx = 0;idx < n_cells;idx = idx + 1){
int rank;int mini_pencil_id;int mini_pencil_offset;int stack_id;int offset;int new_idx;
rank = (idx) / (n_cells_per_rank);
mini_pencil_id = ((idx) / (n_cells_mini_pencils)) % (n_mini_pencils_per_rank);
mini_pencil_offset = ((rank) % (n_mini_pencils_stacked)) * (n_cells_mini_pencils);
stack_id = (idx) / ((n_mini_pencils_stacked) * (n_cells_per_rank));
offset = ((stack_id) * (n_mini_pencils_stacked)) * (n_cells_per_rank);
new_idx = (((offset) + (mini_pencil_offset)) + (((mini_pencil_id) * (n_mini_pencils_stacked)) * (n_cells_mini_pencils))) + ((idx) % (n_cells_mini_pencils));
dest->raw[(new_idx*1*(dest->dims[1]))+(0*1)] = source->raw[(idx*1*(source->dims[1]))+(0*1)];
dest->raw[(new_idx*1*(dest->dims[1]))+(1*1)] = source->raw[(idx*1*(source->dims[1]))+(1*1)];

}


}
void Mothz_pencils_to_z_a2a(struct doubleArray* source,struct doubleArray* dest,int world_size,int n_cells,struct intArray* local_grid_size,struct intArray* dims){
int n_cells_per_rank;int n_cells_mini_pencils;int n_mini_pencils_per_rank;int n_mini_pencils_stacked;int idx;
n_cells_per_rank = (n_cells) / (world_size);
n_cells_mini_pencils = local_grid_size->raw[(2*1)];
n_mini_pencils_per_rank = (n_cells_per_rank) / (n_cells_mini_pencils);
n_mini_pencils_stacked = dims->raw[(2*1)];
for (idx = 0;idx < n_cells;idx = idx + 1){
int stack_id;int mini_pencil_id;int rank;int pencil_id;int pencil_offset;int offset;int new_idx;
stack_id = (idx) / ((n_mini_pencils_stacked) * (n_cells_per_rank));
mini_pencil_id = ((idx) / (n_cells_mini_pencils)) % (n_mini_pencils_stacked);
rank = ((stack_id) * (n_mini_pencils_stacked)) + (mini_pencil_id);
pencil_id = ((idx) / ((n_cells_mini_pencils) * (n_mini_pencils_stacked))) % (n_mini_pencils_per_rank);
pencil_offset = (pencil_id) * (n_cells_mini_pencils);
offset = (rank) * (n_cells_per_rank);
new_idx = ((offset) + (pencil_offset)) + ((idx) % (n_cells_mini_pencils));
dest->raw[(new_idx*1*(dest->dims[1]))+(0*1)] = source->raw[(idx*1*(source->dims[1]))+(0*1)];
dest->raw[(new_idx*1*(dest->dims[1]))+(1*1)] = source->raw[(idx*1*(source->dims[1]))+(1*1)];

}


}
void Mothx_a2a_to_x_pencils(struct doubleArray* source,struct doubleArray* dest,int world_size,int n_cells,struct intArray* local_grid_size,struct intArray* dims){
int n_cells_per_rank;int n_cells_mini_pencils;int n_mini_pencils_per_rank;int n_mini_pencils_stacked;int n_cells_per_stack;int idx;
n_cells_per_rank = (n_cells) / (world_size);
n_cells_mini_pencils = local_grid_size->raw[(0*1)];
n_mini_pencils_per_rank = (n_cells_per_rank) / (n_cells_mini_pencils);
n_mini_pencils_stacked = dims->raw[(0*1)];
n_cells_per_stack = (n_cells) / (n_mini_pencils_stacked);
for (idx = 0;idx < n_cells;idx = idx + 1){
int mini_pencil_id;int stack_id;int mini_pencil_offset;int offset;int new_idx;
mini_pencil_id = ((idx) / (n_cells_mini_pencils)) % ((n_cells_per_stack) / (n_cells_mini_pencils));
stack_id = (idx) / (n_cells_per_stack);
mini_pencil_offset = ((mini_pencil_id) * (n_mini_pencils_stacked)) * (n_cells_mini_pencils);
offset = (stack_id) * (n_cells_mini_pencils);
new_idx = ((offset) + (mini_pencil_offset)) + ((idx) % (n_cells_mini_pencils));
dest->raw[(new_idx*1*(dest->dims[1]))+(0*1)] = source->raw[(idx*1*(source->dims[1]))+(0*1)];
dest->raw[(new_idx*1*(dest->dims[1]))+(1*1)] = source->raw[(idx*1*(source->dims[1]))+(1*1)];

}


}
void Mothx_pencils_to_x_a2a(struct doubleArray* source,struct doubleArray* dest,int world_size,int n_cells,struct intArray* local_grid_size,struct intArray* dims){
int n_cells_per_rank;int n_cells_mini_pencils;int n_mini_pencils_per_rank;int n_mini_pencils_stacked;int n_cells_per_stack;int idx;
n_cells_per_rank = (n_cells) / (world_size);
n_cells_mini_pencils = local_grid_size->raw[(0*1)];
n_mini_pencils_per_rank = (n_cells_per_rank) / (n_cells_mini_pencils);
n_mini_pencils_stacked = dims->raw[(0*1)];
n_cells_per_stack = (n_cells) / (n_mini_pencils_stacked);
for (idx = 0;idx < n_cells;idx = idx + 1){
int mini_pencil_id;int stack_id;int rank;int pencil_id;int mini_pencil_offset;int offset;int new_idx;
mini_pencil_id = (idx) / (n_cells_mini_pencils);
stack_id = (mini_pencil_id) % (n_mini_pencils_stacked);
rank = ((idx) / ((n_cells_per_rank) * (n_mini_pencils_stacked))) + ((stack_id) * ((n_cells_per_stack) / (n_cells_per_rank)));
pencil_id = ((idx) / ((n_mini_pencils_stacked) * (n_cells_mini_pencils))) % (n_mini_pencils_per_rank);
mini_pencil_offset = (pencil_id) * (n_cells_mini_pencils);
offset = (rank) * (n_cells_per_rank);
new_idx = ((offset) + (mini_pencil_offset)) + ((idx) % (n_cells_mini_pencils));
dest->raw[(new_idx*1*(dest->dims[1]))+(0*1)] = source->raw[(idx*1*(source->dims[1]))+(0*1)];
dest->raw[(new_idx*1*(dest->dims[1]))+(1*1)] = source->raw[(idx*1*(source->dims[1]))+(1*1)];

}


}
void Mothy_a2a_to_y_pencils(struct doubleArray* source,struct doubleArray* dest,int world_size,int n_cells,struct intArray* local_grid_size,struct intArray* dims){
int n_cells_per_rank;int n_cells_mini_pencils;int n_mini_pencils_per_rank;int n_mini_pencils_stacked;int n_ranks_per_stack;int n_ranks_per_tower;int idx;
n_cells_per_rank = (n_cells) / (world_size);
n_cells_mini_pencils = local_grid_size->raw[(1*1)];
n_mini_pencils_per_rank = (n_cells_per_rank) / (n_cells_mini_pencils);
n_mini_pencils_stacked = dims->raw[(1*1)];
n_ranks_per_stack = (world_size) / (n_mini_pencils_stacked);
n_ranks_per_tower = (n_ranks_per_stack) / (dims)->raw[(0*1)];
for (idx = 0;idx < n_cells;idx = idx + 1){
int mini_pencil_id;int stack_id;int local_stack_id;int mini_pencil_offset;int offset;int new_idx;
mini_pencil_id = ((idx) / (n_cells_mini_pencils)) % ((n_ranks_per_tower) * (n_mini_pencils_per_rank));
stack_id = (idx) / (((n_ranks_per_tower) * (n_mini_pencils_stacked)) * (n_cells_per_rank));
local_stack_id = ((idx) / ((n_ranks_per_tower) * (n_cells_per_rank))) % (n_mini_pencils_stacked);
mini_pencil_offset = (((mini_pencil_id) * (n_mini_pencils_stacked)) * (n_cells_mini_pencils)) + ((local_stack_id) * (n_cells_mini_pencils));
offset = (((stack_id) * (n_ranks_per_tower)) * (n_mini_pencils_stacked)) * (n_cells_per_rank);
new_idx = ((mini_pencil_offset) + (offset)) + ((idx) % (n_cells_mini_pencils));
dest->raw[(new_idx*1*(dest->dims[1]))+(0*1)] = source->raw[(idx*1*(source->dims[1]))+(0*1)];
dest->raw[(new_idx*1*(dest->dims[1]))+(1*1)] = source->raw[(idx*1*(source->dims[1]))+(1*1)];

}


}
void Mothy_pencils_to_y_a2a(struct doubleArray* source,struct doubleArray* dest,int world_size,int n_cells,struct intArray* local_grid_size,struct intArray* dims){
int n_cells_per_rank;int n_cells_mini_pencils;int n_mini_pencils_per_rank;int n_mini_pencils_stacked;int n_ranks_per_stack;int n_ranks_per_tower;int idx;
n_cells_per_rank = (n_cells) / (world_size);
n_cells_mini_pencils = local_grid_size->raw[(1*1)];
n_mini_pencils_per_rank = (n_cells_per_rank) / (n_cells_mini_pencils);
n_mini_pencils_stacked = dims->raw[(1*1)];
n_ranks_per_stack = (world_size) / (n_mini_pencils_stacked);
n_ranks_per_tower = (n_ranks_per_stack) / (dims)->raw[(0*1)];
for (idx = 0;idx < n_cells;idx = idx + 1){
int mini_pencil_id;int stack_id;int local_stack_id;int mini_pencil_offset;int offset;int new_idx;
mini_pencil_id = ((idx) / (n_cells_mini_pencils)) % ((n_ranks_per_tower) * (n_mini_pencils_per_rank));
stack_id = (idx) / (((n_ranks_per_tower) * (n_mini_pencils_stacked)) * (n_cells_per_rank));
local_stack_id = ((idx) / ((n_ranks_per_tower) * (n_cells_per_rank))) % (n_mini_pencils_stacked);
mini_pencil_offset = (((mini_pencil_id) * (n_mini_pencils_stacked)) * (n_cells_mini_pencils)) + ((local_stack_id) * (n_cells_mini_pencils));
offset = (((stack_id) * (n_ranks_per_tower)) * (n_mini_pencils_stacked)) * (n_cells_per_rank);
new_idx = ((mini_pencil_offset) + (offset)) + ((idx) % (n_cells_mini_pencils));
dest->raw[(idx*1*(dest->dims[1]))+(0*1)] = source->raw[(new_idx*1*(source->dims[1]))+(0*1)];
dest->raw[(idx*1*(dest->dims[1]))+(1*1)] = source->raw[(new_idx*1*(source->dims[1]))+(1*1)];

}


}
void Mothfast_z_to_x(struct doubleArray* source,struct doubleArray* dest,struct intArray* local_grid_size){
int i;
for (i = 0;i < local_grid_size->raw[(2*1)];i = i + 1){
int j;
for (j = 0;j < local_grid_size->raw[(1*1)];j = j + 1){
int k;
for (k = 0;k < local_grid_size->raw[(2*1)];k = k + 1){
int d;int s;
d = ((((i) * (local_grid_size->raw[(1*1)])) * (local_grid_size->raw[(0*1)])) + ((j) * (local_grid_size->raw[(0*1)]))) + (k);
s = ((((k) * (local_grid_size->raw[(1*1)])) * (local_grid_size->raw[(2*1)])) + ((j) * (local_grid_size->raw[(2*1)]))) + (i);
dest->raw[(d*1*(dest->dims[1]))+(0*1)] = source->raw[(s*1*(source->dims[1]))+(0*1)];
dest->raw[(d*1*(dest->dims[1]))+(1*1)] = source->raw[(s*1*(source->dims[1]))+(1*1)];

}


}


}


}
void Mothfast_x_to_y(struct doubleArray* source,struct doubleArray* dest,struct intArray* local_grid_size){
int i;
for (i = 0;i < local_grid_size->raw[(0*1)];i = i + 1){
int j;
for (j = 0;j < local_grid_size->raw[(2*1)];j = j + 1){
int k;
for (k = 0;k < local_grid_size->raw[(1*1)];k = k + 1){
int d;int s;
d = ((((i) * (local_grid_size->raw[(2*1)])) * (local_grid_size->raw[(1*1)])) + ((j) * (local_grid_size->raw[(1*1)]))) + (k);
s = ((((j) * (local_grid_size->raw[(0*1)])) * (local_grid_size->raw[(1*1)])) + ((k) * (local_grid_size->raw[(0*1)]))) + (i);
dest->raw[(d*1*(dest->dims[1]))+(0*1)] = source->raw[(s*1*(source->dims[1]))+(0*1)];
dest->raw[(d*1*(dest->dims[1]))+(1*1)] = source->raw[(s*1*(source->dims[1]))+(1*1)];

}


}


}


}
void Mothfast_y_to_z(struct doubleArray* source,struct doubleArray* dest,struct intArray* local_grid_size){
int i;
for (i = 0;i < local_grid_size->raw[(0*1)];i = i + 1){
int j;
for (j = 0;j < local_grid_size->raw[(1*1)];j = j + 1){
int k;
for (k = 0;k < local_grid_size->raw[(2*1)];k = k + 1){
int d;int s;
d = ((((i) * (local_grid_size->raw[(1*1)])) * (local_grid_size->raw[(2*1)])) + ((j) * (local_grid_size->raw[(2*1)]))) + (k);
s = ((((i) * (local_grid_size->raw[(1*1)])) * (local_grid_size->raw[(2*1)])) + ((k) * (local_grid_size->raw[(1*1)]))) + (j);
dest->raw[(d*1*(dest->dims[1]))+(0*1)] = source->raw[(s*1*(source->dims[1]))+(0*1)];
dest->raw[(d*1*(dest->dims[1]))+(1*1)] = source->raw[(s*1*(source->dims[1]))+(1*1)];

}


}


}


}
struct MothDistribution{
int ng;int world_size;int world_rank;int nlocal;int verbose;struct MothMPI* mpi;struct intArray* dims;struct intArray* coords;struct intArray* local_grid_size;struct intArray* local_coordinates_start;struct Mothmpi_datatype* fft_t;

};
struct intArray* OBJECT_Distribution_Mothget_coords(struct MothDistribution* self){
struct intArray* out;
out = (struct intArray*)malloc(sizeof(struct intArray));
out->dims = (int*)malloc(1*sizeof(int));
out->dims[0] = 3;
out->raw = (int*)malloc(3*sizeof(int));
out->raw[(0*1)] = (self->world_rank) / ((self->dims->raw[(1*1)]) * (self->dims)->raw[(2*1)]);
out->raw[(1*1)] = ((self->world_rank) - ((out->raw[(0*1)]) * ((self->dims->raw[(1*1)]) * (self->dims)->raw[(2*1)]))) / (self->dims)->raw[(2*1)];
out->raw[(2*1)] = ((self->world_rank) - ((out->raw[(0*1)]) * ((self->dims->raw[(1*1)]) * (self->dims)->raw[(2*1)]))) - ((out->raw[(1*1)]) * (self->dims)->raw[(2*1)]);
return out;

}

struct intArray* OBJECT_Distribution_Mothget_local_grid(struct MothDistribution* self){
struct intArray* out;
out = (struct intArray*)malloc(sizeof(struct intArray));
out->dims = (int*)malloc(1*sizeof(int));
out->dims[0] = 3;
out->raw = (int*)malloc(3*sizeof(int));
out->raw[(0*1)] = (self->ng) / (self->dims)->raw[(0*1)];
out->raw[(1*1)] = (self->ng) / (self->dims)->raw[(1*1)];
out->raw[(2*1)] = (self->ng) / (self->dims)->raw[(2*1)];
return out;

}

struct intArray* OBJECT_Distribution_Mothget_local_grid_start(struct MothDistribution* self){
struct intArray* out;
out = (struct intArray*)malloc(sizeof(struct intArray));
out->dims = (int*)malloc(1*sizeof(int));
out->dims[0] = 3;
out->raw = (int*)malloc(3*sizeof(int));
out->raw[(0*1)] = (self->local_grid_size->raw[(0*1)]) * (self->coords)->raw[(0*1)];
out->raw[(1*1)] = (self->local_grid_size->raw[(1*1)]) * (self->coords)->raw[(1*1)];
out->raw[(2*1)] = (self->local_grid_size->raw[(2*1)]) * (self->coords)->raw[(2*1)];
return out;

}

void OBJECT_Distribution_MothgetZPencils(struct MothDistribution* self,struct doubleArray* buff1,struct doubleArray* buff2){
int nsends;
nsends = (((self->local_grid_size->raw[(0*1)]) * (self->local_grid_size)->raw[(1*1)]) / (self->world_size)) * (self->local_grid_size)->raw[(2*1)];
OBJECT_MPI_Mothalltoall(self->mpi,buff1,nsends,self->fft_t,buff2,nsends,self->fft_t,self->mpi->comm_world);
Mothz_a2a_to_z_pencils(buff2,buff1,self->world_size,self->nlocal,self->local_grid_size,self->dims);

}

void OBJECT_Distribution_MothreturnZPencils(struct MothDistribution* self,struct doubleArray* buff1,struct doubleArray* buff2){
int nsends;
nsends = (((self->local_grid_size->raw[(0*1)]) * (self->local_grid_size)->raw[(1*1)]) / (self->world_size)) * (self->local_grid_size)->raw[(2*1)];
Mothz_pencils_to_z_a2a(buff2,buff1,self->world_size,self->nlocal,self->local_grid_size,self->dims);
OBJECT_MPI_Mothalltoall(self->mpi,buff1,nsends,self->fft_t,buff2,nsends,self->fft_t,self->mpi->comm_world);

}

void OBJECT_Distribution_MothgetXPencils(struct MothDistribution* self,struct doubleArray* buff1,struct doubleArray* buff2){
int nsends;
nsends = (((self->local_grid_size->raw[(2*1)]) * (self->local_grid_size)->raw[(1*1)]) / (self->world_size)) * (self->local_grid_size)->raw[(0*1)];
Mothfast_z_to_x(buff2,buff1,self->local_grid_size);
OBJECT_MPI_Mothalltoall(self->mpi,buff1,nsends,self->fft_t,buff2,nsends,self->fft_t,self->mpi->comm_world);
Mothx_a2a_to_x_pencils(buff2,buff1,self->world_size,self->nlocal,self->local_grid_size,self->dims);

}

void OBJECT_Distribution_MothreturnXPencils(struct MothDistribution* self,struct doubleArray* buff1,struct doubleArray* buff2){
int nsends;
nsends = (((self->local_grid_size->raw[(2*1)]) * (self->local_grid_size)->raw[(1*1)]) / (self->world_size)) * (self->local_grid_size)->raw[(0*1)];
Mothx_pencils_to_x_a2a(buff2,buff1,self->world_size,self->nlocal,self->local_grid_size,self->dims);
OBJECT_MPI_Mothalltoall(self->mpi,buff1,nsends,self->fft_t,buff2,nsends,self->fft_t,self->mpi->comm_world);

}

void OBJECT_Distribution_MothgetYPencils(struct MothDistribution* self,struct doubleArray* buff1,struct doubleArray* buff2){
int nsends;
nsends = (((self->local_grid_size->raw[(2*1)]) * (self->local_grid_size)->raw[(0*1)]) / (self->world_size)) * (self->local_grid_size)->raw[(1*1)];
Mothfast_x_to_y(buff2,buff1,self->local_grid_size);
OBJECT_MPI_Mothalltoall(self->mpi,buff1,nsends,self->fft_t,buff2,nsends,self->fft_t,self->mpi->comm_world);
Mothy_a2a_to_y_pencils(buff2,buff1,self->world_size,self->nlocal,self->local_grid_size,self->dims);

}

void OBJECT_Distribution_MothreturnYPencils(struct MothDistribution* self,struct doubleArray* buff1,struct doubleArray* buff2){
int nsends;
nsends = (((self->local_grid_size->raw[(2*1)]) * (self->local_grid_size)->raw[(0*1)]) / (self->world_size)) * (self->local_grid_size)->raw[(1*1)];
Mothy_pencils_to_y_a2a(buff2,buff1,self->world_size,self->nlocal,self->local_grid_size,self->dims);
OBJECT_MPI_Mothalltoall(self->mpi,buff1,nsends,self->fft_t,buff2,nsends,self->fft_t,self->mpi->comm_world);
Mothfast_y_to_z(buff2,buff1,self->local_grid_size);

}

void OBJECT_Distribution_Moth__free__(struct MothDistribution* self){

free(self->dims->dims);free(self->dims->raw);free(self->dims);
free(self->coords->dims);free(self->coords->raw);free(self->coords);
free(self->local_grid_size->dims);free(self->local_grid_size->raw);free(self->local_grid_size);
free(self->local_coordinates_start->dims);free(self->local_coordinates_start->raw);free(self->local_coordinates_start);
OBJECT_mpi_datatype_Moth__free__(self->fft_t);free(self->fft_t);

}

void OBJECT_Distribution_Moth__init__(struct MothDistribution* self,int ng){

self->verbose = 1;
self->ng = ng;
self->mpi = (struct MothMPI*)malloc(sizeof(struct MothMPI));OBJECT_MPI_Moth__init__(self->mpi);
self->world_size = OBJECT_MPI_Mothcomm_size(self->mpi,self->mpi->comm_world);
self->world_rank = OBJECT_MPI_Mothcomm_rank(self->mpi,self->mpi->comm_world);
self->dims = OBJECT_MPI_Mothdims_create(self->mpi,self->world_size,3);
self->coords = OBJECT_Distribution_Mothget_coords(self);
self->local_grid_size = OBJECT_Distribution_Mothget_local_grid(self);
self->local_coordinates_start = OBJECT_Distribution_Mothget_local_grid_start(self);
self->nlocal = ((self->local_grid_size->raw[(0*1)]) * (self->local_grid_size)->raw[(1*1)]) * (self->local_grid_size)->raw[(2*1)];
self->fft_t = (struct Mothmpi_datatype*)malloc(sizeof(struct Mothmpi_datatype));OBJECT_mpi_datatype_Moth__init__(self->fft_t);
OBJECT_MPI_Mothtype_contiguous(self->mpi,(8) * (2),self->fft_t);
OBJECT_MPI_Mothtype_commit(self->mpi,self->fft_t);
if (self->verbose){
int rank;
if ((self->world_rank) == (0)){

printf("%s","World Size: ");printf("%d",self->world_size);printf("%s","\n");
printf("%s","Ng: ");printf("%d",self->ng);printf("%s","\n");
printf("%s","Dims: [");printf("%d",self->dims->raw[(0*1)]);printf("%s",",");printf("%d",self->dims->raw[(1*1)]);printf("%s",",");printf("%d",self->dims->raw[(2*1)]);printf("%s","]\n");
printf("%s","Grid: [");printf("%d",self->local_grid_size->raw[(0*1)]);printf("%s",",");printf("%d",self->local_grid_size->raw[(1*1)]);printf("%s",",");printf("%d",self->local_grid_size->raw[(2*1)]);printf("%s","]\n");
printf("%s","nlocal: ");printf("%d",self->nlocal);printf("%s","\n");

}

OBJECT_MPI_Mothbarrier(self->mpi,self->mpi->comm_world);
for (rank = 0;rank < self->world_size;rank = rank + 1){

if ((rank) == (self->world_rank)){

printf("%s","Rank ");printf("%d",rank);printf("%s",":\n   Coords: [");printf("%d",self->coords->raw[(0*1)]);printf("%s",",");printf("%d",self->coords->raw[(1*1)]);printf("%s",",");printf("%d",self->coords->raw[(2*1)]);printf("%s","]\n");
printf("%s","   Start: [");printf("%d",self->local_coordinates_start->raw[(0*1)]);printf("%s",",");printf("%d",self->local_coordinates_start->raw[(1*1)]);printf("%s",",");printf("%d",self->local_coordinates_start->raw[(2*1)]);printf("%s","]\n");

}

OBJECT_MPI_Mothbarrier(self->mpi,self->mpi->comm_world);

}


}


}

struct Mothfftw_plan{
fftw_plan raw_plan;

};
void OBJECT_fftw_plan_Moth__init__(struct Mothfftw_plan* self){


}

void OBJECT_fftw_plan_Moth__free__(struct Mothfftw_plan* self){


}

struct MothFFTW{


};
struct Mothfftw_plan* OBJECT_FFTW_Mothplan_many_dft(struct MothFFTW* self,int rank,struct intArray* n,int howmany,struct doubleArray* inp,struct intArray* inembed,int istride,int idist,struct doubleArray* out,struct intArray* onembed,int ostride,int odist,int sign,unsigned int flags){
struct Mothfftw_plan* plan;
plan = (struct Mothfftw_plan*)malloc(sizeof(struct Mothfftw_plan));OBJECT_fftw_plan_Moth__init__(plan);
plan->raw_plan = fftw_plan_many_dft(rank,n->raw,howmany,inp->raw,NULL,istride,idist,out->raw,NULL,ostride,odist,sign,flags);
return plan;

}

void OBJECT_FFTW_Moth__init__(struct MothFFTW* self){


}

void OBJECT_FFTW_Moth__free__(struct MothFFTW* self){


}

int Mothmain(){
struct MothMPI* mpi;struct MothDistribution* dist;int Ng;struct doubleArray* buff1;struct doubleArray* buff2;
mpi = (struct MothMPI*)malloc(sizeof(struct MothMPI));OBJECT_MPI_Moth__init__(mpi);
OBJECT_MPI_Mothinit(mpi);
dist = (struct MothDistribution*)malloc(sizeof(struct MothDistribution));OBJECT_Distribution_Moth__init__(dist,8);
Ng = 8;
buff1 = (struct doubleArray*)malloc(sizeof(struct doubleArray));
buff1->dims = (int*)malloc(2*sizeof(int));
buff1->dims[0] = dist->nlocal;buff1->dims[1] = 2;
buff1->raw = (double*)malloc(dist->nlocal*2*sizeof(double));
buff2 = (struct doubleArray*)malloc(sizeof(struct doubleArray));
buff2->dims = (int*)malloc(2*sizeof(int));
buff2->dims[0] = dist->nlocal;buff2->dims[1] = 2;
buff2->raw = (double*)malloc(dist->nlocal*2*sizeof(double));
OBJECT_Distribution_MothgetZPencils(dist,buff1,buff2);
OBJECT_Distribution_MothreturnZPencils(dist,buff1,buff2);
OBJECT_Distribution_MothgetXPencils(dist,buff1,buff2);
OBJECT_Distribution_MothreturnXPencils(dist,buff1,buff2);
OBJECT_Distribution_MothgetYPencils(dist,buff1,buff2);
OBJECT_Distribution_MothreturnYPencils(dist,buff1,buff2);
OBJECT_Distribution_Moth__free__(dist);free(dist);
free(buff1->dims);free(buff1->raw);free(buff1);
free(buff2->dims);free(buff2->raw);free(buff2);
OBJECT_MPI_Mothfinalize(mpi);
return 0;

}

int main() { return Mothmain();}
