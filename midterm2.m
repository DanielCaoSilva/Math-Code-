%filename: midterm2.m
%Daniel Silva
%10/20/16
%Purpose: Determine whether a user's input is non zero at a function n and
%its y value.

clear all;
clc;
close all;

%Variables 
x=input('Enter an x value: ');

%The function where x is non zero
fnNflr=floor(x);
fnNcil=ceil(x);

%The y value at that function 
flrY=1-abs(x-fnNflr);
cilY=1-abs(x-fnNcil);

if (rem(x,1)==0)
    fprintf('Value of x: %f\n',x);
    fprintf('Function %d is non-zero at x with value %f\n',fnNflr,flrY);
else
    fprintf('Value of x: %f\n',x);
    fprintf('Function %d is non-zero at x with value %f\n',fnNflr,flrY);
    fprintf('Function %d is non-zero at x with value %f\n',fnNcil,cilY);
end

