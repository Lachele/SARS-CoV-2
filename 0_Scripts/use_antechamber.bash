#!/bin/bash

##  ${1} should be a prefix for the .pdb file

if [ -e ../0_Scripts/Settings.bash ] ; then
  . ../0_Scripts/Settings.bash  ## AMBERHOME is set in here
else 
  echo "Cannot find settings file. Exiting."; exit 1
fi

export AMBERHOME='/programs/amber-18-with-patches'

source ${AMBERHOME}/amber.sh

antechamber -i ${1}.pdb -fi pdb -o ${1}.prep -fo prepi -c bcc -nc 0

rm -f ANTECHAMBER* sqm* ATOMTYPE.INF NEWPDB.PDB PREP.INF
