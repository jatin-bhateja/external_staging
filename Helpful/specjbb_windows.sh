#!/bin/sh

############### EMON data generation ##########

echo "Processing data over $1 , run type = $2"

for i in $(ls -d */)
do 
  echo "Processing $i"
  mkdir -p $i/emon_data

  echo "Moving EDP files into $i/emon_data"
  cd $i; mv *.dat emon_data/.; cd ..

  echo "Copying target and EDP script files into $i/emon_data"
  cp process.cmd $1-2s* edp.rb chart_format_$1_2s.txt $i/emon_data

  mv $i/emon_data/*.emon-v.dat $i/emon_data/PERF.emon-v.dat
  mv $i/emon_data/*.emon-m.dat $i/emon_data/PERF.emon-m.dat 
  mv $i/emon_data/*.emon.dat $i/emon_data/PERF.emon.dat

  if [ $2 == "LOADLEVEL" ]; then
    RES_DIR=$(find $i -name "report-00002" -type d)
    OPS=$(grep "jbb2015.result.metric.max-jOPS"  $RES_DIR/*.raw | awk -F'=' '{print $2}')
    echo "max-jops = $OPS"
    TPS=$(echo "$OPS*0.95" | bc -l)
  else 
    TPS=$3
  fi

  echo "Updating TPS=$TPS entry in $i/emon_data/process.cmd file"
  echo "s/--tps\\ [0-9]*/--tps $TPS/g"  >& /tmp/sed.script
  cat $i/emon_data/process.cmd  | sed -f /tmp/sed.script >& /tmp/1
  mv /tmp/1 $i/emon_data/process.cmd
done

ls -d */ >& dirs.txt

#C:\Users\jatinbha\SEP_EMON_RUNS\data_arraycopy\ICX_DATA\new_data_27_6>for /f %I in (dirs.txt) DO cd %I/emon_data && process.cmd PERF && cd ../../

#for i in $(cat dirs.txt); do cd $i/emon_data; NUM=$(echo $i | awk -F'_' '{print $1}'); mv summary.xlsx summary_${NUM}.xlsx; cd ../../; done


############### SEP data generation ##########
#  for i in $(ls *SEP* -d); do cd $i; mkdir sep_data; mv *.jsym *.tb7 libjvm.so System* fs2xl.exe sep_data; cd ../; done
#  ls *SEP* -d >& sdirs.txt
#  for /f %I in (sdirs.txt) DO cd %I\sep_data && java -jar fs2xl.exe -DhotMethodCount=400 -DhotMethodCountExcel=200 -Dhip.maxLength=30 && cd ..\..
#for i in $(cat sdirs.txt); do cd $i/sep_data; NUM=$(echo $i | awk -F'_' '{print $1}'); mv excel.xls excel_${NUM}.xls; cd ../../; done

