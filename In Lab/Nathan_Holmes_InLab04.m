% Nathan Holmes
% 9-15-2017
% Section 208
% In-Lab 4

clear all; close all; clc % clear functions
%% Instructor-Guided Portion
%% Problem 1 - Nested Loops
% Re-create the printed text using nested for loops.
for apple = 0:4 % repeats line to line
    for orange = 1:2 % repeats twice per line
        for pineapple = 0:apple % repeats dep on line
            fprintf('*');
        end
        for banana = 4-apple:-1:0 % repeats dep on line
            fprintf('.');
        end
        fprintf('%d', apple);
    end
    fprintf('\n'); % go to next line
end


%% Problem 2 - Factoring
% Prompt the user for an integer, then display the smallest factor.

% Prompt user for input (assumed positive whole number):
num = input('Enter an integer: ');

% Use a single while loop to find smallest factor:
fa = 2; % initialization

while rem(num,fa) ~= 0 % while not divisible by fa
    fa = fa + 1; % update variable fa
end
% Print smallest factor to command window:
fprintf('The smallest factor of %d is %d\n',num,fa);


%% Problem 3 - Taylor Series Approximation
% Approximate cos(x) using a Taylor series, then compare.

% Prompt user for input x (in radians):
x = input('Enter a value for x (in radians): ');

% Compute actual value of cos(x), use while loops to approximate using
% Taylor series. Stop loop when within +/-0.001 of actual value.
% initialization of variables
act = cos(x);
app = 1;
tol = 0.001;
n = 1;

while abs(act - app) > tol % while the approx is outside tolerance
    n = n + 1; % update n
    app = app + (-1)^(n + 1)*x^(2*(n - 1))/factorial((2*(n - 1)));
end
% Print results to command window, including number of loop iterations:
fprintf('Actual value: %.3f\n',act);
fprintf('Approx value: %.3f\nIt took %d terms to approximate cos(x)\n',app,n);


%% Independent Portion

