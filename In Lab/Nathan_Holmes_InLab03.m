% Nathan Holmes
% 9-8-2017
% Section 208
% In-Lab 3

clear all; close all; clc %clear functions
%% Instructor-Guided Portion
%% Problem 1 - M-m-m-money
% Write an if statement to calculate an employee's weekly pay.
% The employee makes $15 for the first 40 hours in the week.
% For every additional hour beyond 40, the employee makes time-and-a-half.

% Input variable:
hours = input('How many hours did you work this week?');
rate = 15;
% Conditional if statement:
if hours <= 40 %regular pay
        pay = hours*rate;
else %overime condition
        pay = rate*40+1.5*(hours-40);
end


%% Problem 2 - Trip Calculator
% Use a switch/case statement to display the travel distance from Raleigh.
% Use a menu to get input from the user, print distance to command window.

% Menu to produce input:
choice = menu('Where would you like to go?','Wilmington','Charlotte','Miami','New York City');

% Switch/Case to select mileage:
switch choice
    case 1 %Wilmington
        miles = 140;
    case 2 %Charlotte
        miles = 162;
    case 3 %Miami
        miles = 806;
    case 4 %NYC
        miles = 492;
    otherwise %if window is closed
        miles = 'You aren''t going anywhere.';
end

% Print (unsuppressed) to command window:
disp('Distance to selected city:')
disp(miles)


%% Problem 3 - Matrix Manipulation and formatting
% Use the given max temperatures to perform the listed operations.

% Temps for Aug 2014 from NOAA:
temps = [76 70 80 85 88 90 86 81 74 81 84 87 82 83 86 89 89 88 86 90 ...
    91 92 84 81 79 82 86 92 82 89 91];
    % Note: use "..." to continue code onto next line

% Find the average, and the number of days the temp was above average:
avTem = mean(temps);
aboveAvg = sum(temps > avTem);

% Find the number of days where the temp ranged 80-90°F
betweenTemps = sum(temps >= 80 & temps <= 90);

% Find the modal temp and which days this temp occurred (use find() )
freq = mode(temps);
modeDays = find(temps == freq); %gives non-zero elements


%% Independent Portion
% See Cody Coursework for problems
