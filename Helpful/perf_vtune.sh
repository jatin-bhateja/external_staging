#!/bin/bash
# Author: jatinbha
source /opt/intel/oneapi/vtune/latest/vtune-vars.sh

echo "PID = $1"
echo "Grepping log.txt for warmup ending message."
tail -f  ./log.txt | while read line ; do
      echo "$line" | grep "Warmup.*ends"
      if [ $? = 0 ]; then
      echo `killall tail`
      date
      fi
done

echo "Launching the data collection"
vtune -collect uarch-exploration -target-pid $1

