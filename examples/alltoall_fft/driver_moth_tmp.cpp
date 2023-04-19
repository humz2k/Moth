#include "/Users/humzaqureshi/GitHub/Moth/bin/moth_lib.hpp"



#include <mpi.h>


#include <fftw3.h>


__Mothvoid Mothz_a2a_to_z_pencils(__MothArray<__Mothdouble> source,__MothArray<__Mothdouble> dest,__Mothint world_size,__Mothint n_cells,__MothArray<__Mothint> local_grid_size,__MothArray<__Mothint> dims){
__Mothint n_cells_per_rank;__Mothint n_cells_mini_pencils;__Mothint n_mini_pencils_per_rank;__Mothint n_mini_pencils_stacked;__Mothint idx;n_cells_per_rank = __MothBaseSLASH(n_cells,world_size);
n_cells_mini_pencils = __MothArrayINDEX(local_grid_size,1,2);
n_mini_pencils_per_rank = __MothBaseSLASH(n_cells_per_rank,n_cells_mini_pencils);
n_mini_pencils_stacked = __MothArrayINDEX(dims,1,2);
for (idx = 0;idx < n_cells;idx = idx + 1){

__Mothint rank;__Mothint mini_pencil_id;__Mothint mini_pencil_offset;__Mothint stack_id;__Mothint offset;__Mothint new_idx;rank = __MothBaseSLASH(idx,n_cells_per_rank);
mini_pencil_id = __MothBasePERCENT(__MothBaseSLASH(idx,n_cells_mini_pencils),n_mini_pencils_per_rank);
mini_pencil_offset = __MothBaseSTAR(__MothBasePERCENT(rank,n_mini_pencils_stacked),n_cells_mini_pencils);
stack_id = __MothBaseSLASH(idx,__MothBaseSTAR(n_mini_pencils_stacked,n_cells_per_rank));
offset = __MothBaseSTAR(__MothBaseSTAR(stack_id,n_mini_pencils_stacked),n_cells_per_rank);
new_idx = __MothBasePLUS(__MothBasePLUS(__MothBasePLUS(offset,mini_pencil_offset),__MothBaseSTAR(__MothBaseSTAR(mini_pencil_id,n_mini_pencils_stacked),n_cells_mini_pencils)),__MothBasePERCENT(idx,n_cells_mini_pencils));
__MothArrayINDEX(dest,2,new_idx,0) = __MothArrayINDEX(source,2,idx,0);
__MothArrayINDEX(dest,2,new_idx,1) = __MothArrayINDEX(source,2,idx,1);

}


}
__Mothvoid Mothz_pencils_to_z_a2a(__MothArray<__Mothdouble> source,__MothArray<__Mothdouble> dest,__Mothint world_size,__Mothint n_cells,__MothArray<__Mothint> local_grid_size,__MothArray<__Mothint> dims){
__Mothint n_cells_per_rank;__Mothint n_cells_mini_pencils;__Mothint n_mini_pencils_per_rank;__Mothint n_mini_pencils_stacked;__Mothint idx;n_cells_per_rank = __MothBaseSLASH(n_cells,world_size);
n_cells_mini_pencils = __MothArrayINDEX(local_grid_size,1,2);
n_mini_pencils_per_rank = __MothBaseSLASH(n_cells_per_rank,n_cells_mini_pencils);
n_mini_pencils_stacked = __MothArrayINDEX(dims,1,2);
for (idx = 0;idx < n_cells;idx = idx + 1){

__Mothint stack_id;__Mothint mini_pencil_id;__Mothint rank;__Mothint pencil_id;__Mothint pencil_offset;__Mothint offset;__Mothint new_idx;stack_id = __MothBaseSLASH(idx,__MothBaseSTAR(n_mini_pencils_stacked,n_cells_per_rank));
mini_pencil_id = __MothBasePERCENT(__MothBaseSLASH(idx,n_cells_mini_pencils),n_mini_pencils_stacked);
rank = __MothBasePLUS(__MothBaseSTAR(stack_id,n_mini_pencils_stacked),mini_pencil_id);
pencil_id = __MothBasePERCENT(__MothBaseSLASH(idx,__MothBaseSTAR(n_cells_mini_pencils,n_mini_pencils_stacked)),n_mini_pencils_per_rank);
pencil_offset = __MothBaseSTAR(pencil_id,n_cells_mini_pencils);
offset = __MothBaseSTAR(rank,n_cells_per_rank);
new_idx = __MothBasePLUS(__MothBasePLUS(offset,pencil_offset),__MothBasePERCENT(idx,n_cells_mini_pencils));
__MothArrayINDEX(dest,2,new_idx,0) = __MothArrayINDEX(source,2,idx,0);
__MothArrayINDEX(dest,2,new_idx,1) = __MothArrayINDEX(source,2,idx,1);

}


}
__Mothvoid Mothx_a2a_to_x_pencils(__MothArray<__Mothdouble> source,__MothArray<__Mothdouble> dest,__Mothint world_size,__Mothint n_cells,__MothArray<__Mothint> local_grid_size,__MothArray<__Mothint> dims){
__Mothint n_cells_per_rank;__Mothint n_cells_mini_pencils;__Mothint n_mini_pencils_per_rank;__Mothint n_mini_pencils_stacked;__Mothint n_cells_per_stack;__Mothint idx;n_cells_per_rank = __MothBaseSLASH(n_cells,world_size);
n_cells_mini_pencils = __MothArrayINDEX(local_grid_size,1,0);
n_mini_pencils_per_rank = __MothBaseSLASH(n_cells_per_rank,n_cells_mini_pencils);
n_mini_pencils_stacked = __MothArrayINDEX(dims,1,0);
n_cells_per_stack = __MothBaseSLASH(n_cells,n_mini_pencils_stacked);
for (idx = 0;idx < n_cells;idx = idx + 1){

__Mothint mini_pencil_id;__Mothint stack_id;__Mothint mini_pencil_offset;__Mothint offset;__Mothint new_idx;mini_pencil_id = __MothBasePERCENT(__MothBaseSLASH(idx,n_cells_mini_pencils),__MothBaseSLASH(n_cells_per_stack,n_cells_mini_pencils));
stack_id = __MothBaseSLASH(idx,n_cells_per_stack);
mini_pencil_offset = __MothBaseSTAR(__MothBaseSTAR(mini_pencil_id,n_mini_pencils_stacked),n_cells_mini_pencils);
offset = __MothBaseSTAR(stack_id,n_cells_mini_pencils);
new_idx = __MothBasePLUS(__MothBasePLUS(offset,mini_pencil_offset),__MothBasePERCENT(idx,n_cells_mini_pencils));
__MothArrayINDEX(dest,2,new_idx,0) = __MothArrayINDEX(source,2,idx,0);
__MothArrayINDEX(dest,2,new_idx,1) = __MothArrayINDEX(source,2,idx,1);

}


}
__Mothvoid Mothx_pencils_to_x_a2a(__MothArray<__Mothdouble> source,__MothArray<__Mothdouble> dest,__Mothint world_size,__Mothint n_cells,__MothArray<__Mothint> local_grid_size,__MothArray<__Mothint> dims){
__Mothint n_cells_per_rank;__Mothint n_cells_mini_pencils;__Mothint n_mini_pencils_per_rank;__Mothint n_mini_pencils_stacked;__Mothint n_cells_per_stack;__Mothint idx;n_cells_per_rank = __MothBaseSLASH(n_cells,world_size);
n_cells_mini_pencils = __MothArrayINDEX(local_grid_size,1,0);
n_mini_pencils_per_rank = __MothBaseSLASH(n_cells_per_rank,n_cells_mini_pencils);
n_mini_pencils_stacked = __MothArrayINDEX(dims,1,0);
n_cells_per_stack = __MothBaseSLASH(n_cells,n_mini_pencils_stacked);
for (idx = 0;idx < n_cells;idx = idx + 1){

__Mothint mini_pencil_id;__Mothint stack_id;__Mothint rank;__Mothint pencil_id;__Mothint mini_pencil_offset;__Mothint offset;__Mothint new_idx;mini_pencil_id = __MothBaseSLASH(idx,n_cells_mini_pencils);
stack_id = __MothBasePERCENT(mini_pencil_id,n_mini_pencils_stacked);
rank = __MothBasePLUS(__MothBaseSLASH(idx,__MothBaseSTAR(n_cells_per_rank,n_mini_pencils_stacked)),__MothBaseSTAR(stack_id,__MothBaseSLASH(n_cells_per_stack,n_cells_per_rank)));
pencil_id = __MothBasePERCENT(__MothBaseSLASH(idx,__MothBaseSTAR(n_mini_pencils_stacked,n_cells_mini_pencils)),n_mini_pencils_per_rank);
mini_pencil_offset = __MothBaseSTAR(pencil_id,n_cells_mini_pencils);
offset = __MothBaseSTAR(rank,n_cells_per_rank);
new_idx = __MothBasePLUS(__MothBasePLUS(offset,mini_pencil_offset),__MothBasePERCENT(idx,n_cells_mini_pencils));
__MothArrayINDEX(dest,2,new_idx,0) = __MothArrayINDEX(source,2,idx,0);
__MothArrayINDEX(dest,2,new_idx,1) = __MothArrayINDEX(source,2,idx,1);

}


}
__Mothvoid Mothy_a2a_to_y_pencils(__MothArray<__Mothdouble> source,__MothArray<__Mothdouble> dest,__Mothint world_size,__Mothint n_cells,__MothArray<__Mothint> local_grid_size,__MothArray<__Mothint> dims){
__Mothint n_cells_per_rank;__Mothint n_cells_mini_pencils;__Mothint n_mini_pencils_per_rank;__Mothint n_mini_pencils_stacked;__Mothint n_ranks_per_stack;__Mothint n_ranks_per_tower;__Mothint idx;n_cells_per_rank = __MothBaseSLASH(n_cells,world_size);
n_cells_mini_pencils = __MothArrayINDEX(local_grid_size,1,1);
n_mini_pencils_per_rank = __MothBaseSLASH(n_cells_per_rank,n_cells_mini_pencils);
n_mini_pencils_stacked = __MothArrayINDEX(dims,1,1);
n_ranks_per_stack = __MothBaseSLASH(world_size,n_mini_pencils_stacked);
n_ranks_per_tower = __MothBaseSLASH(n_ranks_per_stack,__MothArrayINDEX(dims,1,0));
for (idx = 0;idx < n_cells;idx = idx + 1){

__Mothint mini_pencil_id;__Mothint stack_id;__Mothint local_stack_id;__Mothint mini_pencil_offset;__Mothint offset;__Mothint new_idx;mini_pencil_id = __MothBasePERCENT(__MothBaseSLASH(idx,n_cells_mini_pencils),__MothBaseSTAR(n_ranks_per_tower,n_mini_pencils_per_rank));
stack_id = __MothBaseSLASH(idx,__MothBaseSTAR(__MothBaseSTAR(n_ranks_per_tower,n_mini_pencils_stacked),n_cells_per_rank));
local_stack_id = __MothBasePERCENT(__MothBaseSLASH(idx,__MothBaseSTAR(n_ranks_per_tower,n_cells_per_rank)),n_mini_pencils_stacked);
mini_pencil_offset = __MothBasePLUS(__MothBaseSTAR(__MothBaseSTAR(mini_pencil_id,n_mini_pencils_stacked),n_cells_mini_pencils),__MothBaseSTAR(local_stack_id,n_cells_mini_pencils));
offset = __MothBaseSTAR(__MothBaseSTAR(__MothBaseSTAR(stack_id,n_ranks_per_tower),n_mini_pencils_stacked),n_cells_per_rank);
new_idx = __MothBasePLUS(__MothBasePLUS(mini_pencil_offset,offset),__MothBasePERCENT(idx,n_cells_mini_pencils));
__MothArrayINDEX(dest,2,new_idx,0) = __MothArrayINDEX(source,2,idx,0);
__MothArrayINDEX(dest,2,new_idx,1) = __MothArrayINDEX(source,2,idx,1);

}


}
__Mothvoid Mothy_pencils_to_y_a2a(__MothArray<__Mothdouble> source,__MothArray<__Mothdouble> dest,__Mothint world_size,__Mothint n_cells,__MothArray<__Mothint> local_grid_size,__MothArray<__Mothint> dims){
__Mothint n_cells_per_rank;__Mothint n_cells_mini_pencils;__Mothint n_mini_pencils_per_rank;__Mothint n_mini_pencils_stacked;__Mothint n_ranks_per_stack;__Mothint n_ranks_per_tower;__Mothint idx;n_cells_per_rank = __MothBaseSLASH(n_cells,world_size);
n_cells_mini_pencils = __MothArrayINDEX(local_grid_size,1,1);
n_mini_pencils_per_rank = __MothBaseSLASH(n_cells_per_rank,n_cells_mini_pencils);
n_mini_pencils_stacked = __MothArrayINDEX(dims,1,1);
n_ranks_per_stack = __MothBaseSLASH(world_size,n_mini_pencils_stacked);
n_ranks_per_tower = __MothBaseSLASH(n_ranks_per_stack,__MothArrayINDEX(dims,1,0));
for (idx = 0;idx < n_cells;idx = idx + 1){

__Mothint mini_pencil_id;__Mothint stack_id;__Mothint local_stack_id;__Mothint mini_pencil_offset;__Mothint offset;__Mothint new_idx;mini_pencil_id = __MothBasePERCENT(__MothBaseSLASH(idx,n_cells_mini_pencils),__MothBaseSTAR(n_ranks_per_tower,n_mini_pencils_per_rank));
stack_id = __MothBaseSLASH(idx,__MothBaseSTAR(__MothBaseSTAR(n_ranks_per_tower,n_mini_pencils_stacked),n_cells_per_rank));
local_stack_id = __MothBasePERCENT(__MothBaseSLASH(idx,__MothBaseSTAR(n_ranks_per_tower,n_cells_per_rank)),n_mini_pencils_stacked);
mini_pencil_offset = __MothBasePLUS(__MothBaseSTAR(__MothBaseSTAR(mini_pencil_id,n_mini_pencils_stacked),n_cells_mini_pencils),__MothBaseSTAR(local_stack_id,n_cells_mini_pencils));
offset = __MothBaseSTAR(__MothBaseSTAR(__MothBaseSTAR(stack_id,n_ranks_per_tower),n_mini_pencils_stacked),n_cells_per_rank);
new_idx = __MothBasePLUS(__MothBasePLUS(mini_pencil_offset,offset),__MothBasePERCENT(idx,n_cells_mini_pencils));
__MothArrayINDEX(dest,2,idx,0) = __MothArrayINDEX(source,2,new_idx,0);
__MothArrayINDEX(dest,2,idx,1) = __MothArrayINDEX(source,2,new_idx,1);

}


}
inline __Mothvoid Mothfast_z_to_x(__MothArray<__Mothdouble> source,__MothArray<__Mothdouble> dest,__MothArray<__Mothint> local_grid_size)
{
__Mothint i;__Mothint j;__Mothint k;__Mothint d;__Mothint s;
__Mothint i_range = __MothArrayINDEX(local_grid_size,1,2);__Mothint j_range = __MothArrayINDEX(local_grid_size,1,1);__Mothint k_range = __MothArrayINDEX(local_grid_size,1,0);__Mothdouble* source_raw = source.raw.get();__Mothint source_idx0 = source.muls.get()[0];__Mothint source_idx1 = source.muls.get()[1];__Mothdouble* dest_raw = dest.raw.get();__Mothint dest_idx0 = dest.muls.get()[0];__Mothint dest_idx1 = dest.muls.get()[1];__Mothint* local_grid_size_raw = local_grid_size.raw.get();__Mothint local_grid_size_idx0 = local_grid_size.muls.get()[0];
	for (i = 0; i < i_range; i++){
		for (j = 0; j < j_range; j++){
			for (k = 0; k < k_range; k++){
d = __MothBasePLUS(__MothBasePLUS(__MothBaseSTAR(__MothBaseSTAR(i,local_grid_size_raw[1*local_grid_size_idx0]),local_grid_size_raw[0*local_grid_size_idx0]),__MothBaseSTAR(j,local_grid_size_raw[0*local_grid_size_idx0])),k);
s = __MothBasePLUS(__MothBasePLUS(__MothBaseSTAR(__MothBaseSTAR(k,local_grid_size_raw[1*local_grid_size_idx0]),local_grid_size_raw[2*local_grid_size_idx0]),__MothBaseSTAR(j,local_grid_size_raw[2*local_grid_size_idx0])),i);
dest_raw[d*dest_idx0+0*dest_idx1] = source_raw[s*source_idx0+0*source_idx1];
dest_raw[d*dest_idx0+1*dest_idx1] = source_raw[s*source_idx0+1*source_idx1];
}}}}

