#!/bin/bash

export AMBERHOME='/programs/amber-18-with-patches'

source ${AMBERHOME}/amber.sh

antechamber -i ${1} -fi pdb -o ${1}.prep -fo prepi -c bcc -nc 0

