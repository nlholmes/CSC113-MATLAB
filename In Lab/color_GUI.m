function [] = color_GUI()
% Creates 2 pushbuttons. When pushed the first changes the color of the
% GUI figure window to a random color, the second resets the color
% Modeled after a GUI created by Matt Fig

S.fh = figure('units','pixels',... % units may be pixels, inches, normalized...
              'position',[300 300 200 100],... % specifies location and size of GUI, in the form [ x y width height ]
              'menubar','none',... % gets rid of edit menu in figure
              'name','Color Change Button',... % name of GUI fiugure
              'numbertitle','off',... % Gets rid of "Figure #"
              'resize','off'); % gets rid of resize option
          
defaultcolor = [0.94 0.94 0.94]; % define default color
          
S.pb1 = uicontrol('style','push',... % style can be a pushbutton, radio, dropdown menu, text box
                 'unit','pix',... % units of pixels
                 'position',[20 20 80 60],... % size and position of button
                 'String','Change Color',... % button text label
                 'callback',{@pb_call},... % references callback function (what this button does when pushed)
                 'backgroundc',defaultcolor); % set starting color of button
% wrote this bit -- copy pasta   
S.pb2 = uicontrol('style','push',... % style can be a pushbutton, radio, dropdown menu, text box
                  'unit','pix',... % units of pixels
                  'position',[100 20 80 60],... % size and position of button
                  'String','Reset',... % button text label
                  'callback',{@pb_call},... % references callback function (what this button does when pushed)
                  'backgroundc',defaultcolor); % set starting color of button
end

function [] = pb_call(source,eventData) % Subfunction that runs when button is pushed 
buttonHandle = source; % Get the caller's handle
% have to hange callback func to do something different per button pushed
str = get(buttonHandle, 'String');
color = [];
if strcmp(str, 'Change Color')
    color = [rand rand rand]; % random color
else
    color = [0.94 0.94 0.94]; % default color
end
set(gcf, 'Color', color);
end