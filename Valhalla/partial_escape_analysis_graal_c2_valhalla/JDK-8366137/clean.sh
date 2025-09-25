#!/bin/sh
for i in $(ls -d */); do cd ${i}; make clean; cd ..; done
