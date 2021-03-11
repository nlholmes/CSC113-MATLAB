function [out] = convertToBlank(in)
% Parses through a string and replaces all underscores with a blank space
%   INPUTS:     in  -   The string with underscores
%   OUTPUTS:    out -   The string with underscores replaced by white space
out = strrep(in,'_',' ');
end

