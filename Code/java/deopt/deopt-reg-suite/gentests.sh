#!/bin/sh

i=1
for size in 64 128 256 512
do
  for Type in Byte Short Int Long Float Double
  do
      ARRAY_TYPE=$(echo ${Type} | tr [:upper:] [:lower:])
      echo "Generating deopt_mask_${Type}${size}.java ..."
      cat deopt_mask.template    | sed -e s/SPECIES_TEMPLATE/${Type}Vector.SPECIES_${size}/g -e s/NAME_TEMPLATE/${Type}${size}/g > deopt_mask_${Type}${size}.java 
      echo "Generating deopt_shuffle_${Type}${size}.java ..."
      cat deopt_shuffle.template | sed -e s/SPECIES_TEMPLATE/${Type}Vector.SPECIES_${size}/g -e s/NAME_TEMPLATE/${Type}${size}/g > deopt_shuffle_${Type}${size}.java 
      echo "Generating deopt_vector_${Type}${size}.java ..."
      cat deopt_vector.template  | sed -e s/SPECIES_TEMPLATE/${Type}Vector.SPECIES_${size}/g -e s/NAME_TEMPLATE/${Type}${size}/g -e s/ARRAY_TYPE/${ARRAY_TYPE}/g -e s/VECTOR_INITIALS/${Type}/g > deopt_vector_${Type}${size}.java 
      i=$(expr $i + 1)
  done
done
