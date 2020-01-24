%filename:quiz1.m
%Daniel Silva
%10/10/16
%Purpose:Write a MATLAB program that will obtain the value of x and n from input and
%calculate y using the first n + 1 terms (0 through n powers of x) of 
%the following series: 

clear all;
close all;
clc;

%Define Variables:
%x=input
%n=input 
%y=variable we are solving for 

x=input('x value');
n=input('n value');
a=1;
y=1;

for ii=1:n;
    a=ii*a;    
    y=(((-1)^ii)*(x^ii))/((3^ii)*a)+y;
end
fprintf('The value of (x): %d\n',x);
fprintf('Number of terms (n): %d\n',n);
fprintf('The calculated value of (y): %d\n',y);




    
