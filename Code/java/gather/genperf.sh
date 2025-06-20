#!/bin/sh

for SPECIES in 64 128 256 512 PREFERRED
do
  for SUBWORD_TYPE_PRIM in short byte
  do
     SUBWORD_TYPE_BOX=$(tr '[:lower:]' '[:upper:]' <<< ${SUBWORD_TYPE_PRIM:0:1})${SUBWORD_TYPE_PRIM:1}
     cat gather.template | sed -e s/#SPECIES#/${SPECIES}/g -e s/#SUBWORD_TYPE_PRIM#/${SUBWORD_TYPE_PRIM}/g -e s/#SUBWORD_TYPE_BOX#/${SUBWORD_TYPE_BOX}/g > gather${SUBWORD_TYPE_PRIM}_${SPECIES}.java
  done
done
    


