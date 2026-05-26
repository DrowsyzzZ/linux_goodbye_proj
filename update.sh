#!/bin/bash

while :
do
    cat t1 > tt

    sar 1 1|grep Average |awk '{ print "CPU_FREE=" $8 ";\nCPU_USED=" 100-$8 ";"}' >> tt

    free | awk '/Mem:/ {print "MEM_FREE="$7";\nMEM_USED="$3";"}' >> tt

    df -k | grep -v Filesystem | awk '{sum += $4} END {print "DSK_FREE=" sum ";"}' >> tt
    df -k | grep -v Filesystem | awk '{sum += $3} END {print "DSK_USED=" sum ";"}' >> tt

    cat t2 >> tt

    cp tt ~/goodbye/serverstatus.html

    sleep 5
done