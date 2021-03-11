% Testing Space
%% Top Names function
tic

yearOfB = 2016;
top = 12;
% sprintf faster than concatenation
file = sprintf('yob%d.txt',yearOfB); % make the filename in the string format 'yob####.txt';
fid = fopen(file,'r'); % opens the file with read permission
fileScan = textscan(fid,'%s %s %s','delimiter',','); % 3 strings with comma delimiter

% Now need to find top names to the number specified
% sort command has a 'descend' option to have all maxes at top
%   file is also already sorted like that so no need
% need to split up fileScan by gender of names for top boy and girl output

% how to logically index? -- used loops instead
% femaleNames = fileScan{2} == 'F';
% maleNames = fileScan{2} == 'M';
fDex = ismember(fileScan{2},'F'); % index of where the female names are
femaleNames = fileScan{1}(fDex);
mDex = ismember(fileScan{2},'M');
maleNames = fileScan{1}(mDex);

topNames = [femaleNames(1:top),maleNames(1:top)]; % much faster
%{
femaleNames = {}; % preallocation
maleNames = femaleNames;

for i = 1:length(fileScan{2}) % for the length of the scan 
    if fileScan{2}{i} == 'F' && length(femaleNames) < top % if current name F and not all names found
        femaleNames = {femaleNames{:}, fileScan{1}{i}}; % all elements in femaleNames; makes row cell
    elseif fileScan{2}{i} == 'M' && length(maleNames) < top % if male name
        maleNames = {maleNames{:}, fileScan{1}{i}};
    end
end
topNames = [femaleNames',maleNames']; % returns cell array in column format

time = toc;
%}
%% Printing
num = 12;
a = {1:12};
cTop = num2cell(a{1}(1:end)');
printNames = [cTop,topNames]';
rgbhehehe = {'Rank','Girls','Boys'};
        fprintf('%-10s\t%-10s\t\t%-10s\n',rgbhehehe{:});
        fprintf('--------------------------------------\n');
        fprintf('%-10d\t%-10s\t\t%-10s\n',printNames{:});
%% Popularity in year function
yearOfB1 = 2016;
name = 'notanameatall';
gender = 'f';
filename = sprintf('yob%d.txt',yearOfB1); % makes the filename
FID = fopen(filename,'r'); % read permission for file
scan = textscan(FID, '%s %s %d','delimiter',','); % scans file, into string string number cell array


% popularity is in third column of scan, name is second
% logical index of where the name is, also for gender in case is both male and female name

genderDex = ismember(scan{2},upper(gender)); % gets the logical index for the gender the user input
nameDex = ismember(scan{1},name); % gets the logical index for the name

trueDex = genderDex & nameDex == 1; % where both gender and name are correct
%scan{3}(:) == 5; works properly for numbers, not strings? -- use ismember for that
popularity = scan{3}(trueDex); % gets the value for popularity by indexing


%% Plotting stuffs and case 2
        genderError = 1; % establish error variable
        rangeError = 1;
        q = 0; % establish quitting variable
        pop = []; % preallocate pop for the for loop below

        % for the tests
            name = 'Mary';
                gender = 'f';
                range = [1880 2016];
                for n = min(range):max(range) % from the first year to the last in the range entered
                    birthYear = n;
                    % concatenate pop with itself to make an array of popularity
                    pop = [pop,detNamePopularityInYear(birthYear,name,gender)];
                end
                
                % Plotting -- how to make xlims whole numbers?
                figure(1);
                hold on; % keeps the graph there
                plot(min(range):max(range),pop,'LineWidth',2); 
                    % plots the data; 2 LineWidth; matlab picks color
                    % plotted min and max of range for correct xlims
                xlabel('Year');
                ylabel('Number of Occurrences');
                title('Popularity of Names');
                xlim([min(range),max(range)+4]); % sets xlim to have a little space for name labels

                % labeling the names on the graph
                nameLabel = sprintf(' %s (%s)', name,gender); % format of 'name (gender)' as text
                xtext = max(range); % x position for text
                ytext = double(pop(:,end)); % y position for text -- last element of pop
                                            % is a double for text use purposes
                text(xtext, ytext, nameLabel);
                                        % puts nameLabel just right of the last data point in pop
                                        % y is dependent on pop, x is dependent on range

%% Tests for the testing
t = {'h','i','j','k'};
ismember(t,'k');


x = [1, 4, 6, 15];
plot(x);
text(2,4,'nope');

%% small jazz with rangeVec
range = [1880 1881 1882 1883 1884];
name = 'Bill';
pop = [10 14 3 12 4];
rangeVec = [min(range):max(range)];
                fprintf('%s was most popular in %d, with %d occurrences.\n', ... 
                    name,rangeVec(pop == max(pop)),max(pop)); 
                        % logical index for year inot rangeVec using pop


%% Improving detTopNames -- vectorization as to eliminate loop in main script -- maybe can vectorize in main instead?
tic
yearOfB = [1880];
name = 'Mary';
gender = 'F';
popularity = [];

for e = min(yearOfB):max(yearOfB)
    filename = sprintf('yob%d.txt',e); % makes the filename
    FID = fopen(filename,'r'); % read permission for file
    scan = textscan(FID, '%s %s %d','delimiter',','); % scans file, into string string number cell array


    % popularity is in third column of scan, name is second
    % logical index of where the name is, also for gender in case is both male and female name
    genderDex = ismember(scan{2},upper(gender)); % gets the logical index for the gender the user input
    nameDex = ismember(scan{1},name); % gets the logical index for the name

    trueDex = genderDex & nameDex == 1; % where both gender and name are correct
    %scan{3}(:) == 5; works properly for numbers, not strings? -- use ismember for that
    popularity = [popularity,scan{3}(trueDex)]; % gets the value for popularity by indexing
end
fclose('all');
toc