inline __Mothvoid Mothfast_x_to_y(__MothArray<__Mothdouble> source,__MothArray<__Mothdouble> dest,__MothArray<__Mothint> local_grid_size)
{
__Mothint i;__Mothint j;__Mothint k;__Mothint d;__Mothint s;
__Mothint i_range = __MothArrayINDEX(local_grid_size,1,0);__Mothint j_range = __MothArrayINDEX(local_grid_size,1,2);__Mothint k_range = __MothArrayINDEX(local_grid_size,1,1);__Mothdouble* source_raw = source.raw.get();__Mothint source_idx0 = source.muls.get()[0];__Mothint source_idx1 = source.muls.get()[1];__Mothdouble* dest_raw = dest.raw.get();__Mothint dest_idx0 = dest.muls.get()[0];__Mothint dest_idx1 = dest.muls.get()[1];__Mothint* local_grid_size_raw = local_grid_size.raw.get();__Mothint local_grid_size_idx0 = local_grid_size.muls.get()[0];
	for (i = 0; i < i_range; i++){
		for (j = 0; j < j_range; j++){
			for (k = 0; k < k_range; k++){
d = __MothBasePLUS(__MothBasePLUS(__MothBaseSTAR(__MothBaseSTAR(i,local_grid_size_raw[2*local_grid_size_idx0]),local_grid_size_raw[1*local_grid_size_idx0]),__MothBaseSTAR(j,local_grid_size_raw[1*local_grid_size_idx0])),k);
s = __MothBasePLUS(__MothBasePLUS(__MothBaseSTAR(__MothBaseSTAR(j,local_grid_size_raw[0*local_grid_size_idx0]),local_grid_size_raw[1*local_grid_size_idx0]),__MothBaseSTAR(k,local_grid_size_raw[0*local_grid_size_idx0])),i);
dest_raw[d*dest_idx0+0*dest_idx1] = source_raw[s*source_idx0+0*source_idx1];
dest_raw[d*dest_idx0+1*dest_idx1] = source_raw[s*source_idx0+1*source_idx1];
}}}}

