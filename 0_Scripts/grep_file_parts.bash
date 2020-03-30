#!/bin/bash

RESNAME='Z0Z'

grep ".................${RESNAME}" ${1} > ${1}_ligand.pdb
grep -v ".................${RESNAME}" ${1} > ${1}_protein.pdb
