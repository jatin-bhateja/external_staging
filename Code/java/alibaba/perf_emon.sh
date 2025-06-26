#!/bin/bash
source /opt/intel/sep_private_5.32_linux_013109108d9bbb1/sep_vars.sh

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
sudo /opt/intel/sep_private_5.32_linux_013109108d9bbb1/bin64/emon -collect-edp >& emon.dat &


tail -f  ./log.txt | while read line ; do
      echo "$line" | grep "Time"
      if [ $? = 0 ]; then
      echo `killall tail`
      date
      fi
done

sudo /opt/intel/sep_private_5.32_linux_013109108d9bbb1/bin64/emon -stop

SCORE=95000
echo "Setting TPS to $SCORE in edp_config.txt"
cat edp_config.txt | sed -e "s/--tps.*$/--tps $SCORE/g" > /tmp/1
sudo mv /tmp/1 ./edp_config.txt
sudo /opt/intel/sep_private_5.32_linux_013109108d9bbb1/bin64/emon -process-edp ./edp_config.txt
