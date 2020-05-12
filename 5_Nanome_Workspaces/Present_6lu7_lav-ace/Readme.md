# Workspaces for showing others what I'm doing

## Order of workspaces and brief descriptions

1. show.binding.region.nanome 

To make things go faster, I didn't simulate the entire protease.  This 
workspace shows the part of the protease that I chose for simulation. 
Shown in the workspace are the original structure, including the 
inhibitor, in ball-and-stick.  On top of that, represented as a surface,
is the region I chose for simulation.  

Because I chopped the protease in half, I restrained many of the atoms
during the simulation.  But, I let the ligand move freely and only used
light restraint on the carbon-alpha's in the binding region.  I placed
heavier restraints on carbons near the binding region, and used heavy
restraints on all atoms far from the binding region.


2. show.alignment.nanome

This workspace is designed to show how I used Nanome to align the 
lavandulyl acetate moledule to the known inhibitor.

3. show.trajectory.nanome

This workspace shows frames spanning about 30 ns of simulated motion of
the lavandulyl acetate in the binding site.  Of interest is that the
acetate part of the molecule doesn't move a lot, even when the rest of
the molecule moves quite a lot more.

4. show.decoy.trajectory.nanome

This is a trajectory that is similar to the last one except that I changed
all the oxygens in the lavandulyl acetate to be analogous carbons.  Doing
this changes the binding chemistry.  During this short simulation, also 
about 30 ns, this carbon analog molecule moves around a lot more than the
lavandulyl acetate.  These results are preliminary, but they suggest that
the lavandulyl acetate can bind somewhat well to the protease.