inline __Mothvoid Mothfast_y_to_z(__MothArray<__Mothdouble> source,__MothArray<__Mothdouble> dest,__MothArray<__Mothint> local_grid_size)
{
__Mothint i;__Mothint j;__Mothint k;__Mothint d;__Mothint s;
__Mothint i_range = __MothArrayINDEX(local_grid_size,1,0);__Mothint j_range = __MothArrayINDEX(local_grid_size,1,1);__Mothint k_range = __MothArrayINDEX(local_grid_size,1,2);__Mothdouble* source_raw = source.raw.get();__Mothint source_idx0 = source.muls.get()[0];__Mothint source_idx1 = source.muls.get()[1];__Mothdouble* dest_raw = dest.raw.get();__Mothint dest_idx0 = dest.muls.get()[0];__Mothint dest_idx1 = dest.muls.get()[1];__Mothint* local_grid_size_raw = local_grid_size.raw.get();__Mothint local_grid_size_idx0 = local_grid_size.muls.get()[0];
	for (i = 0; i < i_range; i++){
		for (j = 0; j < j_range; j++){
			for (k = 0; k < k_range; k++){
d = __MothBasePLUS(__MothBasePLUS(__MothBaseSTAR(__MothBaseSTAR(i,local_grid_size_raw[1*local_grid_size_idx0]),local_grid_size_raw[2*local_grid_size_idx0]),__MothBaseSTAR(j,local_grid_size_raw[2*local_grid_size_idx0])),k);
s = __MothBasePLUS(__MothBasePLUS(__MothBaseSTAR(__MothBaseSTAR(i,local_grid_size_raw[1*local_grid_size_idx0]),local_grid_size_raw[2*local_grid_size_idx0]),__MothBaseSTAR(k,local_grid_size_raw[1*local_grid_size_idx0])),j);
dest_raw[d*dest_idx0+0*dest_idx1] = source_raw[s*source_idx0+0*source_idx1];
dest_raw[d*dest_idx0+1*dest_idx1] = source_raw[s*source_idx0+1*source_idx1];
}}}}

