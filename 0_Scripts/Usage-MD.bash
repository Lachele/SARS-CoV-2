#!/bin/bash

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

if [ -e ../0_Scripts/Settings.bash ] ; then
  . ../0_Scripts/Settings.bash  ## AMBERHOME is set in here
else 
  echo "Cannot find settings file. Exiting."; exit 1
fi

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




