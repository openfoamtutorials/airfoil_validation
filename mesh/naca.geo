// This returns normalized y for a symmetric airfoil.
Macro NACA00
    // x is the normalized chord position in [0, c].
    // XX is the last 2 digits, which dictates maximum thickness.
    // NACA0012 for XX = 12, and maximum thickness is 0.12 of chord.
    y = 0.2969 * x^0.5;
    y += -0.1260 * x;
    y += -0.3516 * x^2;
    y += 0.2843 * x^3;
    y += -0.1015 * x^4;
    y *= 5.0 * XX / 100.0;
Return

Macro SymmetricAirfoil
    // draws a symmetric airfoil, given XX as in NACA00XX.
    // PointCount specifies number of points.
    // Draws le at {0, 0} and te at {1, 0}.
    // ce is the current point id.
    // AirfoilLc is the length characteristic on airfoil surface.
    // Results: le, te, upper[], lower[], AirfoilSurface
    x = 0;
    increment = 1.0 / PointCount;
    Point(ce++) = {0, 0, 0, AirfoilLc};
    le = ce - 1;
    Point(ce++) = {1, 0, 0, AirfoilLc};
    te = ce - 1;
    upper[] = {};
    lower[] = {};
    For x In {increment: 1 - increment: increment}
        // Printf("%f", x);
        Call NACA00;
        Point(ce++) = {x, y, 0, AirfoilLc};
        upper = {ce - 1, upper[]};
        Point(ce++) = {x, -y, 0, AirfoilLc};
        lower += ce - 1;
    EndFor
    Line(ce++) = {te, upper[0]};
    upperTe = ce - 1;
    Line(ce++) = {lower[#lower[] - 1], te};
    lowerTe = ce - 1;
    BSpline(ce++) = {upper[], le, lower[]};
    AirfoilSurface = ce - 1;
    Line Loop(ce++) = {upperTe, AirfoilSurface, lowerTe};
    AirfoilLoop = ce - 1;
Return

