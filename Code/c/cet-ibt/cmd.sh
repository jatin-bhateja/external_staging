clang-10 -march=icelake-server -fcf-protection=full  -Xclang -disable-O0-optnone cpuid.c -mllvm -print-after-all >& log.txt
