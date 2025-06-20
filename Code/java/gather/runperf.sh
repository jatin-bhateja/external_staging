#!/bin/sh
rm -rf log*.txt
for SPECIES in 64 128 256 512 PREFERRED
do
  for SUBWORD_TYPE_PRIM in short byte
  do
     javac --add-modules=jdk.incubator.vector gather${SUBWORD_TYPE_PRIM}_${SPECIES}.java
  done
done


RUN_NUM=$(cat ./.run_number)
RES=$([ -d perf_runs ])
if [ $? == 1 ]; then
   mkdir perf_runs
fi
RES=$([ -d perf_runs/data_${RUN_NUM} ])
if [ $? == 1 ]; then
  mkdir -p perf_runs/data_${RUN_NUM}
fi

for AVX_LEVEL in 0 1 2 3
do 
  for SPECIES in 64 128 256 512 PREFERRED
  do
    for SUBWORD_TYPE_PRIM in short byte
    do
       echo "AVXLEVEL = ${AVX_LEVEL} , SPECIES = $SPECIES , SUBWORD_TYPE_PRIM = $SUBWORD_TYPE_PRIM"
       echo "${SUBWORD_TYPE_PRIM}_${SPECIES}_AVX${AVX_LEVEL} =>" >> log_${1}.txt
       java -XX:UseAVX=${AVX_LEVEL} -XX:-TieredCompilation -XX:+UseOnStackReplacement --add-modules=jdk.incubator.vector -cp . gather${SUBWORD_TYPE_PRIM}_${SPECIES} >> log_${1}.txt
    done
  done
done

sudo mv log_${1}.txt perf_runs/data_${RUN_NUM}
NEW_RUN_NUM=$( expr $RUN_NUM + 1)
sudo cat $NEW_RUN_NUM >& ./.run_number
