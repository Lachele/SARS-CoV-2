#!/bin/bash

AMBERHOME='/programs/amber-18-with-patches'
if [ -e ../0_Scripts/local_amber_info.bash ] ; then
  . ../0_Scripts/local_amber_info.bash  ## you can change AMBERHOME in here
fi
if [ -e "${AMBERHOME}" ] ; then
    source ${AMBERHOME}/amber.sh
else
	echo "Cannot find AMBERHOME on this device.  Exiting."
	echo "AMBERHOME is set to:
    ${AMBERHOME}"
	exit 1
fi

## Usage statement for the MD scripts in general

USAGE="""

    This script should be run from the 7_MD dirctory.

    See the README.md file in that directory for important
    information about naming conventions in the subdirectories.

Usage:

    ${0} ProtDir LigDir PoseID ReplicaID

    Wherer:

        ProtDir = Name of the protein directory
	LigDir = Name of the ligand directory
	PoseID = The pose descriptor for this run
	ReplicaID = The replica descriptor for this run

"""
MissingProtDirText="""

Must supply the name of the protein directory.

"""
MissingLigDirText="""

Must supply the name of the ligand directory.

"""
MissingPoseIDText="""

Must supply the descriptor for the pose.

"""
MissingReplicaIDText="""

Must supply the descriptor for the replica.

"""
IntegerRE='^[0-9]+$'
if [ "${1}zzz" == "zzz" ] ; then
	echo "${MissingProtDirText} ${USAGE}"
	exit 1
else
	ProtDir="${1}"
fi
if [ "${2}zzz" == "zzz" ] ; then
	echo "${MissingLigDirText} ${USAGE}"
	exit 1
else
	LigDir="${2}"
fi
if [ "${3}zzz" == "zzz" ] ; then
	echo "${MissingPoseIDText} ${USAGE}"
	exit 1
else
    PoseID="${3}"
fi
if [ "${4}zzz" == "zzz" ] ; then
	echo "${MissingReplicaIDText} ${USAGE}"
	exit 1
else
    ReplicaID="${4}"
fi




