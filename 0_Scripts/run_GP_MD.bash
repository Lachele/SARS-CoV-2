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

MDEngine="${GP_PRODUCTION_MDEngine}"
Overwrite=' -O '
RunControl="${ProtDir}/gas-phase-MD.in"
PosePath="${ProtDir}/${LigDir}/pose${PoseID}"
Prmtop="${PosePath}/complex.parm7"
ReplicaPath="${PosePath}/r_${ReplicaID}"
## This is a hack
InputCoord="${PosePath}/r_1_GP_min3.rst7"
Restart="${ReplicaPath}_GP_MD.rst7"
MDOutput="${ReplicaPath}_GP_MD.out"
Trajectory="${ReplicaPath}_GP_MD.nc"
MDInfo="${ReplicaPath}_GP_MD.info"
MDLOG="${ReplicaPath}_GP_MD.log"
if [ -e ../0_Scripts/Build-MD-Exec.bash ] ; then
    . ../0_Scripts/Build-MD-Exec.bash
else 
    echo "Cannot find the executable-generating script."
    exit 1
fi
