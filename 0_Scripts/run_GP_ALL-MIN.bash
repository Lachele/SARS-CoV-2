#!/bin/bash

. ../0_Scripts/run_GP_min1.bash 

if grep -q "|     wallclock() was called" ${ReplicaPath}_GP_min1.out ; then
	. ../0_Scripts/run_GP_min2.bash 
else
	echo "The first minimization did not succeed.  Stopping."
	exit 1
fi

if grep -q "|     wallclock() was called" ${ReplicaPath}_GP_min2.out ; then
	. ../0_Scripts/run_GP_min3.bash 
else
	echo "The second minimization did not succeed.  Stopping."
	exit 1
fi


