# Molecular Dynamics Files

Large output files might need to go elsewhere, but the basics
for doing the simulations will be in this directory and, as
appropriate, in the Scripts directory.

The organization of this directory is:

. (this directory)
├── Any files that pertain to the directory in general
├── Each Protein gets a directory
│   ├── Files relevant to the protein in general
│   ├── Each ligand complexed to that protein gets a directory
│   │   ├── Files relevant to the ligand in general
│   │   └── Each pose of the ligand gets a directory
│   │       ├── files relevant to the pose in general
│   │       ├── rN_*  Files for replicate N start with rN_
└── very_preliminary_data
    ├── This directory contains some very early MD output


