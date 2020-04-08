#!/bin/bash
##
## This script is to be run from the 7_MD directory
## 

##
##  The following code block DOES A LOT 
##
##  First, it does a lot of sanity checking.  
##
##  It also sets a lot of variables that are used below
##
##  Look in the script it loads for more information.
if [ -e ../0_Scripts/Usage-MD.bash ] ; then
    . ../0_Scripts/Usage-MD.bash
else 
    echo "This script is probably being called from the wrong location. Exiting."
    exit 1
fi

MDEngine="${GP_MINIMIZATION_MDEngine}"
Overwrite=' -O '
RunControl="${ProtDir}/second_min.in"
PosePath="${ProtDir}/${LigDir}/pose${PoseID}"
Prmtop="${PosePath}/complex.parm7"
ReplicaPath="${PosePath}/r_${ReplicaID}"
InputCoord="${ReplicaPath}_GP_min1.rst7"
Restart="${ReplicaPath}_GP_min2.rst7"
MDOutput="${ReplicaPath}_GP_min2.out"
Trajectory="${ReplicaPath}_GP_min2.nc"
MDInfo="${ReplicaPath}_GP_min2.info"
MDLog="${ReplicaPath}_GP_min2.log"
if [ -e ../0_Scripts/Build-MD-Exec.bash ] ; then
    . ../0_Scripts/Build-MD-Exec.bash
else 
    echo "Cannot find the executable-generating script."
    exit 1
fi
