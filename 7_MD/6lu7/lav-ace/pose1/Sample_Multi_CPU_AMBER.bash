#!/bin/bash
#SBATCH -D /scratch1/lachele/d4g_Wilde_test
#SBATCH -J d4g_test
#SBATCH --partition=CPU
#SBATCH --get-user-env
#SBATCH --nodes=1
#SBATCH --tasks-per-node=28
#SBATCH --time=08:00:00  ## optional time limit

source /etc/profile.d/modules.sh

srun hostname -s | sort -u >slurm.hosts
export PMEMD="mpirun -np 28 $AMBERHOME/bin/pmemd.MPI -O "

# Submit a parallel pmemd job

#
# Minimization
#
${PMEMD} \
 -p 1_SolCl.parm7 \
 -c 1_SolCl.rst7 \
 -i min.in \
 -o min.o \
 -r min.rst7 \
 -x min.crdbox \
 -inf min.info \
 -l min.log 
#


if grep -q "Total wall time" min.o  ; then
#
# Heating
#
${PMEMD} \
 -p 1_SolCl.parm7 \
 -c min.rst7 \
 -i heat1.in \
 -o heat.o \
 -r heat.rst7 \
 -x heat.crdbox \
 -inf heat.info \
 -l heat.log 
#


fi 

if grep -q "Total wall time" heat.o  ; then
#
# Equilibration
#
${PMEMD} \
 -p 1_SolCl.parm7 \
 -c heat.rst7 \
 -i equil1.in \
 -o equil.o \
 -r equil.rst7 \
 -x equil.crdbox \
 -inf equil.info \
 -l equil.log 
#


fi 

if grep -q "Total wall time" equil.o  ; then
#
# Production
#
${PMEMD} \
 -p 1_SolCl.parm7 \
 -c equil.rst7 \
 -i prod1.in \
 -o prod.o \
 -r prod.rst7 \
 -x prod.nc \
 -inf prod.info \
 -l prod.log 
#


fi 

#rm -f slurm.hosts  # optionally keep or remove the file listing the hosts the job ran on
