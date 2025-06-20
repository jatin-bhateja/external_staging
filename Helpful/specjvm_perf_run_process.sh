#!/bin/sh

rm -rf data.csv

## Report Header.
##
HEADER=",Score,,,,,,"
COLUMNS="cycles instructions LVL0 LVL1 LVL2 BR_NEAR MEM_LOAD MEM_STORE"
for i in $COLUMNS
do
  HEADER="$HEADER${i}_old,,,${i}_new,,,"
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
  VALUES="$SCOREO1,$SCOREO2,$SCOREO3,$SCOREN1,$SCOREN2,$SCOREN3"
  for i in $COLUMNS
  do
    VALO1=$(grep $i log_withoutOpt_${b}.txt | awk '{print $1}'  |  tail -3 | head -1 | sed 's/,//g')
    VALO2=$(grep $i log_withoutOpt_${b}.txt | awk '{print $1}'  |  tail -2 | head -1 | sed 's/,//g')
    VALO3=$(grep $i log_withoutOpt_${b}.txt | awk '{print $1}'  |  tail -1 | head -1 | sed 's/,//g')
    VALN1=$(grep $i log_withOpt_${b}.txt | awk '{print $1}'  |  tail -3 | head -1 | sed 's/,//g')
    VALN2=$(grep $i log_withOpt_${b}.txt | awk '{print $1}'  |  tail -2 | head -1 | sed 's/,//g')
    VALN3=$(grep $i log_withOpt_${b}.txt | awk '{print $1}'  |  tail -1 | head -1 | sed 's/,//g')
    VALUES="$VALUES,$VALO1,$VALO2,$VALO3,$VALN1,$VALN2,$VALN3"
  done
  echo "$b,$VALUES" >> data.csv
done

