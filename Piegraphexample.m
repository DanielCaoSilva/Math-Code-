close all; clc;
pieData = [10 20 30 40 50];     % Size of pie slices 
pieHandle = pie(pieData);       % Get vector of handles to graphics objects
pieAxis = get(pieHandle(1), 'Parent');  
pieAxisPosition = get(pieAxis, 'Position');
newRadius = 0.50;   % Change the radius of the pie chart
deltaXpos = 0.2;    % Move axis position left or right
deltaYpos = 0.2;    % Move axis position up or down
hText = text(-1.7, -1.4, 'PRESS ANY KEY TO ADJUST THE RADIUS');
pause;
delete(hText);
% Compute newPieAxisPosition
% To keep the axis centered (Xpos, Ypos) also need to be adjusted.
% Position is a four-element vector: [left bottom width height]
% Translate (left, right) by (deltaXpos, deltaYpos) and Scale (width, height) by newRadius.
newPieAxisPosition = (pieAxisPosition + [deltaXpos deltaYpos 0 0]) .* [1 1 newRadius newRadius];
set(pieAxis, 'Position', newPieAxisPosition);     % Set pieAxis to new position