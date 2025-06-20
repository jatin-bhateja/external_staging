#/bin/bash

for ir in $(grep IRNode ${1} awk -F ',' 'print $1}' | awk -F '\.' '{print $2}' | uniq)
do 
   get_c2_ir_targets.sh  $ir
done
