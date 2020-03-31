#!/bin/bash

##  ${1} should be a prefix for the .pdb file

export AMBERHOME='/programs/amber-18-with-patches'

source ${AMBERHOME}/amber.sh

antechamber -i ${1}.pdb -fi pdb -o ${1}.prep -fo prepi -c bcc -nc 0

rm -f ANTECHAMBER* sqm* ATOMTYPE.INF NEWPDB.PDB PREP.INF
