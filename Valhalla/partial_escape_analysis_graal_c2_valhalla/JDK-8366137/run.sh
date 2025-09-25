#!/bin/sh

for i in $(ls -d */); do cd ${i}; echo ${i}; make all | grep -e "\[RUN\]" -e "\[.*time.*\]" 2> /dev/null > PERF.txt; cd ..; done
