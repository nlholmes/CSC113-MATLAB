%% Header
% Nathan Holmes, 200168263
% October 9th, 2017
% Lab section 208
% Project 2: Dice Game, Fall 2017



%% Welcome message and name input
fprintf('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n');
fprintf('WELCOME TO THE OVER 7 UNDER 7 DICE GAME!\n');
fprintf('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n');
name = input('Enter your name: ', 's');
fprintf('Good luck %s!\n\n',name);


% initializing
bankpts = 10;   % intitialize bank points
fprintf('Bank points: %d\n',bankpts); % display the bank points
fprintf('Begin playing...\n');
fprintf('--------------------------------------------------------------------------------\n');


play = 1; % initialize play
rollAgain = 1; % initializes continue/quit rolling variable
bet = input('Points to bet on the next roll: '); % get the first bet

%% Game loop
while play == 1

        % while the bet is invalid
        while bet <= 0 || bet > bankpts
            if bet > bankpts % get another bet
                disp('You can''t bet more points than you have in your bank!');
                bet = input('Points to bet on the next roll: ');
            elseif bet < 0 % get another bet
                disp('You can''t bet negative points!');
                bet = input('Points to bet on the next roll: ');
            elseif bet == 0 % get another bet
                disp('You must bet some points!');
                bet = input('Points to bet on the next roll: ');
            else % just run the game
            end
        end

        
        % while the bet is valid and the user wishes to continue rolling
        while bet > 0 && bet <= bankpts && rollAgain == 1
            %% Roll dice, guess menu, calculate points
            [rolls, rollSum] = diceRollSum(2); % function, roll 2 six sided dice and sum them, output both rolls in a vec
            % extract the first and second roll from vector 'rolls'
            oneroll = rolls(:,1);
            tworoll = rolls(:,2);
            
            % Guessing
            guess = menu('What is your guess?', 'Under 7', 'Exactly 7', 'Over 7'); % menu prompting guess
            exactly7 = guess == 2; % defines the logical variable if the user chose exactly 7 as the menu option
            win = determineWinLose(guess, rollSum); % determines if the user guessed correctly

            % Points
            points = calcPoints(bet,win,exactly7); % function to calculate points dependent on guess
            bankpts = bankpts + points; % updates the bank points accordingly

            %% Printing
            % Printing -- Choice of the user
            switch guess % prints the choice of the user
                case 1
                    fprintf('You picked UNDER 7.\n');
                case 2
                    fprintf('You picked EXACTLY 7.\n');
                case 3
                    fprintf('You picked OVER 7.\n');
            end
            fprintf('You rolled a %d and a %d, which totals to %d.\n',oneroll,tworoll,rollSum); % prints the rolls
            
            % Printing -- Point gain or loss
            if win == 0 % (incorrect guess, gain negative points)
                    fprintf('Sorry! You lost %d points.\n', points*-1); % multiply points by negative one for display
                    fprintf('You now have %d bank points.\n',bankpts);
            else % if win == 1 (correct guess, gain positive points)
                    fprintf('Good bet! You gained %d points!\n',points);
                    fprintf('You now have %d bank points.\n',bankpts);
            end

           
            %% Roll again? 
            %   Decides if need to prompt user to roll again (dependent on game win/lose conditions) 
            %   Then gathers the required input to roll again
            if bankpts >= 30 % win condition, no need to roll again
                rollAgain = 0; % stops the game from continuing
                fprintf('You won!\n\n');
            elseif bankpts <= 0 % lose condition, can not roll again
                rollAgain = 0; % stops the game
                fprintf('You lose!\n\n');
            else 
                rollError = 1; % variable to decide if a valid input is still required
                while rollError == 1
                    rollAgain = input('To continue rolling, enter 1, to quit, enter 0: '); % if 0, no more rolling
                    if rollAgain == 0
                        fprintf('Good game, %s! You still had some bank points left.\n',name);
                        rollError = 0; % valid input recieved, do not prompt for input again
                    elseif rollAgain == 1 % if the user chooses to continue
                        bet = input('Points to bet on the next roll: ');
                        rollError = 0; % valid input recieved, do not prompt for input again
                    else % if wrong input
                        fprintf('Input must be either a 1 for yes or a 0 for no.\n');
                        rollError = 1; % invalid input, rerun loop to prompt for input
                    end
                end
            end
            
        end

%% if the user would like to play again
playError = 1; % valid input determinant variable
while playError == 1
yesno = input('Would you like to play again?(y/n): ','s');
    if yesno == "y" 
        bankpts = 10; % reinitialize the bank points
        rollAgain = 1; % reinitialize the continuance variable
        fprintf('Good luck %s!\n\n',name);
        fprintf('Bank points: %d\n',bankpts);
        fprintf('Begin playing...\n');
        fprintf('--------------------------------------------------------------------------------\n');
        bet = input('Points to bet on the next roll: '); % get the next bet from the user
        playError = 0; % do not run this loop again, valid input was recieved
        play = 1; % play again
    elseif yesno == "n" % end game
        playError = 0; % do not run this loop again, valid input was recieved
        play = 0; % do not play again
        fprintf('Goodbye %s!\n',name);
    else
        fprintf('Invalid input.\n');
        playError = 1; % invalid input, run this loop again (prompt user again)
    end
end
end
