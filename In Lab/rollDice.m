function [d1, d2] = rollDice(n)
% Simulates rolling two n-sided dice
%   Inputs:     n  -- number of sides
%   Outputs:    d1 -- die result 1
%               d2 -- die result 2
d1 = randi(n);
d2 = randi(n);
end