%% Header
% Nathan Holmes
% 9-15-2017
% Section 208
% Homework 3


%% Problem 1
    %% Part A
A = input('Please enter a postive angle: ');
test = rem(A,360); % divides A by 360 and gets the remainder so that test will always be between 0 and 360 

% four if statements --> if 'test' is within the bounds, then it is the
% respected quadrant
if (test < 90 & test >= 0)
    disp('Quadrant 1');
end
if (test >= 90 & test < 180)
    disp('Quadrant 2');
end
if (test >= 180 & test < 270)
    disp('Quadrant 3');
end
if (test >= 270 & test < 360)
    disp('Quadrant 4');
end

    %% Part B
A = input('Please enter a postive angle: ');
test = rem(A,360);

% if not first quadrant, test for second, if not second, test for third, if
% not third, then fourth
if test < 90 & test >= 0
    disp('Quadrant 1')
elseif test >= 90 & test < 180
    disp('Quadrant 2');
elseif test >= 180 & test < 270
    disp('Quadrant 3');
else
    disp('Quadrant 4');
end

    %% Part C
% gets angle input from user
A = input('Please enter a postive angle: ');
test = rem(A,360);

if test >= 0
    if test < 90 % less than 90 is quad 1
        disp('Quadrant 1');
    end
    if test < 180 & test >= 90 % between 180 and 90 is quad 2
        disp('Quadrant 2');
    end
    if test < 270 & test >= 180 % repeat process with other quads
        disp('Quadrant 3');
    end
    if test < 360 & test >= 270
         disp('Quadrant 4');
    end
end

%% Problem 2
% gets angle inputs from users, third angle is determined mathematically 
a = input('Please select a value for the first angle of the triangle: ');
b = input('The third angle will be determined from the first two.\nPlease select a value for the second angle of the triangle: ');
c = 180 - a - b;

% if all the angles are equal --> equilateral
if(a == b & b == c)
    disp('Equilateral triangle');
% if two of the angles are equal --> isosceles
elseif (a == b || b == c || a == c)
    disp('Isosceles Triangle');
% otherwise --> scalene
else
    disp('Scalene triangle');
end

%% Problem 3

weight = input('Package weight (must be between 0 and 50 pounds): ');
choice = menu('Select a shipping method','Ground','Air','Overnight');

% switch statement changes price values based off the selected choice from the menu
switch choice
    case 1
        base = 1.5;
        base2 = 5.5;
        inc1 = .5;
        inc2 = .3;
    case 2
        base = 3;
        base2 = 10.2;
        inc1 = .9;
        inc2 = .6;
    case 3
        base = 18;
        base2 = 66;
        inc1 = 6;
        inc2 = 4;
end

% takes the assigned values from the switch statements and applies them to print the total price of the shipment
if weight >= 0 & weight <= 2
            price = base;
            fprintf('The total price is $%.2f\n',price);
        elseif weight > 2 & weight <= 10
            price = base + inc1.*(round(weight-2));
            fprintf('The total price is $%.2f\n',price);
        elseif weight > 10 & weight <= 50
            price = base2 + inc2.*(round(weight-10));
            fprintf('The total price is $%.2f\n',price);
        else
            disp('Error: package weight must be between 0 and 50 pounds.');
        end

%% Problem 4
% a row vector of the dimensions
dim = [13.23 15.01 12.36 16.11 17.22 11.69 14.76 15.55 17.54 16.77 11.99];

% adds up all elements in the row vector that are within the tolerance of 25.4 mm
numparts = sum(dim <= 17.54 & dim >= 13.46);

%% Problem 5

% creates a menu of the months
month = menu('Select a month','January','February','March','April','May','June','July','August','September','October','November','December');

% changes the season displayed based on the number of the season
switch month
    case {3,4,5}
        disp('Spring');
    case {6,7,8}
        disp('Summer');
    case {9,10,11}
        disp('Fall');
    case {12,1,2}
        disp('Winter');
end








