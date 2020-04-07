#!/bin/bash

##
##  This script is meant to be inserted within other scripts. 
##
##  Most sanity checks and such should happen before this is called.
##
##  Most variables herein are defined elsewhere.
##
##  To learn more, grep its name to see which scripts call it.
##

## Check to see if the things we need are defined
if [ "${MDEngine}zzz" == "zzz" ] ; then
        echo "Error: MD Engine must be defined" >&2; exit 1
else
	case ${MDEngine} in 
		'sander' | 'sander.MPI') 
			use_logfile="false";;
		'pmemd' | 'pmemd.MPI' | 'pmemd.cuda' | 'pmemd.cuda.MPI') 
			use_logfile="true";;
		*)
                        echo "Error: MD Engine unknown." >&2; exit 1;;
	esac
fi
if [ "${Overwrite}zzz" == "zzz" ] ; then
	Overwrite=' '  ## By default, we do not overwrite
fi
if [ "${RunControl}zzz" == "zzz" ] ; then
        echo "Error: The Run Control file must be defined" >&2; exit 1
else
    if [ ! -f "${RunControl}" ] ; then
        echo "Error: The Run Control file must exist." >&2; exit 1
    fi
fi
if [ "${Prmtop}zzz" == "zzz" ] ; then
        echo "Error: The Prmtop file must be defined" >&2; exit 1
else
    if [ ! -f "${Prmtop}" ] ; then
        echo "Error: The Prmtop file must exist." >&2; exit 1
    fi
fi
if [ "${InputCoord}zzz" == "zzz" ] ; then
        echo "Error: The InputCoord file must be defined" >&2; exit 1
else
    if [ ! -f "${InputCoord}" ] ; then
        echo "Error: The InputCoord file must exist." >&2; exit 1
    fi
fi
if [ "${Restart}zzz" == "zzz" ] ; then
        echo "Error: The Restart file must be defined" >&2; exit 1
fi
if [ "${MDOutput}zzz" == "zzz" ] ; then
        echo "Error: The MD output file must be defined" >&2; exit 1
fi
#####  Note - we use NetCDF for trajectories by default, and if the
#####  Run Control file says otherwise, the file will just be silently 
#####  not in the NetCDF format. This is not a tragedy.  
if [ "${Trajectory}zzz" == "zzz" ] ; then
        echo "Error: The Trajectory file must be defined" >&2; exit 1
fi
if [ "${MDInfo}zzz" == "zzz" ] ; then
        echo "Error: The MD Info file must be defined" >&2; exit 1
fi
if [ "${use_logfile}" == "true" ] ; then 
    if [ "${MDLog}zzz" == "zzz" ] ; then
        echo "Error: The MD Log file must be defined for pmemd runs." >&2; exit 1
    fi
fi

COMMAND="${MDEngine} ${Overwrite} \
-i ${RunControl} \
-o ${MDOutput} \
-p ${Prmtop} \
-c ${InputCoord} \
-ref ${InputCoord} \
-x ${Trajectory} \
-r ${Restart} \
-inf ${MDInfo} "

if [ "${use_logfile}" == "true" ] ; then 
	COMMAND="${COMMAND} \
-l ${MDLog} "
fi

echo """
Executing requested MD simulation using this command:

${COMMAND}

"""

eval ${COMMAND}
