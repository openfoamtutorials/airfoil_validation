# airfoil_validation

NACA0012 OpenFOAM results are compared to experimental data.

1. Set the desired angle of attack: variable "aoa" (degrees) in mesh/parameters.geo.
2. ./run.sh (see script for sub-steps)
3. Open "view.foam" in ParaView and/or view force coefficients in ./case/postProcessing/.

TODO:
1. Implement batch run, post-processing, and plotting script.
