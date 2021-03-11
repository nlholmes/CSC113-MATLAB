% Nathan Holmes
% 11/17/2017
% Section 208
% In-Lab 10

clear all; close all; clc % clear functions
%% Instructor-Guided Portion
%% Problem 1 - Snow Plotting
% Import the data file and predict the snow accumulation.

% Load snowd.dat imported from Moodle:
load snowd.dat
% a. Fit a quadratic curve to the data:
x = 1:length(snowd);
p = polyfit(x,snowd,2);
% b. Predict when the snow will completely disappear:
r = roots(p);
noSnow = ceil(max(r));
% c. Co-plot the snow data and the quadratic curve:
xp = linspace(0,noSnow);
% Plot the snow data:
figure;
plot(x,snowd,'wo');
% Plot the quadratic curve:
hold on
plot(xp,polyval(p,xp),'b');
% Set plot properties:
set(gca,'color','k');
axis([0, noSnow, 0, max(snowd)]);
xlabel('Week #');
ylabel('Snow Depth (in)');
title(sprintf('Snow Gone Week %d',noSnow));


%% Problem 2 - Enthalpy
% Solve for the change in enthalpy of oxygen.

% Set variable T as symbolic:
syms T
% Assign variable constants given in problem:
a = 25.48;
b = 1.523e-2;
c = -0.716e-5;
d = 1.312e-9;
T1 = 300;
T2 = 1000;
% Use the given integral to find change in enthalpy:
eq2int = a+b*T+c*T^2+d*T^3;
deltaH = double(int(eq2int,T1,T2));

%% Problem 3 - Quadratic Formula
% Create a symbolic expression for the quadratic equation and solve.

% Create symbolized variables:
syms a b c x
% Write equation using symbolized variables:
quad = a*x^2+b*x+c;
% Solve using the quadratic equation and display:
x = solve(quad,x);
pretty(x); % displays the quadratic formula in a pretty format to the command window
% Substitute given constants into equation and solve using subs():
a = 1/21;
b = 46;
c = -2016;
x = double(subs(x)); % because named same and overwritten

%% Problem 4 - Matrix Math
% Write the system of equations as matrices and solve for x, y, and z.

% Re-write as matrices (AX=B):
A = [2 7 1; 2 0 3; 4 1 3];
B = [2;1;3];
% a. Find the inverse and determinant of A:
AInv = inv(A);
Adet = det(A);
% b. Solve for unknowns using left divide (A\B):
ans1 = A\B;
% c. Solve for unknowns using inverse matrix multiplcation (A-1*B):
ans2 = AInv*B;

%% Independent Portion

