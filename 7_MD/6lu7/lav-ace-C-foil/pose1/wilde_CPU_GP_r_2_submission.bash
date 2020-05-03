#!/bin/bash
#SBATCH -D /scratch1/lachele/SARS-CoV-2/7_MD/6lu7/lav-ace-C-foil/pose1
#SBATCH -J l-a-f-6lu7-GP
#SBATCH --partition=CPU
#SBATCH --get-user-env
#SBATCH --nodes=1
#SBATCH --tasks-per-node=7

export JobIdentifier='wilde_CPU_GP_r_2_MD'

source /etc/profile.d/modules.sh

srun hostname -s | sort -u > ${JobIdentifier}_slurm.hosts
export MDENGINE="mpirun -np 7 $AMBERHOME/bin/sander.MPI -O "

# Production
#
${MDENGINE} \
 -p complex.parm7 \
 -c r_1_GP_min3.rst7 \
 -ref r_1_GP_min3.rst7 \
 -i ../../long-gas-phase-MD.in \
 -o ${JobIdentifier}_BIG.out \
 -r ${JobIdentifier}.rst7 \
 -x ${JobIdentifier}_BIG.nc \
 -inf ${JobIdentifier}.info 
#

