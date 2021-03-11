function promptNVec()
% prompts user for a positive integer and then returns a vector with values 1 to n
%   Inputs: none
%   Outputs: printed text and printed vector of values 1 to n


n = input('Enter a positive integer: '); % gets value of n
while n < 0 || rem(n,1) ~= 0 % if n is not a positive integer
    n = input('Invalid input! Enter a positive integer: '); % gets a value of n
end
fprintf('Your vector is: \n   ') % prints first line of text
fprintf('   %d   ',[1:n]); % prints values of vector
fprintf('\n'); % new line (for neatness)
end