template <class arr_t>
__MothArray<arr_t> __MothnmMothzeros(__MothTuple<__Mothint> shape){
__Mothint size;__Mothint i;__MothArray<arr_t> out;size = 1;
for (i = 0;i < shape.Mothlen();i = i + 1){

size = __MothBaseSTAR(size,__MothTupleINDEX(shape,1,i));

}

out = newArray<arr_t>(1,size);
for (i = 0;i < size;i = i + 1){

__MothArrayINDEX(out,1,i) = 0;

}

return out.Mothreshape(shape);

}

__MothArray<__Mothint> __MothnmMothzeros(__MothTuple<__Mothint> shape){
__Mothint size;__Mothint i;__MothArray<__Mothint> out;size = 1;
for (i = 0;i < shape.Mothlen();i = i + 1){

size = __MothBaseSTAR(size,__MothTupleINDEX(shape,1,i));

}

out = newArray<__Mothint>(1,size);
for (i = 0;i < size;i = i + 1){

__MothArrayINDEX(out,1,i) = 0;

}

return out.Mothreshape(shape);

}

template <class arr_t>
__MothArray<arr_t> __MothnmMothones(__MothTuple<__Mothint> shape){
__Mothint size;__Mothint i;__MothArray<arr_t> out;size = 1;
for (i = 0;i < shape.Mothlen();i = i + 1){

size = __MothBaseSTAR(size,__MothTupleINDEX(shape,1,i));

}

out = newArray<arr_t>(1,size);
for (i = 0;i < size;i = i + 1){

__MothArrayINDEX(out,1,i) = 1;

}

return out.Mothreshape(shape);

}

__MothArray<__Mothint> __MothnmMothones(__MothTuple<__Mothint> shape){
__Mothint size;__Mothint i;__MothArray<__Mothint> out;size = 1;
for (i = 0;i < shape.Mothlen();i = i + 1){

size = __MothBaseSTAR(size,__MothTupleINDEX(shape,1,i));

}

out = newArray<__Mothint>(1,size);
for (i = 0;i < size;i = i + 1){

__MothArrayINDEX(out,1,i) = 1;

}

return out.Mothreshape(shape);

}

template <class arr_t>
__MothArray<arr_t> __MothnmMotharange(__Mothint start,__Mothint stop,__Mothint step){
__Mothint size;__MothArray<arr_t> out;__Mothint i;size = __MothBaseSLASH(__MothBaseMINUS(stop,start),step);
out = newArray<arr_t>(1,size);
for (i = 0;i < size;i = i + 1){

__MothArrayINDEX(out,1,i) = __MothBasePLUS(__MothBaseSTAR(i,step),start);

}

return out;

}

__MothArray<__Mothint> __MothnmMotharange(__Mothint start,__Mothint stop,__Mothint step){
__Mothint size;__MothArray<__Mothint> out;__Mothint i;size = __MothBaseSLASH(__MothBaseMINUS(stop,start),step);
out = newArray<__Mothint>(1,size);
for (i = 0;i < size;i = i + 1){

__MothArrayINDEX(out,1,i) = __MothBasePLUS(__MothBaseSTAR(i,step),start);

}

return out;

}

template <class arr_t>
__MothArray<arr_t> __MothnmMotharange(__Mothint start,__Mothint stop){
__Mothint step;__Mothint size;__MothArray<arr_t> out;__Mothint i;step = 1;
size = __MothBaseSLASH(__MothBaseMINUS(stop,start),step);
out = newArray<arr_t>(1,size);
for (i = 0;i < size;i = i + 1){

__MothArrayINDEX(out,1,i) = __MothBasePLUS(__MothBaseSTAR(i,step),start);

}

return out;

}

__MothArray<__Mothint> __MothnmMotharange(__Mothint start,__Mothint stop){
__Mothint step;__Mothint size;__MothArray<__Mothint> out;__Mothint i;step = 1;
size = __MothBaseSLASH(__MothBaseMINUS(stop,start),step);
out = newArray<__Mothint>(1,size);
for (i = 0;i < size;i = i + 1){

__MothArrayINDEX(out,1,i) = __MothBasePLUS(__MothBaseSTAR(i,step),start);

}

return out;

}

template <class arr_t>
__MothArray<arr_t> __MothnmMotharange(__Mothint stop){
__Mothint step;__Mothint start;__Mothint size;__MothArray<arr_t> out;__Mothint i;step = 1;
start = 0;
size = __MothBaseSLASH(__MothBaseMINUS(stop,start),step);
out = newArray<arr_t>(1,size);
for (i = 0;i < size;i = i + 1){

__MothArrayINDEX(out,1,i) = __MothBasePLUS(__MothBaseSTAR(i,step),start);

}

return out;

}

__MothArray<__Mothint> __MothnmMotharange(__Mothint stop){
__Mothint step;__Mothint start;__Mothint size;__MothArray<__Mothint> out;__Mothint i;step = 1;
start = 0;
size = __MothBaseSLASH(__MothBaseMINUS(stop,start),step);
out = newArray<__Mothint>(1,size);
for (i = 0;i < size;i = i + 1){

__MothArrayINDEX(out,1,i) = __MothBasePLUS(__MothBaseSTAR(i,step),start);

}

return out;

}

