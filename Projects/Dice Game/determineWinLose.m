% Nathan Holmes, 200168263
% October 9th, 2017
% Lab section 208
% Project 2: Dice Game (function), Fall 2017
function win = determineWinLose(playerGuess, sum_rolls)
% Determines if the player has won based off of their guess and the sum of
% the dice rolls
%   Inputs:     playerGuess is an integer (from the menu) either
%                    1 (under 7), 2 (exactly 7), or 3 (over 7)
%               sum_rolls is an integer sum of the dice
%   Return: win is a logical TRUE or FALSE
    switch playerGuess % option chosen determines win or lose
        case 1 % under 7
            if sum_rolls < 7
                win = true;
            else
                win = false;
            end
        case 2 % exactly 7
            if sum_rolls == 7
                win = true;
            else
                win = false;
            end
        case 3 % over 7
            if sum_rolls > 7
                win = true;
            else
                win = false;
            end
        otherwise
            disp('Something went wrong.\n');
    end
end

