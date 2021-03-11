%% Header
% Nathan Holmes
% Date: September 11, 2017
% Lab Section 208
% Project 1: Engine Control Unit Analysis
% Description: analyze and visualize a data file of a high performance vehicle input by the user
clc ; clear ; close('all');
%% MATLAB Project 1 -- Engine Control Analysis
% Get the input .csv file from the user
    % If the file is readable, load it
    % Else, display error message
file = input('Please input the name of the data file to analyze: ', 's');
ExistFile = exist(file); % If the file has an extention ExistFile will = 2 and run the program
if ExistFile == 2
    format long
    test = csvread(file, 2, 0);
else
    disp('The file entered does not exist or cannot be accessed. Please make sure that the file is a .csv file and has the correct path.');
end
%% Analyze the data and print to the command window

% ---Analyis--- %
% Max RPM (col 2) and time it occurred
[maxRPM,RPMInd] = max(test(:,2));
tRPM = test(RPMInd);

% Max coolant temperature (col 4) and time it occurred
[maxtemp,tempInd] = max(test(:,4));
ttemp = test(tempInd);

% Duration of entire test IN MINUTES (col 1)
    % Will need to get the last value in col 1 and divide by 60
time = test(end,1)./60;

% Average battery voltage (col 5)
avbat = mean(test(:,5));

% Min oil pressure (col 6) and time it occurred
[minoil,oilInd] = min(test(:,6));
toil = test(oilInd);

% Average coolant temperature (col 4)
avtemp = mean(test(:,4));

% ---Printing--- %
% Max RPM (maxRPM) and time it occurred (tRPM)
fprintf('The maximum RPM was %.4f, and it occurred at %.2f seconds.\n',maxRPM,tRPM)

% Max coolant temperature (maxtemp)and time it occurred (ttemp)
fprintf('The maximum coolant temperature was %.4f degrees Fahrenheit, and it occurred at %.2f seconds.\n',maxtemp,ttemp)

% Duration of entire test (time)
fprintf('The duration for the test was %.2f minutes.\n',time)

% Average battery voltage (avbat)
fprintf('The average battery voltage was %.4f volts.\n',avbat)

% Min oil pressure (minoil) and time it occurred (toil)
fprintf('The minimum oil pressure was %.4f psi, and it occurred at %.2f seconds.\n',minoil,toil)

% Average coolant temperature
fprintf('The average coolant temperature was %.4f degrees Fahrenheit.\n',avtemp)

%% Calculations
% Raw Pedal Position (col 8)
rpp = round(1024*(test(:,8)./100));

% Coolant Temperature in degrees Celsius (col 4)
ctemp = (test(:,4) - 32).*(5/9);

%% Plotting
% Need grid on, x and y labels, and titles for all
% Need the axis to be constrained by the minimum and maximum values of the respected variables
% Figure 1: RPM vs. time AND rpp vs. time on the same graph with two y-axes
plottime = test(:,1); % the time column [will put on right y-axis]
plotRPM = test(:,2); % the RPM column [will put on left y-axis]
% rpp already defined above in calculations


% ---Part A--- %
figure(1);
    yyaxis left; % going to put RPM on the left y-axis
    plot(plottime,plotRPM); % using standard lines as stated in instructions
    xlabel('Time in seconds');
    ylabel('RPM');
    title('RPM and Raw Pedal Position vs. Time')
    xlim([min(plottime),max(plottime)]); % constraining values to min and maxes of given data
    ylim([min(plotRPM),max(plotRPM)]); % same
    grid on;

    yyaxis right; % for rpp
    plot(plottime,rpp);
    ylabel('PPS Raw');
    ylim([min(rpp),max(rpp)]); % contrain values to min and max again

    
% ---Part B--- %
figure(2);
    % 4 subplots, each with a red line representing the mean of the data set
    avctemp = mean(ctemp);      % subplot 1, green; temperature in degrees celcius vs. time
    oil = test(:,6);            % defines the oil pressrue column
    avoil = mean(test(:,6));    % subplot 2, magenta; oil pressure (col 6) vs. time
    bat = test(:,5);            % defines the battery voltage column
    % avbat = already defined   % subplot 3, cyan; battery pressure(voltage?) vs. time
    fuel = test(:,7);           % defines the fuel pressure column
    avfuel = mean(test(:,7));   % subplot 4, black; fuel pressure vs. time

    % Subplot 1: coolant temperature[degrees CELSIUS] vs. time; green
        subplot(2,2,1);
        plot(plottime,ctemp, 'g');
        ctempline = refline([0,avctemp]);       % creates a reference line 'ctempline' with a slope of 0 and y-intercept avctemp
        ctempline.Color = 'r';                  % changes the color of the line to red
        xlim([min(plottime), max(plottime)]);   % constrains x values to the time column
        ylim([min(ctemp),max(ctemp)]);        
        grid on;
        title('Coolant Temperature vs. Time');
        xlabel('Time (sec)');
        ylabel('Coolant Temperature (^oC)');
        
    % Subplot 2: oil pressure vs. time; magenta
        subplot(2,2,2);                         % same thing as subplot 1 but with oil pressure
        plot(plottime,oil, 'm');                
        oilline = refline([0,avoil]);
        oilline.Color = 'r';
        xlim([min(plottime), max(plottime)]);
        ylim([min(oil), max(oil)]);
        grid on;
        title('Oil Pressure vs. Time');
        xlabel('Time (sec)');
        ylabel('Oil Pressure (psi)');

    % Subplot 3: battery voltage vs. time; cyan
        subplot(2,2,3);
        plot(plottime, bat, 'c');
        batline = refline([0,avbat]);
        batline.Color = 'r';
        xlim([min(plottime), max(plottime)]);
        ylim([min(bat), max(bat)]);
        grid on;
        title('Battery Voltage vs. Time');
        xlabel('Time (sec)');
        ylabel('Battery Voltage (volts)');

    % Subplot 4: fuel pressure vs. time; black
        subplot(2,2,4);
        plot(plottime,fuel, 'k');
        fuelline = refline([0,avfuel]);
        fuelline.Color = 'r';
        xlim([min(plottime), max(plottime)]);
        ylim([min(fuel), max(fuel)]);
        grid on;
        title('Fuel Pressure vs. Time');
        xlabel('Time (sec)');
        ylabel('Fuel Pressure (psi)');

        
% ---Part C--- %
    % red bar graph that counts the number of data points within the following ranges of Pedal Position Percentage (ppp)
        % Idle --- ppp <= 5
        % Full --- ppp >= 95
        % InBetween --- ppp > 5 & ppp < 95 
figure(3);
    ppp = test(:,8);        % defines the pedal position percentage column and the stages of throttle
    idle = ppp <= 5;
    full = ppp >= 95;
    inbetween = ppp > 5 & ppp < 95;
    
    throttle = [sum(idle),sum(inbetween),sum(full)];         % creates vector 'throttle' that counts the number in each stage 
    
    bar(throttle, 'r');                                      % red bar graph with columns of throttle
    set(gca,'XTickLabel',{'Idle','InBetween','Full'});       % labels the columns in the bar graph
    grid on;
    ylim([0,max(throttle)]);                                 % y range from 0 to the maximum value in throttle
    ylabel('Number of Data Points');

