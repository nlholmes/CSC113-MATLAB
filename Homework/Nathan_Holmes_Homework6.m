%% Header
% Nathan Holmes
% October 19, 2017
% Section 208
% Homework 6

%% Problem 1
ispal('rAts LIVe on no Evil star');
ispal('No lemons no melon');
ispal('Eva can I stab bats in a cave');

%% Problem 2
% Part a
metName = {'Aluminum','Copper','Iron','Molybdenum','Cobalt','Vanadium'};
metSymb = {' Al ',' Cu ',' Fe ',' Mo ',' Co ',' V '};
atomNum = int8([13, 29, 26, 42, 27, 23]);
atomW = single([26.98, 63.55, 55.85, 95.94, 58.93, 50.94]);
density = double([2.71, 8.94, 7.87, 10.22, 8.9, 6.0]);
cryStruct = {' FCC ',' FCC ',' BCC ',' BCC ',' HCP ',' BCC '};
% Part B
elementData = {metName, metSymb, atomNum, atomW, density, cryStruct};
% Part C ---------------- might be able to do more efficiently?
    % Part i
    Cobalt_name = elementData{1}(5);
    Cobalt_structure = elementData{6}(5);
    Cobalt_atomic_number = elementData{3}(5);
    % Part ii
    elemNames = elementData{1};
    % Part iii
    avgAtomW = sum(elementData{4})./numel(elementData{4});
    
%% Problem 3

dateNum2Str([10 23 2077]);

%% Problem 4
% only inputs are letters, numbers, and spaces
% variable name cannot start with a number 
% make new variable name camel case

toVar = input('Input variable name: ');
inputError = 1;
while inputError == 1
    % if first character is a number and not a letter (str2num would return a logical isempty value of 1)
    if ischar(str2num(toVar(1))) == 0 && isempty(str2num(toVar(1))) == 0
        disp('Error: variable name must start with a letter');
        toVar = input('Input a variable name: '); % get another input
        inputError = 1; % continue loop
    else
        inputError = 0; % stop loop
    end
end

length = numel(toVar); % length of input name
newVar = lower(toVar); % makes input name all lowercase (for output)
for i = 1:length % repeat as many times as the input is long
    if toVar(i) == ' ' % if the current character in toVar is a space, capitalize the next char in newVar
        newVar(i+1) = upper(newVar(i+1)); 
    end
end
newVar = strrep(newVar,' ','') % gets rid of spaces in the toVar

%% Problem 5
cryptogram('Why do cows have hooves instead of feet?');
cryptogram('Because they lactose.');





