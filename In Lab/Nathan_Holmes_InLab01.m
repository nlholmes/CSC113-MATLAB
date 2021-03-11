% Nathan Holmes
% 8/25/2017
% Section #208
% In-Lab 1

clear all; close all; clc %clear functions
%% Instructor-Guided Portion
%% Problem 1 - Errors
% The following comments may have errors. 
% Add comments to explain the errors, 
% then write the repaired command after the comment.

% a. ayy = (15+6)*16+3(6+9)
ayy = (15+6)*16+3*(6+9);
% Error: missing multiplication sign
% b. B = mean(1,17,43)
B = mean([1,17,43]);
% c. 3c = 3:12:1
c3 = 3:-1:1;
% Error: variable
% Suggestion: change step size to get a non-empty vector
% d. dee = atan(linspace([1,15,6]))
dee = atan(linspace(1,15,6));
% Error: need multiple inputs for linspace
% e. for = logspace(1,15,6)
four = logspace(1,15,6);
% Error: for is a reserved keyword

%% Problem 2 - Basic Functions
% Create variables x, y, and z
% Assign unique integer values so that x < y < z
x = 1;
y = 2;
z = 73;
% Perform operations:

% a. Find the product of all three variables:
mult = x.*y.*z;
% b. Find the difference of x minus y, then divide by x minus z:
math = (x-y)./(x-z);
% c. Create a 3x3 matrix with x, y, and z on the top, middle, and bottom rows:
m = [x,x,x; y,y,y; z,z,z];
% d. Create a matrix from y to z using x amount of values using linspace:
vec = linspace(y,z,x);
% e. Create a matrix from y to z in intervals of x:
vec2 = y:x:z;


%% Problem 3 - Matrix Manipulation and formatting
% Create the matrix, mat. 
mat = magic(4);
% Using mat, create mat2-mat4 using matrix manipulation commands.
% List and perform operations:

% switch the first and fourth column
mat2 = [mat(:,4), mat(:,2:3), mat(:,1)];

% add the first two rows of mat to the end of mat2
mat3 = [mat2;mat(1:2,:)];

% add two then multiply by 3
mat4 = (mat3+2).*3;

% determine rows and columns, transpose and compare
[r,c] = size(mat4);
[rt, ct] = size(mat4');

% find the mean value of each row
rowAvg = mean(mat4');

% find the column maxes and corresponding rows
[colMax, maxI] = max(mat4);

%% Independent Portion - Submit in Cody and Copy Solutions Below

