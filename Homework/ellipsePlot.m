function ellipsePlot(xc,yc,a,b)
% Plots an ellipse
%   Inputs: xc  --  x coordinate for center of ellipse
%           yc  --  y coordinate for center of ellipse
%           a   --  semimajor axis length
%           b   --  semiminor axis length

t = linspace(0,2*pi); % linearly spaced t values
x = a.*cos(t) + xc; % x(t)
y = b.*sin(t) + yc; % y(t)
plot(x,y); % simple plot

end

