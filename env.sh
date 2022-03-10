# Add any `module load` or `export` commands that your code needs to
# compile and run to this file.
export OMP_NUM_THREADS=16
export OMP_PROC_BINDS=close
export OMP_PLACES=cores
module load languages/intel/2020-u4