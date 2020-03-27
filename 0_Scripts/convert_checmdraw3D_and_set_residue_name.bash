#!/bin/bash

##
## $1 should be the name of a chemdraw mol2 file.
## $2 should be the name of the desired output file of type pdb.
## $3 should be the THREE LETTER name for the residue in the pdb file.

obabel -i mol2 "${1}"  -oPDB -O "${2}"

sed -i "s/\*\*\*\*/${3}0/" ${2}
sed -i "s/\*\*\*/${3}/" ${2}

