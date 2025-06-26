#/bin/bash

get_target_supported_by_vector_irnode() {
  ARCHS=$(grep ${1} src/hotspot/cpu/*/*.ad -l | awk -F ':' '{print $1}' | awk -F '/' '{print $4}'  | uniq)
  RES=$(echo $ARCHS | wc -c) 
  if [ $RES -gt 1 ]; then
     echo "$1 is supported by following targets:"
     echo $ARCHS
  else
     echo "$1 is not supported by any target."
  fi
}

echo "Input = $*"
for ir in $* 
do 
  if [ $ir == "all" ]; then
     VectorIRNodes=$(grep "macro" src/hotspot/share/opto/classes.hpp | awk -F '(' '{print $2}' | awk -F ')' '{print $1}' | grep -e "V[BSWILFD]" -e "Vector" | sort -u | uniq)
     for VectorIRNode in $VectorIRNodes
     do 
        get_target_supported_by_vector_irnode $VectorIRNode
     done
  elif [ $ir != "" ]; then
     get_target_supported_by_vector_irnode $ir
  fi
done

## Find greatest common divisior of targets supporting all the nodes.
