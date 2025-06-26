

unbuffer numactl --cpunodebind=1 --membind=1 java -Xlog:pagesize -XX:-TieredCompilation -Xmx20g -Xms15g -XX:+UseLargePages -XX:LargePageSizeInBytes=2M -XX:+UnlockExperimentalVMOptions -XX:+PostLoopMultiversioning -cp . test  | tee log.txt &


echo "Started EMON script"
tail -f  log.txt | while read line ; do
  echo "$line" | grep "Warmup complete"
  if [ $? = 0 ]; then
    echo `killall tail`
    emon -collect-edp >& emon.dat &
    date
  fi
done

tail -f  log.txt | while read line ; do
  echo "$line" | grep "Measurement complete"
  if [ $? = 0 ]; then
    echo `killall tail`
    emon -stop
    date
  fi
done
