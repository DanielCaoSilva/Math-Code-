function distance = distance2points(x1,y1,x2,y2)
%distance2points calculates the distance between the two points 
%(x1,y1)&(x2,y2)

%Daniel Silva
%10/18/16
%Define variables
%x1,y1 -- coordinates of the first point 
%x2,y2 -- coordinates of the second point
%distance -- distance between two points 

%calculate distance 
distance = sqrt((x2-x1)^2 + (y2-y1)^2);

