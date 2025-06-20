#!/bin/sh

echo "Compiling pintool $1"

TOOL=$1
OBJ=$(echo $1 | awk -F. '{print $1}')

sudo g++ -Wall -Werror -Wno-unknown-pragmas -DPIN_CRT=1 -fno-stack-protector -fno-exceptions -funwind-tables -fasynchronous-unwind-tables -fno-rtti -DTARGET_IA32E -DHOST_IA32E -fPIC -DTARGET_LINUX -fabi-version=2 -faligned-new  -I/home/jatinbha/softwares/pin-external-3.31-98869-gfa6f126a8-gcc-linux/source/include/pin -I/home/jatinbha/softwares/pin-external-3.31-98869-gfa6f126a8-gcc-linux/source/include/pin/gen -isystem /home/jatinbha/softwares/pin-external-3.31-98869-gfa6f126a8-gcc-linux/extras/cxx/include -isystem /home/jatinbha/softwares/pin-external-3.31-98869-gfa6f126a8-gcc-linux/extras/crt/include -isystem /home/jatinbha/softwares/pin-external-3.31-98869-gfa6f126a8-gcc-linux/extras/crt/include/arch-x86_64 -isystem /home/jatinbha/softwares/pin-external-3.31-98869-gfa6f126a8-gcc-linux/extras/crt/include/kernel/uapi -isystem /home/jatinbha/softwares/pin-external-3.31-98869-gfa6f126a8-gcc-linux/extras/crt/include/kernel/uapi/asm-x86 -I/home/jatinbha/softwares/pin-external-3.31-98869-gfa6f126a8-gcc-linux/extras/components/include -I/home/jatinbha/softwares/pin-external-3.31-98869-gfa6f126a8-gcc-linux/extras/xed-intel64/include/xed -I/home/jatinbha/softwares/pin-external-3.31-98869-gfa6f126a8-gcc-linux/source/tools/Utils -I/home/jatinbha/softwares/pin-external-3.31-98869-gfa6f126a8-gcc-linux/source/tools/InstLib -O3 -fomit-frame-pointer -fno-strict-aliasing  -Wno-dangling-pointer  -c -o ${OBJ}.o $1

sudo g++ -shared -Wl,--hash-style=sysv /home/jatinbha/softwares/pin-external-3.31-98869-gfa6f126a8-gcc-linux/intel64/runtime/pincrt/crtbeginS.o -Wl,-Bsymbolic -Wl,--version-script=/home/jatinbha/softwares/pin-external-3.31-98869-gfa6f126a8-gcc-linux/source/include/pin/pintool.ver -fabi-version=2    -o ${OBJ}.so ${OBJ}.o  -L/home/jatinbha/softwares/pin-external-3.31-98869-gfa6f126a8-gcc-linux/intel64/runtime/pincrt -L/home/jatinbha/softwares/pin-external-3.31-98869-gfa6f126a8-gcc-linux/intel64/lib -L/home/jatinbha/softwares/pin-external-3.31-98869-gfa6f126a8-gcc-linux/intel64/lib-ext -L/home/jatinbha/softwares/pin-external-3.31-98869-gfa6f126a8-gcc-linux/extras/xed-intel64/lib -lpin -lxed /home/jatinbha/softwares/pin-external-3.31-98869-gfa6f126a8-gcc-linux/intel64/runtime/pincrt/crtendS.o -lpindwarf -ldwarf  -ldl-dynamic -nostdlib -lc++ -lc++abi -lm-dynamic -lc-dynamic -lunwind-dynamic

echo "Generated Pintool : ${OBJ}.so"
echo "Execute: pin -t <tool> -- <app> <app_args>"
