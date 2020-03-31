#!/bin/bash

RESNAME='Z0Z'

if [ "${2}zzz" == "zzz" ] ; then 
	newPrefix=${1}
else
	newPrefix=${2}
fi

grep ".................${RESNAME}" ${1} > ${newPrefix}_ligand.pdb
grep -v ".................${RESNAME}" ${1} > ${newPrefix}_protein.pdb
