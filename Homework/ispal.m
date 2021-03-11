% Nathan Holmes
% October 19, 2017
% Section 208
% Homework 6
function [out] = ispal(str)
% Returns a logical TRUE or FALSE if the input string is a palindrome
%   INPUTS:     str --  string to be tested by the function
%   OUTPUTS:    out --  logical TRUE or FALSE if the string is a palindrome
newStr = lower(strrep(str,' ','')); % makes str lowercase; replaces any spaces in str with nothing
n = numel(newStr); % number of elements in the string without spaces
logTest = logical(newStr(1:1:n) == newStr(n:-1:1)); % logical test to see if each letter matches
out = logical(sum(logTest) == n); % if each letter matches, sum of the logTest will equal n

% strcmp and fliplr
end

