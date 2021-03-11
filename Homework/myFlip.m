function [fmat] = myFlip(mat)
% Flips a matrix along the horizontal dimension using programming methods
%   Input:  mat     ---     a mxn 2D array
%   Output: fmat    ---     input array mat flipped horizontally

[r,c] = size(mat);
fmat = []; % initialize rcount as equal to rows in mat
for i = r:-1:1
    fmat = [fmat;mat(i,1:end)];

end