template <class arr_t>
__MothArray<arr_t> __MothnmMothlinspace(__Mothdouble start,__Mothdouble stop,__Mothint num){
__MothArray<arr_t> out;__Mothdouble scale;__Mothint i;out = newArray<arr_t>(1,num);
scale = __MothBaseSLASH(__MothBaseMINUS(stop,start),(__Mothdouble)(__MothBaseMINUS(num,1)));
for (i = 0;i < num;i = i + 1){

__MothArrayINDEX(out,1,i) = __MothBasePLUS(__MothBaseSTAR(i,scale),start);

}

return out;

}

__MothArray<__Mothdouble> __MothnmMothlinspace(__Mothdouble start,__Mothdouble stop,__Mothint num){
__MothArray<__Mothdouble> out;__Mothdouble scale;__Mothint i;out = newArray<__Mothdouble>(1,num);
scale = __MothBaseSLASH(__MothBaseMINUS(stop,start),(__Mothdouble)(__MothBaseMINUS(num,1)));
for (i = 0;i < num;i = i + 1){

__MothArrayINDEX(out,1,i) = __MothBasePLUS(__MothBaseSTAR(i,scale),start);

}

return out;

}

template <class arr_t>
__MothArray<arr_t> __MothnmMothlinspace(__Mothdouble start,__Mothdouble stop){
__Mothint num;__MothArray<arr_t> out;__Mothdouble scale;__Mothint i;num = 50;
out = newArray<arr_t>(1,num);
scale = __MothBaseSLASH(__MothBaseMINUS(stop,start),(__Mothdouble)(__MothBaseMINUS(num,1)));
for (i = 0;i < num;i = i + 1){

__MothArrayINDEX(out,1,i) = __MothBasePLUS(__MothBaseSTAR(i,scale),start);

}

return out;

}

__MothArray<__Mothdouble> __MothnmMothlinspace(__Mothdouble start,__Mothdouble stop){
__Mothint num;__MothArray<__Mothdouble> out;__Mothdouble scale;__Mothint i;num = 50;
out = newArray<__Mothdouble>(1,num);
scale = __MothBaseSLASH(__MothBaseMINUS(stop,start),(__Mothdouble)(__MothBaseMINUS(num,1)));
for (i = 0;i < num;i = i + 1){

__MothArrayINDEX(out,1,i) = __MothBasePLUS(__MothBaseSTAR(i,scale),start);

}

return out;

}

__Mothdouble __MothnmMothmax(__MothArray<__Mothdouble> arr){
__Mothint start;__Mothint i;start = __MothArrayINDEX(arr,1,0);
for (i = 0;i < __MothTupleINDEX(arr.shape,1,0);i = i + 1){

if (__MothBaseGREATER(__MothArrayINDEX(arr,1,i),start)){
start = __MothArrayINDEX(arr,1,i);

}


}

return start;

}

__Mothdouble __MothnmMothmin(__MothArray<__Mothdouble> arr){
__Mothint start;__Mothint i;start = __MothArrayINDEX(arr,1,0);
for (i = 0;i < __MothTupleINDEX(arr.shape,1,0);i = i + 1){

if (__MothBaseLESS(__MothArrayINDEX(arr,1,i),start)){
start = __MothArrayINDEX(arr,1,i);

}


}

return start;

}

__Mothdouble Mothdot(__MothArray<__Mothdouble> a,__MothArray<__Mothdouble> b){
if (__MothBaseNOT_EQUAL(a.shape,b.shape)){
MoththrowErr(convString("Shapes not equal in \\dot\n"));

}

return __MothBaseSTAR(a,b).Mothsum();

}
class __MothObjectmpi_datatype{
public:
MPI_Datatype raw_type;__Mothvoid Mothset(MPI_Datatype input){
raw_type = input;

}


};
class __MothObjectmpi_comm{
public:
MPI_Comm raw_comm;__Mothvoid Moth__init__(MPI_Comm w_comm){
raw_comm = w_comm;

}


};
__Mothvoid __MothmpiMothinit(__MothArray<__Mothint> argc,__MothArray<__Mothchar> argv){
MPI_Init(NULL,NULL);

}

__Mothvoid __MothmpiMothinit(){
MPI_Init(NULL,NULL);

}

__MothObjectmpi_comm __MothmpiMothget_comm_world(){
__MothObjectmpi_comm out;out.Moth__init__(MPI_COMM_WORLD);
return out;

}

__Mothint __MothmpiMothcomm_size(__MothObjectmpi_comm w_comm){
__Mothint world_size;world_size = 0;
MPI_Comm_size(w_comm.raw_comm,&world_size);
return world_size;

}

__Mothint __MothmpiMothcomm_rank(__MothObjectmpi_comm w_comm){
__Mothint world_rank;world_rank = 0;
MPI_Comm_rank(w_comm.raw_comm,&world_rank);
return world_rank;

}

__MothArray<__Mothint> __MothmpiMothdims_create(__Mothint world_size,__Mothint ndims){
__MothArray<__Mothint> dims;dims = newArray<__Mothint>(1,ndims);
dims.Mothzero();
MPI_Dims_create(world_size,ndims,dims.raw.get());
return dims;

}

__MothObjectmpi_datatype __MothmpiMothtype_contiguous(__Mothint size){
__MothObjectmpi_datatype mpitype;MPI_Type_contiguous(size,MPI_BYTE,&mpitype.raw_type);
MPI_Type_commit(&mpitype.raw_type);
return mpitype;

}

__Mothvoid __MothmpiMothtype_commit(__MothObjectmpi_datatype mpitype){
MPI_Type_commit(&mpitype.raw_type);

}

__Mothvoid __MothmpiMothtype_free(__MothObjectmpi_datatype mpitype){
MPI_Type_free(&mpitype.raw_type);

}

__Mothvoid __MothmpiMothbarrier(__MothObjectmpi_comm w_comm){
MPI_Barrier(w_comm.raw_comm);

}

__Mothvoid __MothmpiMothalltoall(__MothArray<__Mothdouble> input,__Mothint nsends1,__MothObjectmpi_datatype type1,__MothArray<__Mothdouble> output,__Mothint nsends2,__MothObjectmpi_datatype type2,__MothObjectmpi_comm w_comm){
MPI_Alltoall(input.raw.get(),nsends1,type1.raw_type,output.raw.get(),nsends2,type2.raw_type,w_comm.raw_comm);

}

