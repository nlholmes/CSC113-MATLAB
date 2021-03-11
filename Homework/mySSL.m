function mySSL
% Displays either english or metric units depending on the user's menu choice

choice = menu('Choose desired units','English','Metric');


% format of the arrays: 
    % [Pressure, Temperature, Gravity constant]
% numbers
engNums = [14.696, 518.67, 32.174]
metNums = [101.325, 288.15, 9.807]
% units
engUnits = ["psi", "R", "ft/s^2"]
metUnits = ["kPa", "K", "m/s^2"]

fprintf('Standard Sea Level (SSL) atmospheric conditions: \n');
switch choice
    case 1 % English units
        % prints all numbers and units of the English SSL
        fprintf('Pressure: %.3f %s\nTemperature: %.3f %s\nGravity Constant: %.3f %s\n',[engNums;engUnits]); 
    case 2 % Metric units
        fprintf('Pressure: %.3f %s\nTemperature: %.3f %s\nGravity Constant: %.3f %s\n',[metNums;metUnits]);
    otherwise
        fprintf('No units selected.\n');
end

end

