#!/bin/bash
#########################################################################################################
source /opt/intel/sep/sep_vars.sh

function pause(){
   read -p "$*"
}


DC_TYPE=$1
OUTDIR=$PWD
RUNNUM=$2
R_TYPE="DATA"
JVM=$3


echo `pwd`
date
echo "Type of collection: $DC_TYPE"
echo "Output Directory: $OUTDIR"
echo "Run number is: $RUNNUM"
echo "JAVA_HOME    : $JAVA_HOME"

LookForTag="Warmup.*result:"


# create data collection stuff  (SEP, EMON, ALL)
sleep 10
#SA=10000


touch $OUTDIR/${RUNNUM}.txt 
tail -f  $OUTDIR/${RUNNUM}.txt | while read line ; do
      echo "$line" | grep "$LookForTag"
      if [ $? = 0 ]; then
      echo `killall tail`
      date
      fi
done

echo "Launching the data collection"

#echo "***********DOC TYPE IS $DC_TYPE"

#if [ "$DC_TYPE" == "PAT" ]; then
#      echo "Doing PAT data collection"
#      /workloads/PAT/PAT-collecting-data/pat_run.sh
#      echo "Collected PAT data"
#fi

if [ $DC_TYPE == "SEP" ]; then
  cp $JAVA_HOME/lib/server/libjvm.so .
  cp /boot/System.map-3.10.0-957.el7.x86_64 .
  cp /workloads/SPECjbb2015/fs2xl.exe .
  SEP="-agentpath:/workloads/JVM/libjvmtisym/libjvmtisym.so=ofile=$BE_NAME.jsym"
fi

if [ $DC_TYPE == "EDP" ]; then
    sleep 5
    date
    echo " Doing EDP data collection for 10s"
    emon -M >$RUNNUM.emon-m.dat
    emon -v >>$RUNNUM.emon-v.dat
    emon -i /workloads/SPECjbb2015/clx-2s-events.txt >>$RUNNUM.emon.dat &
    sleep 10
    killall emon
    sleep 1
    pkill -9 emon

    #sleep 5
    #/workloads/SPECjbb2015/AEPWatch_0.2/bin/AEPWatch 1 120 -f $RUNNUM.AEPWatch.csv 

elif [ $DC_TYPE == "SEP" ]; then
    echo " Do SEP collection now"
    date
    echo "Launching SEP collection" 
    echo "sep -start -d 10 -out $OUTDIR/${RUNNUM}.AVX.sep"
    sep -start -d 10 -out $OUTDIR/${RUNNUM}.AVX.sep
    date
    date +'%m%d%H%M%S' > end_of_samples.txt

elif [ $DC_TYPE == "PAT" ]; then
    echo "Doing PAT Data collection"
    /workloads/PAT/PAT-collecting-data/pat_run
    echo "PAT data collection completed"

elif [ $DC_TYPE == "PERF" ]; then
    echo " Do PERF collection now"
    date
    #setting java and perf-map path for flamegraph generation
    sed -i -e "s/JAVA_HOME=\${JAVA_HOME:-.*/JAVA_HOME=\${JAVA_HOME:-\/workloads\/JVM\/$JVM}/g" ../../../FlameGraph/jmaps
    sed -i -e "s/AGENT_HOME=\${AGENT_HOME:-.*/AGENT_HOME=\${AGENT_HOME:-\/workloads\/PerfMapAgents\/$JVM\/perf-map-agent}/g" ../../../FlameGraph/jmaps

    echo "Launching PERF collection"
    echo " perf record -F 99 -a  -g -- sleep 60"
    
    
    perf record -F 99 -a -g -- sleep 60;
    ../../../FlameGraph/jmaps
    
    echo "Creating Flamegraphs"
    perf script | ../../../FlameGraph/stackcollapse-perf.pl > out.perf-folded
    ../../../FlameGraph/flamegraph.pl --color=java --hash out.perf-folded > flamegraph.svg
    echo "Perf data collection and Flamegraph creation complete"

