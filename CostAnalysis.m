%filename:Cost_Analysis.m
%Daniel Silva
%9/25/16
%Purpose:The program calculates the cost of mailing a package based on
%weight. 
%Define Variables:
%w=weight of package in pounds(lbs)
%c=cost of mailing the package in dollars($)

clc;
clear all; 
close all;

%Ask the user for the weight of the package in pounds(lbs.)
w = input ('Enter the weight of the package in pounds:');
e = 15; %express delivery serive(same as the exess weight surcharge

%Calculate the cost of mailing the package
if w<=0
    disp('Invalid weight. Please run the program again and enter a vaild weight');
elseif w<=2
    disp('The cost of mailing the package is $15');
elseif w<=70
    c=(ceil(w-2)*5)+e;
    fprintf('The cost of mailing the package is %0.2f dollars\n', c); 
elseif w<=100
    c=(ceil(w-2)*5)+(2*e);
    fprintf('The cost of mailing the package is %0.2f dollars\n', c);
else 
    disp('No package over 100 lbs will be accepted.');
end

    
    
    










