% Nathan Holmes
% nlholmes@ncsu.edu
% 11/13/2017
% Lab Section 208
% Project 3: Baby Names, Fall 2017 (or perhaps it is indeed, Dice Game?)
%% Welcoming
fprintf('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n');
fprintf('Welcome to the baby name trends project.\n');
fprintf('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n\n');


choice = menu('Select one:','Popular names by birth year','Popularity of names over time');
switch choice % do something different dependent on the selection of the user
    case 1 % popular names by birth year
        %% Popular names by birth year
        %% ERROR CHECKING
        yearError = 1; % preallocate error checking variables
        numError = 1;
        while yearError == 1
            year = input('Enter the year [1880 to 2016]: ');
            if rem(year,1) == 0 && year >= 1880 && year <= 2016 % if in range and integer
                yearError = 0; % proceed out of the loop
            else
                fprintf('Incorrect input, try again.\n');
                yearError = 1; % repeat the loop
            end
        end
        while numError == 1
            num = input('Popularity: ');
            if rem(num,1) == 0 && num >= 1 && num <= 100 && num > 0 % if in range and positive integer
                numError = 0; % proceed out of the loop
            else
                fprintf('Incorrect input, try again.\n');
                numError = 1; % repeat the loop
            end
        end
        %% FUNCTION
        topNames = detTopNames(year,num);
        
        %% PRINTING
        a = {1:num}; % cell array from 1 to top
        cTop = num2cell(a{1}(1:end)'); % index into cell 'a' and get all numbers, then transpose
        printNames = [cTop,topNames]'; % concatenate with topNames and transpose for fprintf reading
        rgbhehehe = {'Rank','Girls','Boys'};
            fprintf('%-10s\t%-10s\t\t%-10s\n',rgbhehehe{:});
            fprintf('--------------------------------------\n');
            fprintf('%-10d\t%-10s\t\t%-10s\n',printNames{:});
            
    case 2 % popularity of names over time
        %% Popularity of names over time
        nameError = 0;
        %% Quit condition
        q = 0; % establish quitting variable
        
        while q == 0 || nameError == 1
            name = input('Enter a name to plot [or enter ''q'' to quit]: ','s'); % string input
            nameError = 0; % only run through once unless the user chooses otherwise
            if lower(name) == 'q' % if it is time to quit
                q = 1; % stop the loop
            else % if it is time to go
                %% Input gathering and error checking
                genderError = 1; % establish error variable
                while genderError == 1
                    gender = input('Gender [M or F]: ','s'); % string input
                    if upper(gender) == 'M' | upper(gender) == 'F' % if not m or f input
                        genderError = 0; % stop the loop and proceed
                    else
                        fprintf('Incorrect gender input, try again.\n');
                        genderError = 1; % repeat
                    end
                end
                
                rangeError = 1; % preallocate
                while rangeError == 1
                    range = input('Enter a range of years: ');
                    % if not in range [1880 to 2016] or not an integer or first is bigger than second
                    if min(range) > 1880 | max(range) < 2016 | rem(range,1) == 0 ...
                            | range(1) < range(2)
                        rangeError = 0;
                    else
                        rangeError = 1; % repeat
                        fprintf('Incorrect range input, try again.\n');
                    end
                end
                
                %% Calculation of popularity for plotting
                rangeVec = [min(range):max(range)];
                pop = detNamePopularityInYear(rangeVec,name,gender);

                %% If the name is found or not found at all
                if isempty(pop) == 1 % if pop is an empty vector (not found at all)
                    fprintf('Name entered was NOT found!\n\n'); % then the name was not found
                    nameError = 1; % reallocate error checking variables
                else % if name was found and pop has a value
                    %% Printing highest occurrence
                    fprintf('%s was most popular in %d, with %d occurrences.\n', ... 
                        name,rangeVec(pop == max(pop)),max(pop)); 
                            % logical index for year inot rangeVec using pop
                            
                    %% Plotting
                    figure(1);
                    hold on; % keeps the graph there
                    plot(min(range):max(range),pop,'LineWidth',2);
                        % plots the data; 2 LineWidth; matlab picks color
                        % plotted min and max of range for correct xlims
                    xlabel('Year');
                    ylabel('Number of Occurrences');
                    title('Popularity of Names');
                    xlim([min(range),max(range)+4]); % sets xlim to have a little space for name labels

                    % labeling the names on the graph
                    nameLabel = sprintf(' %s (%s)', name,gender); % format of 'name (gender)' as text
                    xtext = max(range); % x position for text
                    ytext = double(pop(:,end)); % y position for text -- last element of pop
                                                % is a double for text use purposes
                    text(xtext, ytext, nameLabel);
                                            % puts nameLabel just right of the last data point in pop
                                            % y is dependent on pop, x is dependent on range
                end
            end
        end
end
% THE END
