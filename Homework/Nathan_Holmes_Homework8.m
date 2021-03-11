% Nathan Holmes
% 11/10/2017
% Section 208
% Homework 8

%% Problem 1
% inputs theta and r, both of which can be vectors
a_sector = @(theta,r) 1/2.*theta.*r.^2;

number1 = a_sector(3.3,11); % theta = 3.3, r = 11, plugs into formula
%% Problem 2
number2 = mypower(2,4); % 2^4

%% Problem 3
this = {1,2,3,4,5,6};
[sortedCell,time] = EOsort(this); % sorts into {2,4,6} and {1,3,5}
%% Problem 4
x = linspace(0,2*pi);
y = sin(x);
figure(1); % first figure
plotVarLineWidth(x,y,6,[0.5, 0.5, 0.5]); % plots a thick gray y = sin(x) from 0 to 2*pi

%% Problem 5
fh = figure(2); % second figure
set(fh,'color',[0.5 0.5 0.5]); % set figure color to grey
set(gca,'color',[0 0 0]); % set current axis color to black
hold on; % keeps black color on axes for next plot


x = linspace(0,2*pi,60); % defines domain and number of times to loop; plot 60 points
y = sin(x); % defines the function to plot
axis([min(x),max(x),min(y),max(y)]); % defines axes as mins and maxes to show animation without resizing
for i = 1:length(x)
    plot(x(i),y(i),'p'); % plot the ith point in the vectors
    pause(1/30); % waits between each plot
end