__Mothvoid __MothmpiMothalltoall(__MothArray<__Mothint> input,__Mothint nsends1,__MothObjectmpi_datatype type1,__MothArray<__Mothint> output,__Mothint nsends2,__MothObjectmpi_datatype type2,__MothObjectmpi_comm w_comm){
MPI_Alltoall(input.raw.get(),nsends1,type1.raw_type,output.raw.get(),nsends2,type2.raw_type,w_comm.raw_comm);

}

__Mothvoid __MothmpiMothfinalize(){
MPI_Finalize();

}

class __MothObjectDistribution{
public:
__Mothint ng;__Mothint world_size;__Mothint world_rank;__Mothint nlocal;__Mothbool verbose;__MothArray<__Mothint> dims;__MothArray<__Mothint> coords;__MothArray<__Mothint> local_grid_size;__MothArray<__Mothint> local_coordinates_start;__MothObjectmpi_datatype fft_t;__MothObjectmpi_comm comm_world;__MothArray<__Mothint> Mothget_coords(){
__MothArray<__Mothint> out;out = newArray<__Mothint>(1,3);
__MothArrayINDEX(out,1,0) = __MothBaseSLASH(world_rank,__MothBaseSTAR(__MothArrayINDEX(dims,1,1),__MothArrayINDEX(dims,1,2)));
__MothArrayINDEX(out,1,1) = __MothBaseSLASH(__MothBaseMINUS(world_rank,__MothBaseSTAR(__MothArrayINDEX(out,1,0),__MothBaseSTAR(__MothArrayINDEX(dims,1,1),__MothArrayINDEX(dims,1,2)))),__MothArrayINDEX(dims,1,2));
__MothArrayINDEX(out,1,2) = __MothBaseMINUS(__MothBaseMINUS(world_rank,__MothBaseSTAR(__MothArrayINDEX(out,1,0),__MothBaseSTAR(__MothArrayINDEX(dims,1,1),__MothArrayINDEX(dims,1,2)))),__MothBaseSTAR(__MothArrayINDEX(out,1,1),__MothArrayINDEX(dims,1,2)));
return out;

}

__MothArray<__Mothint> Mothget_local_grid(){
return __MothBaseSLASH(ng,dims);

}

__MothArray<__Mothint> Mothget_local_grid_start(){
return __MothBaseSTAR(local_grid_size,coords);

}

__Mothvoid MothgetZPencils(__MothArray<__Mothdouble> buff1,__MothArray<__Mothdouble> buff2){
__Mothint nsends;nsends = __MothBaseSTAR(__MothBaseSLASH(__MothBaseSTAR(__MothArrayINDEX(local_grid_size,1,0),__MothArrayINDEX(local_grid_size,1,1)),world_size),__MothArrayINDEX(local_grid_size,1,2));
__MothmpiMothalltoall(buff1,nsends,fft_t,buff2,nsends,fft_t,comm_world);
Mothz_a2a_to_z_pencils(buff2,buff1,world_size,nlocal,local_grid_size,dims);

}

__Mothvoid MothreturnZPencils(__MothArray<__Mothdouble> buff1,__MothArray<__Mothdouble> buff2){
__Mothint nsends;nsends = __MothBaseSTAR(__MothBaseSLASH(__MothBaseSTAR(__MothArrayINDEX(local_grid_size,1,0),__MothArrayINDEX(local_grid_size,1,1)),world_size),__MothArrayINDEX(local_grid_size,1,2));
Mothz_pencils_to_z_a2a(buff2,buff1,world_size,nlocal,local_grid_size,dims);
__MothmpiMothalltoall(buff1,nsends,fft_t,buff2,nsends,fft_t,comm_world);

}

__Mothvoid MothgetXPencils(__MothArray<__Mothdouble> buff1,__MothArray<__Mothdouble> buff2){
__Mothint nsends;nsends = __MothBaseSTAR(__MothBaseSLASH(__MothBaseSTAR(__MothArrayINDEX(local_grid_size,1,2),__MothArrayINDEX(local_grid_size,1,1)),world_size),__MothArrayINDEX(local_grid_size,1,0));
Mothfast_z_to_x(buff2,buff1,local_grid_size);
__MothmpiMothalltoall(buff1,nsends,fft_t,buff2,nsends,fft_t,comm_world);
Mothx_a2a_to_x_pencils(buff2,buff1,world_size,nlocal,local_grid_size,dims);

}

__Mothvoid MothreturnXPencils(__MothArray<__Mothdouble> buff1,__MothArray<__Mothdouble> buff2){
__Mothint nsends;nsends = __MothBaseSTAR(__MothBaseSLASH(__MothBaseSTAR(__MothArrayINDEX(local_grid_size,1,2),__MothArrayINDEX(local_grid_size,1,1)),world_size),__MothArrayINDEX(local_grid_size,1,0));
Mothx_pencils_to_x_a2a(buff2,buff1,world_size,nlocal,local_grid_size,dims);
__MothmpiMothalltoall(buff1,nsends,fft_t,buff2,nsends,fft_t,comm_world);

}

__Mothvoid MothgetYPencils(__MothArray<__Mothdouble> buff1,__MothArray<__Mothdouble> buff2){
__Mothint nsends;nsends = __MothBaseSTAR(__MothBaseSLASH(__MothBaseSTAR(__MothArrayINDEX(local_grid_size,1,2),__MothArrayINDEX(local_grid_size,1,0)),world_size),__MothArrayINDEX(local_grid_size,1,1));
Mothfast_x_to_y(buff2,buff1,local_grid_size);
__MothmpiMothalltoall(buff1,nsends,fft_t,buff2,nsends,fft_t,comm_world);
Mothy_a2a_to_y_pencils(buff2,buff1,world_size,nlocal,local_grid_size,dims);

}

__Mothvoid MothreturnYPencils(__MothArray<__Mothdouble> buff1,__MothArray<__Mothdouble> buff2){
__Mothint nsends;nsends = __MothBaseSTAR(__MothBaseSLASH(__MothBaseSTAR(__MothArrayINDEX(local_grid_size,1,2),__MothArrayINDEX(local_grid_size,1,0)),world_size),__MothArrayINDEX(local_grid_size,1,1));
Mothy_pencils_to_y_a2a(buff2,buff1,world_size,nlocal,local_grid_size,dims);
__MothmpiMothalltoall(buff1,nsends,fft_t,buff2,nsends,fft_t,comm_world);
Mothfast_y_to_z(buff2,buff1,local_grid_size);

}

__Mothvoid Moth__init__(__Mothint input_ng){
verbose = false;
comm_world = __MothmpiMothget_comm_world();
ng = input_ng;
world_size = __MothmpiMothcomm_size(comm_world);
world_rank = __MothmpiMothcomm_rank(comm_world);
dims = __MothmpiMothdims_create(world_size,3);
coords = Mothget_coords();
local_grid_size = Mothget_local_grid();
local_coordinates_start = Mothget_local_grid_start();
nlocal = __MothBaseSTAR(__MothBaseSTAR(__MothArrayINDEX(local_grid_size,1,0),__MothArrayINDEX(local_grid_size,1,1)),__MothArrayINDEX(local_grid_size,1,2));
fft_t = __MothmpiMothtype_contiguous(__MothBaseSTAR(8,2));
if (verbose){
__Mothint rank;if (__MothBaseEQUAL(world_rank,0)){
__MothPrint(convString("World Size: "));__MothPrint(world_size);__MothPrint(convString("\n"));
__MothPrint(convString("Ng: "));__MothPrint(ng);__MothPrint(convString("\n"));
__MothPrint(convString("Dims: ["));__MothPrint(__MothArrayINDEX(dims,1,0));__MothPrint(convString(","));__MothPrint(__MothArrayINDEX(dims,1,1));__MothPrint(convString(","));__MothPrint(__MothArrayINDEX(dims,1,2));__MothPrint(convString("]\n"));
__MothPrint(convString("Grid: ["));__MothPrint(__MothArrayINDEX(local_grid_size,1,0));__MothPrint(convString(","));__MothPrint(__MothArrayINDEX(local_grid_size,1,1));__MothPrint(convString(","));__MothPrint(__MothArrayINDEX(local_grid_size,1,2));__MothPrint(convString("]\n"));
__MothPrint(convString("nlocal: "));__MothPrint(nlocal);__MothPrint(convString("\n"));

}

__MothmpiMothbarrier(comm_world);
for (rank = 0;rank < world_size;rank = rank + 1){

if (__MothBaseEQUAL(rank,world_rank)){
__MothPrint(convString("Rank "));__MothPrint(rank);__MothPrint(convString(":\n   Coords: "));__MothPrint(coords);
__MothPrint(convString("   Start: "));__MothPrint(local_coordinates_start);

}

__MothmpiMothbarrier(comm_world);

}

__MothmpiMothbarrier(comm_world);

}


}


};
__Mothfloat __MothmathMothacosf(__Mothfloat inp){
return acosf(inp);

}

