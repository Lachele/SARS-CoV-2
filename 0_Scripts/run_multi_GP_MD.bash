#!/bin/bash

##
##  For running multiple MD runs at the same time.
##
##  Use this like the other scripts, but the "replica number" MUST
##  be an integer, to specify how many to run at once.  Default=2
##

if [ "${4}zzz" == "zzz" ] ; then 
	NumberOfRuns=2
else
	NumberOfRuns="${4}"
fi

if ! [[ "${NumberOfRuns}" =~ ^[0-9]+$ ]] ; then
      	echo "Last entry must be an integer" 
	exit 1
fi

echo "Number of runs is:  ${NumberOfRuns}"
#exit 0

i=1
while [ "${i}" -le "${NumberOfRuns}" ] ; do
	COMMAND="nohup bash ../0_Scripts/run_GP_MD.bash ${1} ${2} ${3} ${i} > NOHUP_out_${i} 2>&1 &"
	echo """
running Job ${i} now with command:

${COMMAND}

"""
	eval ${COMMAND}
	i=$((i+1))
done

