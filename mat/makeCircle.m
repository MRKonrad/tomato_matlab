function mask = makeCircle(radius, circsize, circcenter)
%MAKECIRCLE Summary of this function goes here
%   Detailed explanation goes here

[x, y] = meshgrid(1:circsize(1), 1:circsize(2));
mask = (x-circcenter(1)).^2 + (y-circcenter(2)).^2 < radius^2;

end