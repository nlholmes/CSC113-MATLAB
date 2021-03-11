% Nathan Holmes
% 9/1/2017
% 208
% In-Lab 2

clear all; close all; clc % clear functions
%% Instructor-Guided Portion
%% Problem 1 - Sensor Data - Summer 2015, Updated Fall 2017
% Download Sensor_data.xlsx from Moodle. 

% Import the data set using xlsread():


% a. Find the mean value for each sensor:


% b. Find the maximum value recorded for each sensor and the time:


% c. Co-plot the sensor results:



%% Problem 2 - Input/Output - Spring 2016
% Prompt the user for their name (a string):


% Prompt the user for an x value (in radians):


% a. Compute the sine, cosine, and tangent values of the input x:


% b. Use disp() and fprintf() to print results to the command window:



%% Problem 3 - Pro Graphs - Fall 2016
% Re-create the figure shown in the problem, making sure to match all
% styles, colors, titles, labels, and legends.

% Use the following variables:
t = linspace(0, 2*pi, 200); % theta values
r = abs(sin(3*t)); % polar flower, Cartesian sine wave


%% Independent Portion

