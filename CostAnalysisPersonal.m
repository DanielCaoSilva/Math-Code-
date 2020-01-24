%filename:Cost_AnalysisPersonal.m
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

disp('Hello! Welcome to the FedEx Packaging Cost Calculator!');
disp('Note: Any package under 1 pound will have a $5 flat rate charge.');
disp('Any package over 1 pound is $8 for each pound or fraction thereof.');
disp('Any package over 50 pounds will have an additional $75 charge.');
disp('Any package over 100 pounds will be charged by the weight^2 and,')
disp('2/5 times its weight, in addition to prior charges.');
disp('Any package over 500 pounds will not be accepted.');


%Ask the user for the weight of the package in pounds(lbs.)
w = input ('Enter the weight of the package in pounds:');
e = 5; %express delivery serive(same as the exess weight surcharge

%Calculate the cost of mailing the package
if w<=0
    disp('Invalid weight. Please run the program again and enter a vaild weight');
elseif w<=1
    disp('The cost of mailing the package is $8');
elseif w<=50
    c=(ceil(w-1)*8)+e;
    fprintf('The cost of mailing the package is %0.2f dollars\n', c); 
elseif w<=100
    c=(ceil(w-1)*8)+(14*e);
    fprintf('The cost of mailing the package is %0.2f dollars\n', c);
elseif w<=500
    c=(ceil(w-1)*8)+(14*e)+(.4*(w^2));
    fprintf('The cost of mailing the package is %0.2f dollars\n', c);
else 
    disp('No package over 500 lbs will be accepted.');
end

    
    
    










