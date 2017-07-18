# airfoil_validation
NACA0012 OpenFOAM results are compared to experimental data.

(under construction)
1. Generate the mesh: gmsh -3 -o main.msh mesh/main.geo
2. Convert the mesh to OpenFOAM format: gmshToFoam main.msh -case case
3. Adjust case files: ?
4. simpleFoam
5. paraView
