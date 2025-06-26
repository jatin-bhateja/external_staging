export LD_LIBRARY_PATH=/home/jatinbha/sandboxes/applications.compilers.source.gnu-toolchain.gcc/build-dir/lib64/:$LD_LIBRARY_PATH 
export PATH=/home/jatinbha/sandboxes/applications.compilers.source.gnu-toolchain.gcc/build-dir/bin/:$PATH
export PATH=/home/jatinbha/sandboxes/applications.compilers.source.gnu-toolchain.binutils/build-dir/bin/:$PATH
#g++ test.cxx -S -mapxf
#as test.s -o test.o 
#g++ test.o -lpthread -o app
sde64 -dmr -- ./app 8

