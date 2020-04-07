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

MDEngine='sander'
Overwrite=' -O '
RunControl="${ProtDir}/second_min.in"
PosePath="${ProtDir}/${LigDir}/pose${PoseID}"
Prmtop="${PosePath}/complex.parm7"
ReplicaPath="${PosePath}/r_${ReplicaID}"
InputCoord="${ReplicaPath}_min2.rst7"
Restart="${ReplicaPath}_min3.rst7"
MDOutput="${ReplicaPath}_min3.out"
Trajectory="${ReplicaPath}_min3.nc"
MDInfo="${ReplicaPath}_min3.info"
if [ -e ../0_Scripts/Build-MD-Exec.bash ] ; then
    . ../0_Scripts/Build-MD-Exec.bash
else 
    echo "Cannot find the executable-generating script."
    exit 1
fi
