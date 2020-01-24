%filename: midterm1.m
%Daniel Silva
%10/18/6
%Purpose: Programs tests whether the user inputed point is within the user
%input triangle, outside the triangle, or on the triangle.
clear all;
close all;
clc;

%Define Variables 
x=input('Enter the number of points needed to create the polygon needed: ');
A=input('Enter the points in the form of an array: ');
B=input('Enter your test point in the form of an array: ');
output=zeros(1,x);


for i=1:x %loop the number of points that the user enters 
    if (eqline1(B(1),B(2),A(1),A(2),A(5),A(6))==0)
        fprintf('Your point is on one of the lines of the polygon');
    elseif (sign(eqline1(B(1),B(2),A(1),A(2),A(5),A(6)))==sign(eqline1(A(3),A(4),A(1),A(2),A(5),A(6))))
        output(i)=1;
    elseif (sign(eqline1(B(1),B(2),A(1),A(2),A(5),A(6)))==-1*sign(eqline1(A(3),A(4),A(1),A(2),A(5),A(6))))
        output(i)=0;
    end
    tempN=[A(1),A(2)];
    tempD=A(3:2*x);
    A=[tempD,tempN];
end

if (output ==zeros(1,x))
    fprintf('Your point is outside the shape');
elseif (output == ones(1,x))
    fprintf('Your point is inside the shape');
end




