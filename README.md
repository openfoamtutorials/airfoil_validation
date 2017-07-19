# airfoil_validation
NACA0012 OpenFOAM results are compared to experimental data.

(under construction)
1. Generate the mesh: gmsh -3 -o main.msh mesh/main.geo
2. Convert the mesh to OpenFOAM format: gmshToFoam main.msh -case case
3. Adjust polyMesh/boundary: changeDictionary -case case
4. Finally, run the simulation: simpleFoam -case case
5. For ParaView: touch case/view.foam
6. Open view.foam in ParaView
