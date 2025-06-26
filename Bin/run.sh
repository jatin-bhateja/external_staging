rm -rf IRCheck.disabled
touch IRCheck.disabled
for level in 0 1 2 3 KNL
do
  echo "AVXLEVEL=$level" >> IRCheck.disabled
  for i in $(cat test.txt)
  do 
    echo "Running [AVXLEVEL=$level] $i"
    sudo java -jar /home/jatinbha/sandboxes/jtreg/build/images/jtreg/lib/jtreg.jar -va -timeout:4 -jdk:$JAVA_HOME  -javaoptions:"-XX:UseAVX=$level" $i >& /tmp/${i}.txt
    grep "Disabling IR matching" /tmp/${i}.txt >& /dev/null
    if [ $? -eq 0 ]; then
      echo "$i" >> IRCheck.disabled
      echo "   IRCD : $i"
    fi
  done
  mv JTwork JTwork.$level
  mv JTreport JTreport.$level
done