elif [ $DC_TYPE == "ALL" ]; then
    echo " Doing EDP and SEP data collection"

    vmstat -nt 1 > $RUN_NUM.vmstat.log &

    echo " Doing EDP data collectio for 60s"
    emon -M >$RUNNUM.emon-m.dat
    emon -v >>$RUNNUM.emon-v.dat
    emon -i /workloads/SPECjbb2015/icx-2s-events.txt >>$RUNNUM.emon.dat &
    sleep 300 
    killall emon
    sleep 1
    killall emon
    sleep 10
    echo "Launching SEP collection" 
    #sep -start -d 60 -ec "INST_RETIRED.ANY","CPU_CLK_UNHALTED.THREAD","MEM_LOAD_L3_MISS_RETIRED.LOCAL_DRAM","UNC_M_DDRT_RDQ_INSERTS","CYCLE_ACTIVITY.STALLS_MEM_ANY" -out $OUTDIR/$RUNNUM.2LM.sep
    #sep -start -d 120 -ec "CPU_CLK_UNHALTED.THREAD","INST_RETIRED.ANY","CORE_POWER.LICENSE_2:c1:e1","CORE_POWER.LICENSE_3:c1:e1","CORE_POWER.LICENSE_4:c1:e1","CORE_POWER.THROTTLE:c1:e1","UOPS_ISSUED.VECTOR_WIDTH_MISMATCH:c1:e1" -out $OUTDIR/$RUNNUM.AVX.sep
    sep -start -d 60 -ec "CPU_CLK_UNHALTED.THREAD","INST_RETIRED.ANY" -out $OUTDIR/$RUNNUM.AVX.sep

    #  sep -start -d 60 -ec "INST_RETIRED.ANY","CPU_CLK_UNHALTED.THREAD" -out $OUTDIR/$RUNNUM.2LM.sep

    #sep -start -d 60 -ec "INST_RETIRED.ANY","CPU_CLK_UNHALTED.THREAD","MEM_LOAD_L3_MISS_RETIRED.LOCAL_DRAM" -out $OUTDIR/$RUNNUM.2LM.sep
    date +'%m%d%H%M%S' > end_of_samples.AVX.txt
    
    #setting java and perf-map path for flamegraph generation
    sed -i -e "s/JAVA_HOME=\${JAVA_HOME:-.*/JAVA_HOME=\${JAVA_HOME:-\/workloads\/JVM\/$JVM}/g" ../../../FlameGraph/jmaps
    sed -i -e "s/AGENT_HOME=\${AGENT_HOME:-.*/AGENT_HOME=\${AGENT_HOME:-\/workloads\/PerfMapAgents\/$JVM\/perf-map-agent}/g" ../../../FlameGraph/jmaps

    echo "Launching PERF collection"
    echo " perf record -F 99 -a  -g -- sleep 30"


    perf record -F 99 -a -g -- sleep 30;
    ../../../FlameGraph/jmaps

    echo "Doing PAT Data collection"
    /workloads/PAT/PAT-collecting-data/pat_run
    echo "PAT data collection completed"

    echo "Creating Flamegraphs"
    perf script | ../../../FlameGraph/stackcollapse-perf.pl > out.perf-folded
    ../../../FlameGraph/flamegraph.pl --color=java --hash out.perf-folded > flamegraph.svg
    echo "Perf data collection and Flamegraph creation complete"

    sleep 5
    killall vmstat
else
    echo "invalid selection no collection made Only VMstat data collected"
fi
  

   date
   echo " Data collection complete"




#FP_ARITH_INST_RETIRED.SCALAR_DOUBLE
#FP_ARITH_INST_RETIRED.SCALAR_SINGLE
#FP_ARITH_INST_RETIRED.128B_PACKED_DOUBLE
#FP_ARITH_INST_RETIRED.128B_PACKED_SINGLE
#FP_ARITH_INST_RETIRED.256B_PACKED_DOUBLE
#FP_ARITH_INST_RETIRED.256B_PACKED_SINGLE
#FP_ARITH_INST_RETIRED.512B_PACKED_DOUBLE
#FP_ARITH_INST_RETIRED.512B_PACKED_SINGLE

