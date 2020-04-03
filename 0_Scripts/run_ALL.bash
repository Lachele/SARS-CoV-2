#!/bin/bash

. ./run_min1.bash

if grep -q "|     wallclock() was called" ${1}_min1.out  ; then
	. ./run_min2.bash
else
	echo "The first minimization did not succeed.  Stopping."
	exit 1
fi

if grep -q "|     wallclock() was called" ${1}_min2.out  ; then
	. ./run_MD.bash
else
	echo "The second minimization did not succeed.  Stopping."
	exit 1
fi


