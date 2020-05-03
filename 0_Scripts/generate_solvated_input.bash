#!/bin/bash

##
##  This script is written to be called from a pose directory.
##
##
##  Usage:
##
##	generate_solvated_input.bash complex.parm7 complex_GP_min.rst7
##
##	* complex_GP_min.rst7 can be a symlink to the desired restart file
##

## Orient ourselves
CallersName="${0}"
if [[ ${CallersName} == *"/"* ]]; then
  BasePath=${CallersName%/*}
else
  BasePath='.'
fi
ScriptName=${CallersName##*/}

## Sanity checks
if [ ! -e ligand.prep ] ; then
	echo "Need file or symlink for ligand.prep in this directory."
	exit 1
fi
if [ ! -e complex.parm7 ] ; then
	echo "Need file or symlink for complex.parm7 in this directory."
	exit 1
fi
if [ ! -e complex_GP_min.rst7 ] ; then
	echo "Need file or symlink for complex_GP_min.rst7 in this directory."
	exit 1
fi
if [ ! -e Solv_leap.in ] ; then
	echo "Need file or symlink for Solv_leap.in in this directory."
	exit 1
fi

if [ -e ${BasePath}/Settings.bash ] ; then
  . ${BasePath}/Settings.bash  ## AMBERHOME is set in here
else 
  echo "Cannot find settings file. Exiting."; exit 1
fi

#exit 0

ambpdb -p complex.parm7 -c complex_GP_min.rst7 > complex_GP_min.pdb

tleap -f Solv_leap.in
