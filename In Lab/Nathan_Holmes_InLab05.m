% Name: Nathan Holmes
% Section: 208
% Date: 9/29/2017
% In-Lab 05

clear all; close all; clc % clear functions
%% Instructor-Guided Portion
%% Problem 1 - rollDice.m
% Create a function to simulate the rolling of two n-sided dice. The
% function input determine the number of sides (variable n).

% Call function:
[die1,die2] = rollDice(6);

%% Problem 2 - plotFormatting.m
% Create a function without any inputs that asks the user for a color and
% symbol to use in a plot.

% Assign x and y vectors:
x = linspace(0,7*pi);
y = cosd(x);
% Call function nested in plot() command:
plot(x,y,plotFormatting());

%% Problem 3 - printAreaCirc.m
% Create a function to print the area and circumference for various radii
% as given in some input vector supplied by the user.

% Call function:
printAreaCirc(1:12);


%% Independent Portion

