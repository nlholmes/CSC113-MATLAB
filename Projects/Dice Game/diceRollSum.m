% Nathan Holmes, 200168263
% October 9th, 2017
% Lab section 208
% Project 2: Dice Game (function), Fall 2017
function [rolls, rollSum] = diceRollSum(numRolls)
% Rolls a number of six-sided dice determined by the user and sums them
%   Input: numRolls must be an integer and determines the number of dice to roll
%   Output:     rolls is a row vector of the dice rolls
%               rollSum is the sum of all the elements in rolls

firstRoll = randi(6); % first roll
    for i = 1:numRolls-1 % roll as many dice as the user requested minus one
        currentRoll = randi(6); % random number between 1 and 6 (six-sided die)
        loopRolls(:,i) = currentRoll; % row vector of the rolls
    end
rolls = [firstRoll, loopRolls]; % concatenates the first roll with the rest of the rolls
rollSum = sum(rolls); % adds up all the rolls
end