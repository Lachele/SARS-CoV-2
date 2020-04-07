# Molecular Dynamics Files

Large output files might need to go elsewhere, but the files
required for doing the simulations will be in this directory 
and, as appropriate, in the Scripts directory.

The organization of this directory is:

. (this directory)
├── Any files that pertain to the directory in general
├── Each Protein gets a directory
│   ├── Files relevant to the protein in general
│   ├── Each ligand complexed to that protein gets a directory
│   │   ├── Files relevant to the ligand in general
│   │   └── Each pose of the ligand gets a directory
│   │       ├── files relevant to the pose in general
│   │       ├── rN_*  Files for replica N start with rN_
└── very_preliminary_data
    ├── This directory contains some very early MD output

# Molecular Dynamics Overview

Because our concern is volatile substances that interface between
the air and the parts of our bodies that receive air, and because
I do not already know any better way, I will be doing these simulations
in both the gas phase and in solvent.

## Gas Phase Simulations

These will take place in these general ways:

* Dielectric = 1 
* A series of minimizations
* MD at 300 K

There will be three minimizations:
1. Only the binding site residues will be allowed to move, and they
   will be subject to a light restraint on their CA atoms.  The 
   ligand, and all other residues, will be restrained.  The purpose
   of this is to allow the binding site to relax around the ligand.
2. Similar to the first minimization except that the ligand will
   be completely unrestrained.  This minimization allows the ligand
   and the binding site to relax to each other.
3. Similar to the second minimization except that the residues
   near (within ~5 A of) the binding site will only be subject to
   a restraint on their CA atoms.  This minimization allows a little 
   relaxation of the residues near the binding site while allowing the
   ligand to move freely and while imposing only slight restraints on 
   the motions of the binding site itself.  

The MD will be subject to the restraints in the third minimization. 

## Solvent Phase Simulations

These will start from the structures in the third minimization from the
gas-phase simulations.  
