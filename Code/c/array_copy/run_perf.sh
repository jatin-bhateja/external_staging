#!/bin/sh

EVENTS=$1
if [ -n "$1" ]; then
  EVENTS="-e $1"
fi

RUNCNT=$2
if [ -z "$RUNCNT" ]; then
  RUNCNT=2
fi

echo "Perf Events = $1"
echo "Run  Count  = $RUNCNT"
perf stat $EVENTS -r $RUNCNT  -C 1 -- taskset -c 1 ./copy128_out 
perf stat $EVENTS -r $RUNCNT  -C 1 -- taskset -c 1 ./copy256_out
perf stat $EVENTS -r $RUNCNT  -C 1 -- taskset -c 1 ./copy512_out
