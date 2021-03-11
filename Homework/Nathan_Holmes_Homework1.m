%% 
% Nathan Holmes
% 9/01/2017
% Section 208
% Homework 1

%% Problem 1

% Part a
% Create the matrix mat
mat = -2/3:1/3:2/3;
% Display mat in long format
format long;
mat;
% Display mat in bank format
format bank;
mat;
% Display mat in long e format
format long e;
mat;
% Display mat in short e format
format short e;
mat;
% Display mat in compact format
format compact;
mat;
% Display mat in loose format
format loose;
mat;
% Display mat in rat format
format rat;
mat;
% Display mat in short(default) format
format short;
mat;

% Part b
% Create a 2x5 matrix where both rows are equal to mat
mat2 = repmat(mat,2,1);

% Part C
% Transpose mat2
mat3 = mat2.';

% Part d
% Create a matrix that contains 5 linearly spaced values from -1 to 1
% Dot multiply this matrix with mat
mat4 = linspace(-1, 1, 5);
mat5 = mat4 .* mat;

% Part e
% Round each element of mat4 to the nearest integer
round(mat4);
% Part f
% Select the third element in mat4
ele3 = mat4(:,3);

%% Problem 2

% Define x and y
x = 3;
y = 15;
% Express the equation
z = (x.*y + y./x - sin(y^2))./(x + y)^(y - x) + log(12^(x./y));

%% Problem 3

% Create matrix A and matrix B
A = [5 2 4 9; 1 7 -3 4; 6 -10 0 7; 8 5 1 -9];
B = [2 -5 8 9; 5 8 3 -7; 8 7 -9 2; 3 -4 1 6];
% A*B is matrix multiplication, which multiplies rows of A by columns of B
A*B;
% A.*B is element-by-element matrix multiplication, which multiplies the
% two values that are in the same element slot for both matricies
A.*B;

%% Problem 4

% Define matrix x
x = magic(3);
% Part a: move each row up by one
x1 = circshift(x, [-1,0]);
% Part b: move each column right by one
x2 = circshift(x, [0,1]);
% Part c: copy row 2 and add it as row 4 to x
x3 = [x; x(2,:)];
% Part d: new 4x4 matrix and add to right of x3
x4 = [x3, magic(4)];
% Part e
% Max value in each column of x4
max(x4);
% Max value in each row of x4
max(x4,[],2);
% Part f: Mean of all elements in x4
mean(mean(x4));
% Part g: Flip x4 about vertical axis
x5 = fliplr(x4);
% Part h:Flip x4 about horizontal axis
x6 = flipud(x4);

%% Problem 5

% Create a vector from 100 to 10,000 in steps of 50
tenThousand = 100:50:10000;

% Part a: find th enumber of elements in tenThousand using length
length(tenThousand);
% Part b: sine in radians of tenThousand
sin10k = sin(tenThousand);
% Part c: absolute value of the sine in radians
pos10k = abs(sin10k);
% Part d: using the 10th number in pos10k
elem10 = pos10k(:,10);
% Round the number up using ceil
ceil(elem10);
% Round the number down using floor
floor(elem10);
% Round the number to the nearest integer using round
round(elem10);

%% Problem 6

% Verify that (sin(theta))^2 + (cos(theta))^2 = 1
% Use values for theta: 0, pi/2, 3*pi/2, 2*pi

theta = [0,pi/2,3*pi/2,2*pi];
(sin(theta)).^2 + (cos(theta)).^2;

%% Problem 7
% Compute factorials using the factorial command
N = [4 8 15; 16 23 42];
factorial(N(1,1));
factorial(N(1,2));
factorial(N(1,3));
factorial(N(2,1));
factorial(N(2,2));
factorial(N(2,3));





















