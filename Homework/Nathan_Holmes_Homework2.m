%% Header
% Nathan Holmes
% 9-8-2017
% Section 208
% Homework 2
%% Problem 1

%Part A: Trajectories of two objects
v = 100; %initial velocity in meters per second
t = [0:15]'; %column representing duration of 15 seconds
g = 9.81; %acceleration due to gravity
theta = [30,45]; %a vector representing the angles in degrees of initial velocity for each of the projectiles
horizv = t.*v.*cosd(theta); %distance traveled in x direction
vertv = t.*v.*sind(theta) - 1./2.*g.*t.^2; %distance traveled in y direction

%Part B: Plot
plot(horizv,vertv); %plot horizv on the x-axis and vertv on the y-axis
legend('30 Degree Angle', '45 Degree Angle'); %graph legend
xlabel('Horizontal Distance'); %x-axis title
ylabel('Vertical Distance'); %y-axis title

%Part C: Maximum Height
maxh = max(vertv); %maximum height of each trajectory
fprintf('The maximum height of the 30 degree trajectory is %.4f. \nThe maximum height of the 45 degree trajectory is %.4f.\n',maxh(:,1),maxh(:,2));

%% Problem 2
%Multiplication table

num = input('Enter number to view multiplication table:'); %number for multiplication table chosen by user
a = [1:13]; %row vector for range of multiplication table
b(1:13) = num; %row vector of the user-chosen number
c = a*num; %values of multiplying
pile = [a;b;c] %matrix used in fprintf so that inputs are read correctly
fprintf('%.f times %.f is %.f\n',pile); %print of multiplication table on separate lines

%% Problem 3

% Part A: Hurricane Plot
hurr = xlsread('ACE.xlsx');
plot(hurr(:,1),hurr(:,4), '-or')
hold on;
plot(hurr(:,1),hurr(:,5), ':ob')
title('Hurricane Activity');
xlabel('Year');
ylabel('Number of Hurricanes');
legend('Hurricanes Cat 1-5','Major Hurricanes Cat 3-5');

%Part B: Highest Numbers
[ace,iace] = max(hurr(:,2)) %finding number and index for max values in each column
[ntrops,introps] = max(hurr(:,3));
[nhurrs,inhurrs] = max(hurr(:,4));
[nmajhurrs,inmajhurrs] = max(hurr(:,5)) 
maxvals = [ace, ntrops, nhurrs, nmajhurrs]; %max values
ivals = [iace,introps,inhurrs,inmajhurrs]; %index values for maxs
years = hurr(ivals); %gets year from index
name =  ["ACE", "number of tropical storms", "number of hurricanes", "number of major hurricanes"]

out = [name;maxvals;years]; %data arranged for use in fprintf
fprintf('Largest %s, %.f, occured in the year %.f.\n',out); %Prints like: "Largest number of (name), (maxvals), occured in the year (years)"





%% Problem 4

figure(1); 

x = linspace(-pi,pi,40); %x range
subplot(3,1,1); %figure 1 has 3 rows and 1 column, put this plot on position 1
plot(x,sin(x),'dr'); %red diamonds
xlim([-4,4]); %x range
ylim([-1,1]); %y range
title('sin(x)');

subplot(3,1,2); %position 2
plot(x,cos(x),'*g') %green stars
xlim([-4,4]);
ylim([-1,1]);
title('cos(x)');

subplot(3,1,3); %position 3
plot(x,tan(x),'ob'); %blue circles
xlim([-4,4]);
ylim([-50,50]); %changed y range for tan
title('tan(x)');


figure(2) %second set of plots

subplot(1,3,1); %one row, three columns, position one
plot(x,x,'xc'); %plotting x^1; cyan x marks
title('x^1');

subplot(1,3,2); %position 2
plot(x,x.^2,'+m'); %plotting x^2; magenta crosses
title('x^2');

subplot(1,3,3); %position 3
plot(x,x.^3,'sy'); %plottting x^3; yellow squares
title('x^3');

%% Problem 5
% Plotting with two y-axes
cw = importdata('cold_work.dat');
cold = cw(:,1); %first column of cw is x axis
yield = cw(:,2); %second column is y1 axis
duct = cw(:,3); %third column is y2 axis

figure(3); %establish third figure
yyaxis left; %for first y axis
plot(cold,yield); %first plot x and y1
xlabel('Percent Cold Work');
ylabel('Yield Strength, MPa');

yyaxis right; %for second y axis
plot(cold,duct); %then plot x and y2
ylabel('Ductility, %');

%% Problem 6
% Input playing card

cardnum = input('Select a card number:'); %get numeric input from user
suit = input('Select a card suit:', 's'); %get string input from user

fprintf('Using fprintf:\nYou selected the %.f of %s.\n',cardnum,suit); %using fprintf "You selected the cardnum of suit"
disp(['You selected the ',num2str(cardnum),' of ',suit,'.']); %using disp "You selected the cardnum of suit"










