#!/bin/bash
#SBATCH -D /scratch1/lachele/SARS-CoV-2/7_MD/6lu7/lav-ace/pose1
#SBATCH -J lav-ace-6lu7-TIP3P
#SBATCH --partition=GPU
#SBATCH --get-user-env
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --gres=gpu:1

source /etc/profile.d/modules.sh

export PRMTOP="complex_TIP3P.parm7"
export INPCRD="complex_TIP3P.rst7"
export pmemd="srun ${AMBERHOME}/bin/pmemd.cuda"

#
# Minimization
#
${pmemd} -O \
 -p ${PRMTOP} \
 -c ${INPCRD} \
 -ref ${INPCRD} \
 -i ../../water_added_min.in \
 -o wilde_GPU_TIP3P_r_1_min_BIG.out \
 -r wilde_GPU_TIP3P_r_1_min.rst7 \
 -x wilde_GPU_TIP3P_r_1_min_BIG.nc \
 -inf wilde_GPU_TIP3P_r_1_min.info \
 -l wilde_GPU_TIP3P_r_1_min.log 
#
if grep -q "Total wall time" wilde_GPU_TIP3P_r_1_min_BIG.out  ; then
#
# Production
#
${pmemd} -O \
 -p ${PRMTOP} \
 -c wilde_GPU_TIP3P_r_1_min.rst7 \
 -ref ${INPCRD} \
 -i ../../water_added_MD.in \
 -o wilde_GPU_TIP3P_r_1_MD_BIG.out \
 -r wilde_GPU_TIP3P_r_1_MD.rst7 \
 -x wilde_GPU_TIP3P_r_1_MD_BIG.nc \
 -inf wilde_GPU_TIP3P_r_1_MD.info \
 -l wilde_GPU_TIP3P_r_1_MD.log 
#
fi 

