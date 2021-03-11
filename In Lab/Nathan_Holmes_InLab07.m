% Nathan Holmes
% 10/20/2017
% Section 208
% In-Lab 7

clear all; close all; clc % clear functions
%% Instructor-Guided Portion
%% Problem 1 - Sorry Pluto :( 
% Download planets.xlsx from Moodle and perform the operations. 

% Import the data set using xlsread():
[~,~,raw] = xlsread('planets.xlsx');

% a. Create a padded character array containing the planets’ names:
names = char(raw{:,1});

% b. Create a double-precision array containing the planets’ masses:
mass = cell2mat(raw(:,2));

% c. Create a cell array containing the planets’ year lengths:
years = raw(:,3);

% d. Create a double-precision array that with the mean orbital velocities:
vel = cell2mat(raw(:,4));

% e. Store the arrays created in parts a-d in a structure array:
for i = 1:length(mass) % all have the same number of elements
    planets(i).name = names(i,:); % gives all characters in name
    planets(i).mass = mass(i);
    planets(i).year = years{i}; % still a cell array
    planets(i).velocity = vel(i);
end

% f. Index given variables:
% i. Name of Mars:
mar = planets(4).name;

% ii. Mass of Jupiter:
jupiterMass = planets(5).mass;
% iii. Year length of Neptune:
neptuneYear = planets(8).year;

% iv. Mean orbital velocity of Earth:
earthVelocity = planets(3).velocity;

%% Problem 2 - Textscan()

% Open file CFR1869to2010.txt after donwloading it from moodle.
mars = fopen('CFR1869_2010.txt','r');
% Use textscan() to import data from the file.
allDat = textscan(mars,'%d %s %f %f %f %f %f','Delimiter',':,');
% Close file
fclose(mars);
% Begin loop to create structure
for i = 1:length(allDat{1}) % go into cell array to get number of elements
    % dynamic variable technique - paranthesis around variable name using
    teamname = strrep(allDat{2}{i},' ',''); % replace spaces with nothing
    
    fbStats.(teamname).rank = allDat{1}(i); % rank of specific team
    fbStats.(teamname).totalPts = allDat{3}(i);
    fbStats.(teamname).winPct = allDat{4}(i)/10; % divide by ten b/c listed out of 1000
    fbStats.(teamname).bowlRank = allDat{7}(i);
end

%% Problem 3 - Thermocouples 
% Load thermocouple.dat from Moodle and organize the data into separate
% text files.

% Import thermocouple data file:
data = load('thermocouple.dat');

[r,c] = size(data);
% Print each sensor data to a separate .txt file:
for i = 1:c
    filename = sprintf('Thermocouple%d.txt',i);
    fid = fopen(filename,'w');
    fprintf(fid,'%.1f\n',data(:,i));
end

% Close the files:
fclose('all');

%% Independent Portion

