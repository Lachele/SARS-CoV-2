#!/bin/bash

export AMBERHOME='/programs/amber-18-with-patches'

source ${AMBERHOME}/amber.sh

sander -O \
-i min.in \
-o min.out \
-p m.parm7 \
-c min-in.rst7 \
-ref min-in.rst7 \
-x min.nc \
-r min.rst7