__Mothdouble __MothmathMothacos(__Mothdouble inp){
return acos(inp);

}

__Mothfloat __MothmathMothasinf(__Mothfloat inp){
return asinf(inp);

}

__Mothdouble __MothmathMothasin(__Mothdouble inp){
return asin(inp);

}

__Mothfloat __MothmathMothatanf(__Mothfloat inp){
return atanf(inp);

}

__Mothdouble __MothmathMothatan(__Mothdouble inp){
return atan(inp);

}

__Mothfloat __MothmathMothatan2f(__Mothfloat inp1,__Mothfloat inp2){
return atan2f(inp1,inp2);

}

__Mothdouble __MothmathMothatan2(__Mothdouble inp1,__Mothdouble inp2){
return atan2(inp1,inp2);

}

__Mothfloat __MothmathMothcosf(__Mothfloat inp){
return cosf(inp);

}

__Mothdouble __MothmathMothcos(__Mothdouble inp){
return cos(inp);

}

__Mothfloat __MothmathMothcoshf(__Mothfloat inp){
return coshf(inp);

}

__Mothdouble __MothmathMothcosh(__Mothdouble inp){
return cosh(inp);

}

__Mothfloat __MothmathMothsinf(__Mothfloat inp){
return sinf(inp);

}

__Mothdouble __MothmathMothsin(__Mothdouble inp){
return sin(inp);

}

__Mothfloat __MothmathMothsinhf(__Mothfloat inp){
return sinhf(inp);

}

__Mothdouble __MothmathMothsinh(__Mothdouble inp){
return sinh(inp);

}

__Mothfloat __MothmathMothtanhf(__Mothfloat inp){
return tanhf(inp);

}

__Mothdouble __MothmathMothtanh(__Mothdouble inp){
return tanh(inp);

}

__Mothfloat __MothmathMothexpf(__Mothfloat inp){
return expf(inp);

}

__Mothdouble __MothmathMothexp(__Mothdouble inp){
return exp(inp);

}

__Mothfloat __MothmathMothlogf(__Mothfloat inp){
return logf(inp);

}

__Mothdouble __MothmathMothlog(__Mothdouble inp){
return log(inp);

}

__Mothfloat __MothmathMothlog10f(__Mothfloat inp){
return log10f(inp);

}

__Mothdouble __MothmathMothlog10(__Mothdouble inp){
return log10(inp);

}

__Mothfloat __MothmathMothpowf(__Mothfloat inp1,__Mothfloat inp2){
return powf(inp1,inp2);

}

__Mothdouble __MothmathMothpow(__Mothdouble inp1,__Mothdouble inp2){
return pow(inp1,inp2);

}

__Mothfloat __MothmathMothfabsf(__Mothfloat inp){
return fabsf(inp);

}

__Mothdouble __MothmathMothfabs(__Mothdouble inp){
return fabs(inp);

}

__Mothfloat __MothmathMothfmodf(__Mothfloat inp1,__Mothfloat inp2){
return fmodf(inp1,inp2);

}

__Mothdouble __MothmathMothfmod(__Mothdouble inp1,__Mothdouble inp2){
return fmod(inp1,inp2);

}

__Mothfloat __MothmathMothsqrtf(__Mothfloat inp){
return sqrtf(inp);

}

__Mothdouble __MothmathMothsqrt(__Mothdouble inp){
return sqrt(inp);

}

__Mothfloat __MothmathMothceilf(__Mothfloat inp){
return ceilf(inp);

}

__Mothdouble __MothmathMothceil(__Mothdouble inp){
return ceil(inp);

}

__Mothfloat __MothmathMothfloorf(__Mothfloat inp){
return floorf(inp);

}

__Mothdouble __MothmathMothfloor(__Mothdouble inp){
return floor(inp);

}

class __MothObjectplan{
public:
fftw_plan raw;__Mothvoid Moth__init__(){

}


};
__Mothint __MothfftwMothforward(){
return FFTW_FORWARD;

}

__Mothint __MothfftwMothbackward(){
return FFTW_BACKWARD;

}

__Mothuint __MothfftwMothmeasure(){
return FFTW_MEASURE;

}

