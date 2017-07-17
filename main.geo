Include "naca.geo";
Include "WindTunnel.geo";

// Units are multiples of chord.

ce = 0;
Point(ce++) = {0, 0, 0};

XX = 12;
PointCount = 100;
AirfoilLc = 0.01;
Call SymmetricAirfoil;

WindTunnelHeight = 10;
WindTunnelLength = 20;
WindTunnelLc = 1;
Call WindTunnel;

Surface(ce++) = {WindTunnelLoop, AirfoilLoop};
TwoDimSurf = ce - 1;

ids[] = Extrude {0, 0, 5 * AirfoilLc}
{
	Surface{TwoDimSurf};
	Layers{1};
	Recombine;
};

Physical Surface("outlet") = {ids[2]};
Physical Surface("tunnel") = {ids[{3, 5}]};
Physical Surface("inlet") = {ids[4]};
Physical Surface("airfoil") = {ids[{6:8}]};
Physical Volume("volume") = {ids[1]};

