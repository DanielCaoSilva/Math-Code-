%File Name: Excersise3.7_3.1
%Daniel Silva
%September 14, 2016
%Purpose: This script will graph a funtion:
%y(x)=e^(-.5x)sin(2x)
%Define Variables: 
% x - Independent variable 
% y - dependent variable 
% y_deriv - derivative of y 
% y_deriv2 - second derivative of y
clc; 
clear all; 
close all;
% x values between 0 and 100 
x = 0:0.1:10;
% calculates y values for given x 
y=exp(-.5*x)*sin(2*x);
%graphing x vs. y plot(x,y)
%modifying the appearance of the plot
plot(x,y,'-r','LineWidth',3,'MarkerSize',8)
title('Graph for Y')
xlabel('x') 
ylabel('y') 
% allows us to graph multiple function on one figure hold on;
plot(x,y)  