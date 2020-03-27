# Overview of Current Workflow

1. Examine binding site structures, at wwPDB and elsewhere, of
   surface-exposed viral components.  I plan to do this in 2D
   (using VMD) and in 3D VR (using Nanome).
2. Survey volatile components of commonly available herbs,
   spices, scents, etc.  I will focus on products that are 
   widely available and inexpensive  I will also focus on 
   volatile compounds that are common to several products.  
3. Of these, find compounds that look like they might fit
   (this part requires "chemical intuition").
4. Have ChemDraw build initial 3D structures of any structures
   that look good.
5. Use the Nanome VR software to place the compounds in the
   binding sites in orientations that look reasonable (more
   "chemical intuition" here).  
6. Save any coordinates that look promising and build MD
   simulation files from them.
7. At first, try minimizations and simulations in the gas 
   phase (in vacuo, really) because ideally these componds 
   will stay stuck even in the air.
8. But, also try simulations in water because the virus 
   particles are likely to be in water droplets and other
   'wet' environments.


Numbered directories in the parent directory of this respository 
should correspond reasonably well to the workflow as described herein.
