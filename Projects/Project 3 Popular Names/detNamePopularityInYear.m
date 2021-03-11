% Nathan Holmes
% nlholmes@ncsu.edu
% 11/13/2017
% Lab Section 208
% Project 3: Baby Names, Fall 2017

function popularity = detNamePopularityInYear(yearOfB,name,gender)
% Determines the occurances of a particular name given the year and gender 
% by searching through the data file
%   INPUT:  yearOfB     --  integer from [1880 to 2016], or a vector of
%                           integers in this range
%           name        --  string for name to search for
%           gender      --  string either 'M' or 'F' or 'm' or 'f'
%   OUTPUT: popularity of name
%               if found: is int32
%               if NOT found: is empty vector
+-
popularity = []; % preallocate
for e = min(yearOfB):max(yearOfB) % go through the loop starting as e = min and continue from there
    filename = sprintf('yob%d.txt',e); % makes the filename
    FID = fopen(filename,'r'); % read permission for file
    scan = textscan(FID, '%s %s %d','delimiter',','); % scans file, into string string number cell array


    % popularity is in third column of scan, name is second
    % logical index of where the name is, also for gender in case is both male and female name
    genderDex = ismember(scan{2},upper(gender)); % gets the logical index for the gender the user input
    nameDex = ismember(scan{1},name); % gets the logical index for the name

    trueDex = genderDex & nameDex == 1; % where both gender and name are correct
    %scan{3}(:) == 5; works properly for numbers, not strings? -- use ismember for that
    if length(yearOfB) > 1 & isempty(scan{3}(trueDex)) == 1 % if yearOfB is a VECTOR input
        popularity = [popularity, 0]; % all empty cells must be zeroes instead
    else % if it is just a single input, then an empty needs to be returned if it didnt show up
        popularity = [popularity,scan{3}(trueDex)]; % gets the value for popularity by indexing
    end
end
fclose('all');
end