__MothObjectplan __MothfftwMothplan_many_dft(__Mothint rank,__MothArray<__Mothint> n,__Mothint howmany,__MothArray<__Mothdouble> inp,__MothArray<__Mothint> inembed,__Mothint istride,__Mothint idist,__MothArray<__Mothdouble> out,__MothArray<__Mothint> onembed,__Mothint ostride,__Mothint odist,__Mothint sign,__Mothuint flags){
__MothObjectplan new_plan;new_plan.Moth__init__();
new_plan.raw = fftw_plan_many_dft(rank,n.raw.get(),howmany,reinterpret_cast<double(*)[2]>(inp.raw.get()),NULL,istride,idist,reinterpret_cast<double(*)[2]>(out.raw.get()),NULL,ostride,odist,sign,flags);
return new_plan;

}

__Mothvoid __MothfftwMothexecute(__MothObjectplan in_plan){
fftw_execute(in_plan.raw);

}

__Mothvoid __MothfftwMothdestroy_plan(__MothObjectplan in_plan){
fftw_destroy_plan(in_plan.raw);

}

class __MothObjectDfft{
public:
__MothObjectDistribution dist;__Mothint nFFTs;__MothArray<__Mothint> n;__MothObjectplan f12;__MothObjectplan b12;__Mothvoid Moth__init__(__MothObjectDistribution in_dist){
dist = in_dist;

}

__Mothvoid Mothmake_plans(__MothArray<__Mothdouble> buff1,__MothArray<__Mothdouble> buff2){
nFFTs = __MothBaseSLASH(dist.nlocal,dist.ng);
n = __MothnmMothzeros(1);
__MothArrayINDEX(n,1,0) = dist.ng;
f12 = __MothfftwMothplan_many_dft(1,n,nFFTs,buff1,NULL,1,dist.ng,buff2,NULL,1,dist.ng,__MothfftwMothforward(),__MothfftwMothmeasure());
b12 = __MothfftwMothplan_many_dft(1,n,nFFTs,buff1,NULL,1,dist.ng,buff2,NULL,1,dist.ng,__MothfftwMothbackward(),__MothfftwMothmeasure());

}

__Mothvoid Mothforward(__MothArray<__Mothdouble> buff1,__MothArray<__Mothdouble> buff2){
dist.MothgetZPencils(buff1,buff2);
__MothfftwMothexecute(f12);
dist.MothreturnZPencils(buff1,buff2);
dist.MothgetXPencils(buff1,buff2);
__MothfftwMothexecute(f12);
dist.MothreturnXPencils(buff1,buff2);
dist.MothgetYPencils(buff1,buff2);
__MothfftwMothexecute(f12);
dist.MothreturnYPencils(buff1,buff2);

}

__Mothvoid Mothbackward(__MothArray<__Mothdouble> buff1,__MothArray<__Mothdouble> buff2){
dist.MothgetZPencils(buff1,buff2);
__MothfftwMothexecute(b12);
dist.MothreturnZPencils(buff1,buff2);
dist.MothgetXPencils(buff1,buff2);
__MothfftwMothexecute(b12);
dist.MothreturnXPencils(buff1,buff2);
dist.MothgetYPencils(buff1,buff2);
__MothfftwMothexecute(b12);
dist.MothreturnYPencils(buff1,buff2);

}

__Mothvoid Mothfinalize(){
__MothfftwMothdestroy_plan(f12);
__MothfftwMothdestroy_plan(b12);

}


};
__Mothint Mothmain(){
__Mothint Ng;__MothObjectDistribution dist;__MothObjectDfft dfft;__MothArray<__Mothdouble> buff1;__MothArray<__Mothdouble> buff2;__MothmpiMothinit();
Ng = 8;
dist.Moth__init__(Ng);
dfft.Moth__init__(dist);
buff1 = __MothnmMothzeros(newTuple<__Mothint>(2,dfft.dist.nlocal,2));
buff2 = __MothnmMothzeros(newTuple<__Mothint>(2,dfft.dist.nlocal,2));
dfft.Mothmake_plans(buff1,buff2);
if (__MothBaseEQUAL(dfft.dist.world_rank,0)){
__MothArrayINDEX(buff1,2,0,0) = 1;
__MothPrint(convString("TESTING\n"));

}

dfft.Mothforward(buff1,buff2);
if (__MothBaseEQUAL(dist.world_rank,0)){
__MothPrint(convString("K-SPACE\n"));
__MothPrint(convString("Real in: ["));__MothPrint(__MothnmMothmin(__MothGetSlice(buff1,6,0,buff1.dims.get()[0],1,0,0,0)));__MothPrint(convString(","));__MothPrint(__MothnmMothmax(__MothGetSlice(buff1,6,0,buff1.dims.get()[0],1,0,0,0)));__MothPrint(convString("], Imag in: ["));__MothPrint(__MothnmMothmin(__MothGetSlice(buff1,6,0,buff1.dims.get()[0],1,1,1,0)));__MothPrint(convString(","));__MothPrint(__MothnmMothmax(__MothGetSlice(buff1,6,0,buff1.dims.get()[0],1,1,1,0)));__MothPrint(convString("]\n"));
__MothPrint(convString("[0,0,0] = "));__MothPrint(__MothArrayINDEX(buff1,2,0,0));__MothPrint(convString(" + "));__MothPrint(__MothArrayINDEX(buff1,2,0,1));__MothPrint(convString("i\n"));

}

dfft.Mothbackward(buff1,buff2);
if (__MothBaseEQUAL(dist.world_rank,0)){
__MothPrint(convString("R-SPACE\n"));
__MothPrint(convString("Real in: ["));__MothPrint(__MothnmMothmin(__MothGetSlice(buff1,6,0,buff1.dims.get()[0],1,0,0,0)));__MothPrint(convString(","));__MothPrint(__MothnmMothmax(__MothGetSlice(buff1,6,0,buff1.dims.get()[0],1,0,0,0)));__MothPrint(convString("], Imag in: ["));__MothPrint(__MothnmMothmin(__MothGetSlice(buff1,6,0,buff1.dims.get()[0],1,1,1,0)));__MothPrint(convString(","));__MothPrint(__MothnmMothmax(__MothGetSlice(buff1,6,0,buff1.dims.get()[0],1,1,1,0)));__MothPrint(convString("]\n"));
__MothPrint(convString("[0,0,0] = "));__MothPrint(__MothArrayINDEX(buff1,2,0,0));__MothPrint(convString(" + "));__MothPrint(__MothArrayINDEX(buff1,2,0,1));__MothPrint(convString("i\n"));

}

dfft.Mothfinalize();
__MothmpiMothfinalize();
return 0;

}

int main() {I.real = 0; I.imag = 1; return Mothmain();}
