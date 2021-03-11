%% Header
% Nathan Holmes
% 9/29/2017
% Section 208
% Homework 4

%% Problem 1
minput = input('Enter a minimum value for the range: '); % minimum of range
maxput = input('Enter a maximum value for the range: '); % maximum of range

arando = randi([minput,maxput],1,1) % generates a single number within the input range

guesswho = input('Enter an integer guess: '); % gets the guess input from the user
count = 1; % initializes the guess count
while guesswho ~= arando
    if guesswho > arando & guesswho <= maxput
        guesswho = input('Too high. Enter another guess: ');
    elseif guesswho < arando & guesswho >= minput
        guesswho = input('Too low. Enter another guess: ');
    else
        fprintf('Invalid input. Value must be within the range %d to %d\n', minput,maxput);
        guesswho = input('Enter a guess within the range: ');
    end
    count = count+1
end

disp('You guessed correctly!');
fprintf('It took %d tries to guess the number.\n', count);

%% Problem 2
for line = 0:4
    number = 9 - 2*line; % defines what number to print
   for section = 1:2 % repeat the following twice
        for star = 0:line % prints number of * equal to the current line
            fprintf('*');
        end
        for rep = 4-line:-1:0 % first line prints it 5 times, then the next lines decrease by one until prints only once
            fprintf('%d',number);
        end
    fprintf('='); % print after each section
   end
   fprintf('\n'); % next line after gone through two sections
end

%% Problem 3
moneys = 3267.50;
percentaroo = 1.05;
now = 2017;

for cycle = 0:3
    now = now + 5; % change the year to display
    for year = 1:5 % incease value five times
        moneys = moneys*percentaroo; % update value of tuition
    end
    fprintf('In %d, tuition will be $%.2f.\n',now,moneys);
end

%% Problem 4
x = linspace(0,5,100);
figure(1);
for graph = 1:6
    y = sin(graph*x); % plot sin(loop variable*x)
    subplot(2,3,graph); % graph it on the subplot = to loop variable
    plot(x,y);
    title(['sin ',num2str(graph),' x']); % name the graph 
end

%% Problem 5
fibonotme = input('How many values in the Fibonacci sequence would you like to display? ');
fvar1 = 0; % initialized variable for first number
fvar2 = 1; % initialized variable for second number
fibtwo = [fvar1, fvar2]; % first two numbers in the sequence

if fibonotme == 1 % if only chose one number to display
    disp('0');
elseif fibonotme == 2 % if chose only two
    fprintf('%d %d \n', fibtwo);
elseif fibonotme > 2 % if more than two 
    fprintf('%d ', fibtwo); % print the first two in the sequence
    for k = 3:fibonotme % repeat as many times as the user chose excluding the first two
       fibgen = fvar1 + fvar2; % fibonacci function for k>2
       fvar1 = fvar2; % update initialized variable
       fvar2 = fibgen; % update initialized variable
       fprintf('%d ', fibgen); % print the Fibonacci number
    end
fprintf('\n'); % next line
end




