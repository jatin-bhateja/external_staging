#!/bin/bash
# $1 = 1 for packing else 0.
i=1; while [ $i -lt  32 ]; do  echo "Generating bit width = $i"; java -jar  target/codegen-1.0-SNAPSHOT.jar $1 $i 64 0; i=$(expr $i + 1); done
