
Macro WindTunnel
    WindTunnelLines[] ={};
    Point(ce++) = {WindTunnelLength / 2, -WindTunnelHeight / 2, 0, WindTunnelLc};
    StartPoint = ce - 1;
    Point(ce++) = {WindTunnelLength / 2, WindTunnelHeight / 2, 0, WindTunnelLc};
    Line(ce++) = {ce - 3, ce - 2};
    WindTunnelLines += ce - 1;

    Point(ce++) = {-WindTunnelLength / 2, WindTunnelHeight / 2, 0, WindTunnelLc};
    Line(ce++) = {ce - 4, ce - 2};
    WindTunnelLines += ce - 1;

    Point(ce++) = {-WindTunnelLength / 2, -WindTunnelHeight / 2, 0, WindTunnelLc};
    Line(ce++) = {ce - 4, ce - 2};
    WindTunnelLines += ce - 1;

    Line(ce++) = {ce - 3, StartPoint};
    WindTunnelLines += ce - 1;

    Line Loop(ce++) = WindTunnelLines[];
    WindTunnelLoop = ce - 1;
Return


