function [F,C] = convertFtoC(tmin,tmax)
% Converts a range of Fahrenheit temps to Celsius temps
%   Inputs:     tmin  	--  min degrees in F
%               tmax    --  max degrees in F
%   Outputs:    F = array with F temps
%               C = array with C temps

% fahrenheit range vector
F = [tmin:1:tmax];
% celsius converted vector
C = (F - 32).*(5/9);

% table printing
fprintf('Fahrenheit         Celsius\n');
fprintf('         %.f          %.2f\n',[F;C]);

end

