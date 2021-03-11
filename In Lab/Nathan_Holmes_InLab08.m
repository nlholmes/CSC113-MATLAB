% Name: Nathan Holmes
% Section: 208
% Date: 11/03/2017
% In-Lab 8

clear all; close all; clc % clear functions
%% Instructor-Guided Portion
%% Problem 1 - Warped Checkers
% Copy ALL of the features of the figure and plot shown in the problem.
figClr = [.94 .90 .55]; patchClr = [.126 .70 .67];
axesClr = [.96 .96 .8627];

% Create and edit the figure window
fh = figure(1); % figure handle
set(fh,'color',figClr); % set figure color
set(fh,'name','Warped Checkers'); % set figure name
set(fh, 'menubar','none') % set menubar = 0
% can do all of this in one line or with dots
% fh.Name = 'Warped Checkers';


% Use patch() to plot x and y functions
t = linspace(0,2*pi,200);
nx = 5;
ny = 8;
x = cos(nx*t);
y = sin(ny*t);
ph = patch(x,y,patchClr); % patch handle - make it patchClr

% Fill the blank spaces by setting the axis background to the specified
% color
set(gca,'color',axesClr); % gca = 'get current axis' -- used for handle

% Add labels, title, and origin marker
xlabel('X Axis');
ylabel('Y Axis');
title(sprintf('x=cos(%d*t),y=sin(%d*t),0<\\theta<2\\pi',nx,ny)); % sprintf in case update nx and ny
hold on; % keep other plots
plot(0,0,'y*'); % plot yellow star at origin
th = text(0.05,0,'Origin'); % label origin; text handle, .05 off of point in x dir
set(th,'color','y','fontsize',48); % 48 pt size for yellow origin text

%% Problem 2 - Adding Animation to Your Resume
% Create an animation using the parametric function x = 2cos(t) + cos(2t)
%                                                   y = 2sin(t) - sin(2t)

% Initialize t:
nSteps = 500;
t = linspace(0,8*pi,nSteps);
% Calculate set of points for x:
x = 2*cos(t) + cos(2*t);
y = 2*sin(t) - sin(2*t);
% Determine limits of animation as it plots
figure(2);
axis([min(x),max(x),min(y),max(y)]);
% Create figure and plot animation:
hold on; % typically dont hold on but special commands this case

for a = 1:nSteps
    % the line primitive is also acceptable for these
    lin = plot(x(1:a),y(1:a),'k'); % black line
    point = plot(x(a),y(a),'ro'); % red circle
    
    % pause so that the animation actually shows up
    pause(1/30);
    % update UI components
    % drawnow; dont need -- use if also use set (set and drawnow or plot and pause)
    
    % delete plotted objects
    % delete(lin); dont need -- draw over each time
    delete(point);
end



%% Problem 3 - Anonymous Functions
% Create an anonymous function: have to be one line
b = @(x,y) x.^y/y.^x; % space just for reading
% Call the anonymous function using the given inputs
a1 = b(1,2);
a2 = b(4,3);
a3 = b(0.5,6);

%% Problem 4 - Surfing on Transforms
% Create and edit a 3D plot for Z(x,y) = xsin(x+y) - ycos(x+y)

% Create a new figure
fh3 = figure(3);

% Define x and y vectors for [0 2*pi]
stp = .01;
x = 0:stp:2*pi;
y = 0:stp:2*pi;

% Generate X and Y matrices for all [x y] in the region bounded by the two
% vectors.
[xmat,ymat] = meshgrid(x,y); % for 3D plotting
% Calculate Z for all [x y]
zmat = xmat.*sin(xmat+ymat) - ymat.*cos(xmat+ymat);

% Create surface using surf with x and y vectors and Z(x,y).
sh = surf(xmat,ymat,zmat); % surface plot


% Turns off edges so you can see the colors!
set(sh,'edgecolor','none'); % makes it not black

% Labels axes
xlabel('X Axis');
ylabel('Y Axis');
zlabel('Z Axis');

% Change colormap and light location
colormap('cool'); % color gradients flag;white;winter;hot;jet;bone
camlight('left'); % light angle


%% Independent Portion


