% Nathan Holmes, 200168263
% October 9th, 2017
% Lab section 208
% Project 2: Dice Game (function), Fall 2017
function points = calcPoints(currentBet, win, exactly7)
% Calculates the points either gained or lost during the current roll
%   Input:      currentBet: integer of the points the player has bet
%               win: logical TRUE or FALSE if the player has won the roll
%               exactly7: logical TRUE or FALSE if the player chose exactly 7
%   Output:     points: positive or negatice integer for the number of
%               points gained or lost
%                   If the player lost: lose the amount of points they bet
%                   If the player won: 1:1 point gain for either under or
%                   over 7, 4:1 point gain if exactly 7 was chosen
if win == 1
    if exactly7 == 1
        points = currentBet*4; % 4;1 gain for choosing exactly 7
    else
        points = currentBet; % 1:1 gain for guessing correctly either under or over 7
    end
else
    points = currentBet*-1; % 1:1 loss for guessing incorrectly
end

