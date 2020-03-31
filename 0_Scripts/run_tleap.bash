#!/bin/bash

export AMBERHOME='/programs/amber-18-with-patches'

source ${AMBERHOME}/amber.sh

tleap -f ${1}

