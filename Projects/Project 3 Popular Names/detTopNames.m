% Nathan Holmes
% nlholmes@ncsu.edu
% 11/13/2017
% Lab Section 208
% Project 3: Baby Names, Fall 2017

function topNames = detTopNames(yearOfB,top)
% Determines the top boy and girl names in a year by getting that info from the data files
%       INPUT:  yearOfB     --  integer from 1880 to 2016
%               top         --  integer from 0 to 100, represents the number of names to display
%       OUTPUT: topNames    --  a cell array with top rows and two columns,
%                               first is girls, second is boys, both as character arrays

% data files are in the naming format 'yob####', where #### specifies the year
%   within the files, commas separate in the format 'name,gender,number'
%       where gender is either 'M' or 'F' and number is the quantity of children named 'name'


% sprintf faster than concatenation
file = sprintf('yob%d.txt',yearOfB); % make the filename in the string format 'yob####.txt';
fid = fopen(file,'r'); % opens the file with read permission
fileScan = textscan(fid,'%s %s %d','delimiter',','); % 3 strings with comma delimiter

% Now need to find top names to the number specified
% sort command has a 'descend' option to have all maxes at top
    % file is also already sorted like that so no need
% need to split up fileScan by gender of names for top boy and girl output

fDex = ismember(fileScan{2},'F'); % index of where the female names are
femaleNames = fileScan{1}(fDex); % names where first col of fileScan has female names
mDex = ismember(fileScan{2},'M'); % index of where the male names are
maleNames = fileScan{1}(mDex); % names where first col of fileScan has male names

topNames = [femaleNames(1:top),maleNames(1:top)]; 
    % concatenates top number of names at the start of each list since the
    % files are already sorted in decreasing order for number of occurences

fclose('all');
end