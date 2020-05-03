#!/bin/bash

if [ -e ../0_Scripts/Settings.bash ] ; then
  . ../0_Scripts/Settings.bash  ## AMBERHOME is set in here
else 
  echo "Cannot find settings file. Exiting."; exit 1
fi

export AMBERHOME='/programs/amber-18-with-patches'

source ${AMBERHOME}/amber.sh

tleap -f ${1}

