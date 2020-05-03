#!/bin/bash

## You can override settings here by making a file called
##     local_settings.bash
## that contains the desired changes.

## Default values
AMBERHOME='/programs/amber'
MPI_Prefix='mpirun -np 4 '
GP_MINIMIZATION_MDEngine='sander.MPI'
GP_PRODUCTION_MDEngine='sander.MPI'
Sol_MINIMIZATION_MDEngine='pmemd.MPI'
Sol_PRODUCTION_MDEngine='pmemd.MPI'
Use_BIG_for_MD_Traj='true'

if [ "${BasePath}zzz" == "zzz" ] ; then 
	BasePath='../0_Scripts'
fi
if [ -e ${BasePath}/local_settings.bash ] ; then
  . ${BasePath}/local_settings.bash  ## you can change AMBERHOME in here
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
