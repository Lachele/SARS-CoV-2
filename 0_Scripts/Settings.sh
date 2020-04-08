#!/bin/bash

## You can override settings here by making a file called
##     local_settings.bash
## that contains the desired changes.

## Default values
AMBERHOME='/programs/amber'
MPI_Prefix='mpirun -np 4 '
MININIZATION_MDEngine='pmemd.MPI'
PRODUCTION_MDEngine='pmemd.MPI'

if [ -e ../0_Scripts/local_settings.bash ] ; then
  . ../0_Scripts/local_settings.bash  ## you can change AMBERHOME in here
fi

## Test that AMBERHOME exists.  The others get tested later, as needed.
if [ -e "${AMBERHOME}" ] ; then
    source ${AMBERHOME}/amber.sh
else
	echo "Cannot find AMBERHOME on this device.  Exiting."
	echo "AMBERHOME is set to:
    ${AMBERHOME}"
	exit 1
fi
