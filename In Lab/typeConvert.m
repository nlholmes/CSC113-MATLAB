function [cellOut] = typeConvert(in)
% Takes a numerical input and converts it into
% double, uint8, int16, ascii value, string, and logical
%   INPUTS: in          --   numerical value that is to be converted
%   OUTPUT: cellOut     --   2x3 cell array that contains the converted values

dob = double(in);
u8 = uint8(in);
i16 = int16(in);
ascii = char(in);
string = num2str(in);
notDatLog = logical(in);

cellOut = {dob, u8, i16, ascii, string, notDatLog};

end

