% Nathan Holmes
% 9/01/2017
% Section 208
% In-Lab 2

clear all; close all; clc % clear functions
%% Instructor-Guided Portion
%% Problem 1 - Sensor Data - Summer 2015, Updated Fall 2017
% Download Sensor_data.xlsx from Moodle. 

% Import the data set using xlsread():
[num,~,~] = xlsread('Sensor_data.xlsx');
% a. Find the mean value for each sensor:
sensor = num(:,2:end);
avg = mean(sensor);

% b. Find the maximum value recorded for each sensor and the time:
[maxVal, maxInd] = max(sensor);
time = num(:,1);
timeMax = time(maxInd);
% c. Co-plot the sensor results:
figure(1);
plot(time,sensor(:,1),time,sensor(:,2),time,sensor(:,3),time,sensor(:,4),time,sensor(:,5));
grid on;
xlabel('Time(s)');
ylabel('Temperature (^oC)');
title('Sensor Data');


%% Problem 2 - Input/Output - Spring 2016
% Prompt the user for their name (a string):
n = input('Enter your name:  ','s');

% Prompt the user for an x value (in radians):
rad = input('Enter an angle (in radians): ');

% a. Compute the sine, cosine, and tangent values of the input x:
a = sin(rad);
b = cos(rad);
c = tan(rad);

% b. Use disp() and fprintf() to print results to the command window:
disp([n, 'your calculations are complete!']);
fprintf('Cosine of %.2f is %.2f\n',rad,b);
fprintf('Sine of %.2f is %.2f\n',rad,a);
fprintf('Tangent of %.2f is %.2f\n',rad,c);


%% Problem 3 - Pro Graphs - Fall 2016
% Re-create the figure shown in the problem, making sure to match all
% styles, colors, titles, labels, and legends.

% Use the following variables:
t = linspace(0, 2*pi, 200); % theta values
r = abs(sin(3*t)); % polar flower, Cartesian sine wave

figure(2);
subplot(2,2,1);
polar(t,r, 'r*');
title('Polar |sin 3\theta|');

subplot(2,2,2);
plot(t,r, 'gp');
title('Cartesian |sin 3\theta|');
xlim([0,2*pi]);

subplot(2,2,3);
plotyy(t,sin(t),t,exp(t));
xlim([0,2*pi]);
title('Plotyy: sin(t) vs. exp(t)');
legend('sin(t)' , 'exp(t)');
ylabel('sin(t)');
yyaxis right;
ylabel('exp(t)');

subplot(2,2,4);
bar([2:6;6:-1:2]);
set(gca, 'XTickLabel', {'Ascending        ','         Descending'});
ylim([0,8]);
title('Bar Graph: 2:1:6 vs. 6:-1:2');



%% Independent Portion

