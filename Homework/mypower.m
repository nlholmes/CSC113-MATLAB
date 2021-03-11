% Nathan Holmes
% 11/10/2017
% Section 208
% Homework 8

function [out] = mypower(a,n)
% Recursive function
% Format: out = a^n
% INPUTS:   a -- an integer
%           n -- a non-negative integer

if n == 0 % if exponent is zero
    out = 1;
else % if exponent is some other positive integer
    out = a * mypower(a,n-1); % a*a n number of times
end
end