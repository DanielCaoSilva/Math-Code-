%filename: System_of_Equation.m
%Daniel Silva
%9/25/16
%Purpose:The program evaluates a function
%f(x)={(2x^2)-1   for x<1
%     { x+4       for x>=1 
%Define Variables:
%x=input value for x 
%f=the f(x) value for the system of equations 

clc;
clear all; 
close all;

%Ask the user for the weight of the package in pounds(lbs.)
x = input ('Enter any real value for x=');

%Solve the system of equations
if x<1
    f=2*x^2-1;
    fprintf('f(x)= %d\n', f); 
else
    f=x+4;
    fprintf('f(x)= %d\n',f);
end