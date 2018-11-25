#!/bin/sh

# Quit script if any step has error:
set -e

# Generate the mesh from script (msh2 format is currently the latest gmshToFoam recognizes):
gmsh -3 -o main.msh -format msh2 mesh/main.geo
# Convert the mesh to OpenFOAM format:
gmshToFoam  main.msh -case case
# Adjust polyMesh/boundary:
changeDictionary -case case
# Finally, run the simulation:
simpleFoam -case case

