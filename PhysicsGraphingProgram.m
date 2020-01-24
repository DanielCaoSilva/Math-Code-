%filename:PhysicsLabTester
%Daniel Silva
%Purpose: This program is meant to test a graphing function from data
%recived from the lab
%Goal: To be able to plot multiple graphs on one plot in order to have
%better comparisons. In addition to the plots, I would also like to add
%best fitting curves as well as well tabulated keys and different color
%graphs 

clc;
clear all;
close all;
 
%Enter data into the program (Directly or import from an excel file 
disp('Would you like to enter the data directly or import from an excel file?');
disp('Enter the word [excel] if you would like to import or enter [direct]'); 
answer=input('if you would like to enter data manually : ','s');

if(strcmpi(answer,'excel')==1)
    disp('here');
    %x=[1 2 3 4];
    %y=[2 3 4 5];
    plot(x,y);
    
    
elseif(strcmpi(answer,'direct')==1)
    x=input('Enter the amount of points that you will enter: ');
    xside=size(x);
    yside=size(x);
    for i=1:x
        xside(i)=input('Enter x values: ');
        yside(i)=input('Enter y values: ');
    end
    figure 
    scatter(xside,yside)
    %p=polyfit(xside,yside,(x-1));    
    plot(xside,yside)
    
    
end



    