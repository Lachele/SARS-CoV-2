#!/bin/bash
#SBATCH -D /scratch1/lachele/tip3p_to_wilde
#SBATCH -J amber_single_gpu
#SBATCH --partition=GPU
#SBATCH --get-user-env
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --gres=gpu:1
#SBATCH --time=08:00:00  ## optional time limit

source /etc/profile.d/modules.sh

export PRMTOP="Sia-ion-solv.parm7"
export INPCRD="Sia-ion-solv.rst7"
export pmemd="srun ${AMBERHOME}/bin/pmemd.cuda"

#
# Minimization
#
${pmemd} -O \
 -p ${PRMTOP} \
 -c ${INPCRD} \
 -i min.in \
 -o min.o \
 -r min.rst7 \
 -x min.mdcrd \
 -inf min.info \
 -l min.log 
#
if grep -q "Total wall time" min.o  ; then
#
# Heating
#
${pmemd} -O \
 -p ${PRMTOP} \
 -c min.rst7 \
 -i heat_gpu.in \
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
${pmemd} -O \
 -p ${PRMTOP} \
 -c heat.rst7 \
 -i equil.in \
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
${pmemd} -O \
 -p ${PRMTOP} \
 -c equil.rst7 \
 -i prod.in \
 -o prod.o \
 -r prod.rst7 \
 -x prod.nc \
 -inf prod.info \
 -l prod.log 
#
fi 

