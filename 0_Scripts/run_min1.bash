#!/bin/bash

export AMBERHOME='/programs/amber-18-with-patches'
source ${AMBERHOME}/amber.sh

SANDER='sander -O '

${SANDER} \
-i first_min.in \
-o ${1}_min1.out \
-p ${1}.parm7 \
-c ${1}.rst7 \
-ref ${1}.rst7 \
-x ${1}_min1.nc \
-r ${1}_min1.rst7

