function [ ] = radio_sounds_GUI(sounds)
% Radio buttons are used to play sounds according to the button selected by
% the user.
%
% INPUTS: sounds - a structure array with the
%    sound files to be played by the function.
S.sounds = sounds;

% 'S' is a STRUCTURE ARRAY which contains the data that the GUI uses to
% pass handles and other information between the main function and the
% callbacks.

% Figure properties
S.fh = figure('units','pixels',...
    'position',[300 300 250 200],...
    'menubar','none',...
    'name','SOUNDS!',...
    'numbertitle','off',...
    'resize','off');
% Button group
S.bg = uibuttongroup('units','pix',...
    'pos',[20 100 210 90]);
% Radio Button 1
S.rd(1) = uicontrol(S.bg,...
    'style','rad',...
    'unit','pix',...
    'position',[20 50 70 30],...
    'string','Chirp');
% Radio Button 2
S.rd(2) = uicontrol(S.bg,...
    'style','rad',...
    'unit','pix',...
    'position',[20 10 70 30],...
    'string','Gong');
% Radio Button 3
S.rd(3) = uicontrol(S.bg,...
    'style','rad',...
    'unit','pix',...
    'position',[120 50 70 30],...
    'string','Laughter');
% Radio Button 4
S.rd(4) = uicontrol(S.bg,...
    'style','rad',...
    'unit','pix',...
    'position',[120 10 70 30],...
    'string','Train');
% Button with callback 'pb_call' and the added input, 'S', a structure
% array with handles and other GUI information.
S.pb = uicontrol('style','push',...
    'unit','pix',...
    'position',[75 20 100 30],...
    'string','Pick Sound',...
    'callback',{@pb_call,S});


end

function [] = pb_call(source,eventData,S)
% Callback for pushbutton.

% Instead of switch, we could use num2str on:
% get(S.bg,'selectedobject')==S.rd      (or similar) to determine which
% radio button was selected when the button was pressed

buttonSelected = S.bg.SelectedObject;
editBox = S.ed;

switch buttonSelected
    % Sets the editbox string based on the button that was selected. Could
    % be changed to do lots of things.
    case S.rd(1)
        editBox.String = '1';
        sound(sounds.chirpy, Fs);
    case S.rd(2)
        editBox.String = '2';
        sound(gongy, Fs);
    case S.rd(3)
        editBox.String = '3';
        sound(laughtery, Fs);
    case S.rd(4)
        editBox.String = '4';
        sound(trainy, Fs);
    otherwise
        set(S.ed,'string','None!') % Not very likely
end

end