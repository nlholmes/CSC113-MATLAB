function pstr = plotFormatting()
% Creates a plot formatting string
%   Inputs: none, uses the input() function
%   Outputs: pstr, a string for formatting a plot
color = input('Enter a color (red,blue, or green): ','s');
point = input('Enter a point marker (* or o): ','s');
pstr = [color(1),point]; % only need the first letter of color because thats how matlab takes it

end

