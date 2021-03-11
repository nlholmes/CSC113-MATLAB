% Nathan Holmes
% 11/17/2017
% Section 208
% Homework 9

%% Problem 1: Noise
% change tint for each pixel randomly - loop thru
n = 80; % arbitrary n value
% random number negative or positive equal range
%noise = randi([-n,n],[1,3]); % random numbers 1x3 vec from -n to n
% change tint -- need for each pixel randomly i(a,b,1/2/3)


im = imread('photo1.jpg');

% for loop setup
imNew = im(:,:,:); % preallocate imNew
[r,c] = size(im);
noise = randi([-n,n],[r,c]); % random numbers -n to n in matrix equal to size of im
randi([0,1],[r,c]); % random numbers of 0 and 1 to change the color of
    % maybe use this to logically index instead
for i = 1:r
    for j = 1:c
        imNew(i,j) = im(i,j) + noise(i,j);
       %imNew(i,j,1) = im(i,j) + noise(i,j);
       %imNew(i,j,2) = im(i,j) + noise(i,j);
       %imNew(i,j,3) = im(i,j) + noise(i,j);
    end
end

figure(1);
subplot(1,2,1);
imshow(im);

subplot(1,2,2)
imshow(imNew);

%% Problem 2: Magic Images
for p = 1:12
    colormap('colorcube'); %change colormap
    figure(2); % second figure
    subplot(3,4,p); % subplot position p out of a 3x4
    imMagic = magic(p+1); % pic is magic of p+1
    image(imMagic); % display image
    pos = sprintf('magic(%d)',p+1); % save name for title
    title(pos); % change title
end

%% Problem 3: Static Animation
figure(3);
bwmap = [0 0 0; 1 1 1]; % black white
colormap(bwmap); % makes bw colormap
anIm = zeros(50); % preallocate anIm
%image(anIm); % display all black image
for t = 1:200 % 200 iterations
    imDex = randi([0,1],50,50); % random ones and zeros for indexing
    anIm(imDex == 1) = 2; % where imDex == 1, make anIm white
    anIm(imDex == 0) = 1; % where imDex == 0, make anIm black; w/o this w/preallocate fade into white
    image(anIm); % display image
    pause(1/30); % set speed of animation
end

%% Problem 4: Colors GUI
radio_colors_GUI();

%% Problem 5: Sound Menus

sChoice = menu('Select a sound to play','Gong','Chirp','Train','Laughter');
if sChoice ~= 0 % if the user chose something; if close window, sChoice = 0
    switch sChoice
        case 1 % gong
            thisSound = 'Gong';
            load gong;
        case 2 % chirp
            thisSound = 'Chirp';
            load chirp;
        case 3 % train
            thisSound = 'Train';
            load train;
        case 4 % laugthter
            thisSound = 'Laughter';
            load laughter;
    end
    first = sprintf('Select a number of times to play %s',thisSound);
    times = menu(first,'1','2');
    a = []; % preallocate length variable
    for u = 1:times % for as many times as the user selected
        a = [a;y]; % changes length of sound to play; vercat b/c how sound works
    end
    sound(a,Fs); % load command default saves y and Fs
end % do nothing otherwise










