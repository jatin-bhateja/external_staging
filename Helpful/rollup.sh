#!/bin/sh


echo "BINARY : $1"
rm -rf $1*.csv

echo "REP MVSSTOS"

CTR=1
FILE=$1_rep_stos.csv
echo "SNo , SZ_MULT , BYTES, INST, CYCLES, SEC" >> $FILE
#for i in $(seq 0.01 0.01 1)
for (( i = 16 ; $i <= 32768 ; i = $i * 2 ))
do
   MULT=$(echo "$i / 32768" | bc -l)
   numactl --cpunodebind=0 --membind=0 perf stat  ./$1 0 $MULT 0 >&  /tmp/1
   CYCLES=$( grep "cycles" /tmp/1  | awk {'print $1}')
   INST=$(grep "instruction" /tmp/1  | awk {'print $1}')
   SEC=$( grep "seconds time" /tmp/1  | awk {'print $1}')
   BYTES=$i
   echo "SZ_MULT $MULT ($BYTES bytes) -> CYCLES = $CYCLES , INSTS = $INST , TIME(sec) = $SEC"
   echo "$CTR , $MULT , $BYTES, $INST, $CYCLES, $SEC" >> $FILE
   CTR=$(echo $CTR + 1 | bc -l)
done

echo "VECTOR LOOP"

CTR=1
FILE=$1_vec_loop.csv
echo "SNo , SZ_MULT , BYTES, INST, CYCLES, SEC" >> $FILE
#for i in $(seq 0.01 0.01 1)
for (( i = 16 ; $i <= 32768 ; i = $i * 2 ))
do
   MULT=$(echo "$i / 32768" | bc -l)
   numactl --cpunodebind=0 --membind=0 perf stat  ./$1 0 $MULT 1 >&  /tmp/1
   CYCLES=$( grep "cycles" /tmp/1  | awk {'print $1}')
   INST=$(grep "instruction" /tmp/1  | awk {'print $1}')
   SEC=$( grep "seconds time" /tmp/1  | awk {'print $1}')
   BYTES=$i
   echo "SZ_MULT $MULT ($BYTES bytes) -> CYCLES = $CYCLES , INSTS = $INST , TIME(sec) = $SEC"
   echo "$CTR , $MULT , $BYTES, $INST, $CYCLES, $SEC" >> $FILE
   CTR=$(echo $CTR + 1 | bc -l)
done

