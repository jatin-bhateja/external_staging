
##    serthost.sh
##
##    echo "Doing SEP data collection"
##    echo "Copying files for SEP Post Processing"
##    cp $JAVA_HOME/lib/server/libjvm.so .
##    cp /boot/System.map-$(uname -r) .
##    cp /workloads/SPECjbb2015/fs2xl.exe .
##    
##    if [ $1 == "SEP" ] ; then
##    SEP="-agentpath:/workloads/JVM/libjvmtisym/libjvmtisym.so=ofile=SERT.jsym"
##    else
##    SEP=""
##    fi
##    
##    
##    echo Starting SERT Host JVM - output will be written to logs/serthost_out.txt
##    $JAVA -cp ${CP} ${SEP} $JAVAOPTIONS_HOST org.spec.chauffeur.Launcher org.spec.chauffeur.host.Host ${KEEPALIVE} 2>&1 | tee -a logs/serthost_out.txt
##    echo SERT Host JVM exited
##    

LookForTag="Started HostPhase\[Measurement\]"

echo "Started EMON script"
tail -f  SERT-2.0.4/logs/serthost_out.txt | while read line ; do
  echo "$line" | grep "$LookForTag"
  if [ $? = 0 ]; then
    echo `killall tail`
    date
  fi
done

sleep 20
date
echo " Doing EDP data collection for 40s"
emon -M >$1.emon-m.dat
emon -v >>$1.emon-v.dat
emon -i /workloads/SPECjbb2015/icx-2s-events.txt >>$1.emon.dat &
sleep 40
killall emon
echo " EDP data collection completed"

