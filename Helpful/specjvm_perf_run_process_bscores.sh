#!/bin/sh

rm -rf data.csv

## Report Header.
##
HEADER=",Score,,"
COLUMNS="cycles instructions LVL0 LVL1 LVL2 BR_NEAR MEM_LOAD MEM_STORE"
for i in $COLUMNS
do
  HEADER="$HEADER${i}_old,${i}_new,"
done

echo $HEADER >> data.csv

## Report scores.
##
for b in compress crypto.aes crypto.rsa crypto.signverify derby mpegaudio scimark.fft.large scimark.fft.small scimark.lu.large scimark.lu.small scimark.monte_carlo scimark.sor.large scimark.sor.small  scimark.sparse.large scimark.sparse.small serial sunflow xml.transform xml.validation
do
  SCOREO1=$(grep "Score.*:" log_withoutOpt_${b}.txt  | awk -F':' '{print $2}' | awk '{print $1}' |  tail -3 | head -1 )
  SCOREO2=$(grep "Score.*:" log_withoutOpt_${b}.txt  | awk -F':' '{print $2}' | awk '{print $1}' |  tail -2 | head -1 )
  SCOREO3=$(grep "Score.*:" log_withoutOpt_${b}.txt  | awk -F':' '{print $2}' | awk '{print $1}' |  tail -1 | head -1 )
  SCOREN1=$(grep "Score.*:" log_withOpt_${b}.txt  | awk -F':' '{print $2}' | awk '{print $1}' |  tail -3 | head -1 )
  SCOREN2=$(grep "Score.*:" log_withOpt_${b}.txt  | awk -F':' '{print $2}' | awk '{print $1}' |  tail -2 | head -1 )
  SCOREN3=$(grep "Score.*:" log_withOpt_${b}.txt  | awk -F':' '{print $2}' | awk '{print $1}' |  tail -1 | head -1 )

  BSCOREO=""
  BINDEXO=""
  expr1_status=$(echo "$SCOREO1 > $SCOREO2" | bc -l)
  expr2_status=$(echo "$SCOREO1 > $SCOREO3" | bc -l)
  expr3_status=$(echo "$SCOREO2 > $SCOREO3" | bc -l)
  if [ $expr1_status -eq 1 ] && [ $expr2_status -eq 1 ]; then
     BSCOREO=$SCOREO1
     BINDEXO=1
  elif [ $expr3_status -eq 1 ]; then
     BSCOREO=$SCOREO2
     BINDEXO=2
  else
     BSCOREO=$SCOREO3
     BINDEXO=3
  fi

  BSCOREN=""
  BINDEXN=""
  expr1_status=$(echo "$SCOREN1 > $SCOREN2" | bc -l)
  expr2_status=$(echo "$SCOREN1 > $SCOREN3" | bc -l)
  expr3_status=$(echo "$SCOREN2 > $SCOREN3" | bc -l)
  if [ $expr1_status -eq 1 ] && [ $expr2_status -eq 1 ]; then
     BSCOREN=$SCOREN1
     BINDEXN=1
  elif [ $expr3_status -eq 1 ]; then
     BSCOREN=$SCOREN2
     BINDEXN=2
  else
     BSCOREN=$SCOREN3
     BINDEXN=3
  fi

  VALUES="$BSCOREO,$BSCOREN"
  for i in $COLUMNS
  do
    BVALO=""
    if [ $BINDEXO -eq 1 ]; then
      BVALO=$(grep $i log_withoutOpt_${b}.txt | awk '{print $1}'  |  tail -3 | head -1 | sed 's/,//g')
    elif [ $BINDEXO -eq 2 ]; then
      BVALO=$(grep $i log_withoutOpt_${b}.txt | awk '{print $1}'  |  tail -2 | head -1 | sed 's/,//g')
    else
      BVALO=$(grep $i log_withoutOpt_${b}.txt | awk '{print $1}'  |  tail -1 | head -1 | sed 's/,//g')
    fi

    BVALN=""
    if [ $BINDEXN -eq 1 ]; then
      BVALN=$(grep $i log_withOpt_${b}.txt | awk '{print $1}'  |  tail -3 | head -1 | sed 's/,//g')
    elif [ $BINDEXN -eq 2 ]; then
      BVALN=$(grep $i log_withOpt_${b}.txt | awk '{print $1}'  |  tail -2 | head -1 | sed 's/,//g')
    else
      BVALN=$(grep $i log_withOpt_${b}.txt | awk '{print $1}'  |  tail -1 | head -1 | sed 's/,//g')
    fi

    VALUES="$VALUES,$BVALO,$BVALN"
  done
  echo "$b,$VALUES" >> data.csv
done

