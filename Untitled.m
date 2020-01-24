% File name: mean_standarddev_example 
% Arineh Arzoumanian 
% October 4, 2016
% Purpose: Calculate the mean and standard deviation of user input data for 
% postivie or zero numbers.
% Define Variables 
% x         -- input value 
% x_bar     -- mean 
% std_dev   -- standard deviation 
% sum_x 
% sum_x2 
% n         -- number of input data
clc; close all; clear all;
% Initialize sums
n = 0; 
sum_x = 0; 
sum_x2 = 0;
% read the input 
times=input('Enter how many values you need calcualted: ');
x = input('Enter the first value: ');

% while loop to read the x values 
for y=1:times-1;
     
%record the sums     
n = n + 1;     
sum_x = sum_x + x;     
sum_x2 = sum_x2 + x^2;        
%ask the user for the next value     
x = input('Enter the next value: ');     

end
x_bar = sum_x /times; 
std_dev = sqrt ((sum_x2/n - x_bar^2));
fprintf ('The mean is: %4.2f\n',x_bar); 
fprintf ('The standard deviation is: %4.2f\n',std_dev); 
fprintf ('The number of values is: %d\n',times);




