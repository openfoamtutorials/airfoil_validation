#!/bin/sh

# Quit script if any step has error:
set -e

# 1. Convert the mesh to OpenFOAM format:
gmshToFoam main.msh -case case
# 2. Adjust polyMesh/boundary:
changeDictionary -case case
# 3. Finally, run the simulation:
simpleFoam -case case

