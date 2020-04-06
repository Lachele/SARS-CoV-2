# Very initial simulation results

__The info currently at top level in this directory will be moved somewhere
else for better organization.  This info will move with it.__

The time is:  Thu Apr  2 23:48:15 EDT 2020

This directory contains files used to produce a very preliminary 
simulation of lavandulyl acetate in the binding pocket of the main
protease of SARS-CoV-2.  

## Simulation Details

* Gas phase, plain (dielectric=1)
* Total simulated time:  1 ns
* The lavandulyl aetate and the binding region
  were unrestrained.
* A restraint on the CA atom (carbon-alpha) was used for
  the rest of the simulated part of the protease.
* SHAKE was applied allowing for a 2 fs time step.

## Video info

The animated gif in the directory shows the trajectory from
the simulation.  Every step represents 1/500th of a nanosecond.
That is, each frame shows the state 2 picoseconds after the 
previous frame. 

The part of the protein that was simulated is in gray.  Portions
of the protein that are far from the binding site were left out
of the simulation to make the simulations go faster.  Because I
chopped part of the protein off, I restrained parts of it so that
it would be more likely to keep a reasonable shape.  I did not
restrain the movements of the binding region or the ligand.

The ligand, lavandulyl acetate, is rendered in a nice lavender 
shade because that seems entirely appropriate.  

The binding region is outlined/highlighed in yellow.  I defined 
the binding region to be all residues that touched any part of 
the continuous region of depressions in the region occupied by
the inhibitor shown in PDB ID 6lu7.  I did this by visual 
inspection.  That is, the binding site represented here is whatever 
I thought looked like part of the binding site. 

I'm not sure I like an animated gif for this, but that's what I
have at the moment.

## Files in this directory

README.md __This file__

### Structure input files
sample_leap.in  __Leap input used to make the parm7/rst7 input__
lav-ace-6lu7_protein.pdb  __PDB file of the protein as exported from Nanome__
lav-ace-6lu7_ligand.pdb  __PDB file of the ligand in the pose exported from Nanome__
lav-ace-6lu7_ligand.prep __Prep file generated from the pdb version__
lav-ace-6lu7.parm7 __Initial parameter-topology file for the complex__
lav-ace-6lu7.rst7 __Initial input-coordinate file for the complex__
selections_6lu7 __Directory containing info about selecting parts of the protein__

### Simulation control files
first_min.in  __First minimization control file__
second_min.in __Second minimization control file__
MD.in  __Molecular dynamics control file__


### Visualizations
lav-ace-6lu7_md.vmd __Simple VMD visualization of the complex__
lav-ace-6lu7_md-pretty.vmd __Visualization used to make the images herein and the gif__
lav-ace-6lu7 __Tachyon input file for rendering tga/png images__
lav-ace-6lu7.tga __TGA image made by Tachyon from "md-pretty"__
lav-ace-6lu7.png __PNG version of the TGA file__
lav-ace-6lu7-initial-MD.gif __Too large for GitHub. Available upon request.__

### Simulation output files
lav-ace-6lu7_min1.nc  __First minimization trajectory__
lav-ace-6lu7_min1.out  __First minimization run info log__
lav-ace-6lu7_min1.rst7  __First minimization restart file__
lav-ace-6lu7_min2.nc  __Second minimization trajectory__
lav-ace-6lu7_min2.out  __Second minimization run info log__
lav-ace-6lu7_min2.rst7  __Second minimization restart file__
lav-ace-6lu7_md.nc   __Molecular dynamics trajectory__
lav-ace-6lu7_MD.out   __Molecular dynamics run info log__
lav-ace-6lu7_md.rst7   __Molecular dynamics restart file__
