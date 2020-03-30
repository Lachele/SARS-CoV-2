#!/bin/bash

##
## $1 should be the name of a chemdraw mol2 file.
## $2 should be the name of the desired output file of type pdb.
##
##  This assigns the residue name 'Z0Z' (Z-zero-Z)

obabel -i mol2 "${1}"  -oPDB -O "${2}"

sed -i "s/\*\*\*\*/Z0Z0/" ${2}
sed -i "s/\*\*\*/Z0Z/" ${2}

