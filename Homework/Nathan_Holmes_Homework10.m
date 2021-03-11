% Nathan Holmes
% 12/01/2017
% Section 208
% Homework 10

%% Problem 1: Interpolation
p1 = [17.196, 19.513, 21.826, 24.136, 26.446, 28.755,... 
    31.063, 33.371,35.680,37.988,40.296,42.603,44.911]; % 0.01 MPa
p2 = [3.419, 3.8897, 4.3562, 5.8206, 5.284, 5.7469,...
    6.2094, 6.6717, 7.134, 7.5957, 8.0576, 8.5195, 8.9812]; % 0.05 Mpa
temp = 100:50:700; % degrees in celcius

% interp1(x,y,xi);
a = interp1(temp,p1,615); % 0.01 MPa specific volume at 615 degrees
b = interp1(temp,p2,615); % 0.05 MPa specific volume at 615 degrees
newPressure = interp1([0.1,0.5],[a,b],0.3);

%% Problem 2: Max volume of a box with a square base
% max material is 10 m^2
%SA = 2*(w*w) + 4*(h*w); % top and bot plus four sides
%vol = w*w*h; % volume, l = w

syms w h
SA = 10 == 2*w^2 +4*h*w;
hval = solve(SA,h);
vol = w^2*hval;
diffVol = 0 == diff(vol);
% derivative of vol set equal to zero and solved
ans2w = solve(diffVol,w);
w = subs(ans2w);
h = subs(hval); % redifine h as new value just found
maxVol = subs(vol); % max volume calc

printVol = maxVol(maxVol > 0); % only positive value
printW = w(w > 0); 
printH = h(h > 0);

% printing
fprintf('Maximum Volume: %.3f\n', printVol);
fprintf('Length: %.3f\n',printW);
fprintf('Width: %.3f\n',printW);
fprintf('Height: %.3f\n',printH);

%% Problem 3: Position/velocity/acceleration plots
syms v t
v = t^3 + 10*t^2 + 2*t + 3;
pos = int(v);
accel = diff(v);

t = 0:10;
figure(1);
subplot(3,1,1); % first subplot of 3
plot(t,eval(pos)); % plots position
title('Position');

subplot(3,1,2);
plot(t,eval(v)); % plots velocity
title('Velocity');

subplot(3,1,3);
plot(t,eval(accel)); % plots acceleration
title('Acceleration');

%% Problem 4: Solving systems of equations

%%%%%%%%%%%%%%%% Part a %%%%%%%%%%%%%%%%

aA = [-2,1;1,1]; % coeffs
aB = [3;10]; % constants

% answers for part a
ansa = aA\aB; % answer in vector form for part a

ax = ansa(1); % x
ay = ansa(2); % y

%%%%%%%%%%%%%%%% Part b %%%%%%%%%%%%%%%%

bA = [5,3,-1; 3,2,1; 4,-1,3];
bB = [10;4;2];

% answers for part b 
ansb = bA\bB; % answer in vector form for part b

bx = ansb(1); % x
by = ansb(2); % y
bz = ansb(3); % z

%%%%%%%%%%%%%%%% Part c %%%%%%%%%%%%%%%%

cA = [3,1,1,1; 1,-3,7,2; 2,2,-5,4; 1,1,1,1];
cB = [24;12;17;0];

% answers for part c
ansc = cA\cB; % answer in vector form for part c

cx = ansc(1); % x
cy = ansc(2); % y
cz = ansc(2); % z
cw = ansc(4); % w







