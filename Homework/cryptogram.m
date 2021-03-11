% Nathan Holmes
% October 19, 2017
% Section 208
% Homework 6
function cryptogram(str)
% Makes a cryptogram puzzle
%   INPUT:  str     -- string to make into a cryptogram
%   OUTPUT: none    -- prints key and encoded string to the command window
upStr = upper(str);
strAscii = double(upStr); % converts upper case string to ASCII

alphabet = ['A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I' 'J' 'K' 'L' 'M' 'N' 'O' 'P' 'Q' 'R' 'S' 'T' 'U' 'V' 'W' 'X' 'Y' 'Z'];
alphabetAscii = double(alphabet); % changes alphabet to ASCII
cryptNums = randperm(26) + 64; % creates 26 random numbers from 65 to 90 (range of alphabet ASCII)

[r,c] = size(strAscii);
encryptAscii = ones(r,c); % initializes a vector of ones that is the size of the str
for crypti = 1:numel(strAscii) % loop through for each ASCII value in the string
    currentAscii = strAscii(:,crypti); % ASCII value of the current letter
    % sum of logicals to see if the currentAscii is in alphebetAscii
    if sum(logical(alphabetAscii == currentAscii)) == 1  % (if currentAscii is a letter)
        for cryptj = 1:26 % loop through 26 times (size of alphabetAscii b/c 26 letters in alphabet)
            check = alphabetAscii(:,cryptj) == currentAscii; % check to see if the currentAscii is the current element of alphabetAscii
            if check == 1 % if it is
                newAscii = cryptNums(:,cryptj); % the new corresponding ASCII value in cryptNums
                encryptAscii(:,crypti) = newAscii; % for whatever element in the input ascii changes to newAscii 
                finalStr = char(encryptAscii); % convert to character
            end
        end
    else % if it is not a letter
        encryptAscii(:,crypti) = currentAscii; % makes boxes if this isn't here - needs this for updating finalStr after the space
        finalStr = char(encryptAscii); % convert original ASCII to character
            % if this is currentAscii and not encryptAscii, does not work for the end
            % punctuation, but everything before and after still works
    end
end

% Printing everything
cryptPrint = char(cryptNums);
fprintf(' %s \n',alphabet);
fprintf(' %s \n',cryptPrint);
fprintf('\n %s \n\n',finalStr);
end