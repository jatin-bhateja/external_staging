#!/bin/bash
###################################
## Author: jatinbha
## OpenJDK: Unit test automation.
##################################


rm -rf combined_newfailures.txt
rm -rf combined_other_errors.txt

for i in $(find . -name "newfailures.txt")
do 
   echo "======================= $i ======================" >> combined_newfailures.txt
   cat $i >> combined_newfailures.txt
done

for i in $(find . -name "other_errors.txt")
do 
   echo "======================= $i ======================" >> combined_other_errors.txt
   cat $i >> combined_other_errors.txt
done
