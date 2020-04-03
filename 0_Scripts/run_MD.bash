#!/bin/bash

export AMBERHOME='/programs/amber-18-with-patches'
source ${AMBERHOME}/amber.sh

export SANDER='sander -O '

${SANDER} \
-i MD.in \
-o ${1}_MD.out \
-p ${1}.parm7 \
-c ${1}_min2.rst7 \
-ref ${1}_min2.rst7 \
-x ${1}_md.nc \
-r ${1}_md.rst7


