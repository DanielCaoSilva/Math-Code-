%filename:hw51.m
%Daniel Silva 
%10/28/16
%Purpose: The purpose of this program is to solve the quadratic system of equations
%that satisfies all user enteted points 

clear all; 
close all; 
clc; 

%Define Variables 
mat=input('Enter your three points in the form of a 3x2 matrix: ');

%Makes sure that no x value is the same 
if (mat(1)==mat(2)==mat(3))
   disp('Error: one or more of your x values are the same. Please end program and choose again');
end

%Solving the system of equations using matrix algebra 
A=[mat(1)^2 mat(1) 1;
   mat(2)^2 mat(2) 1;
   mat(3)^2 mat(3) 1;];
C=[mat(4);
   mat(5);
   mat(6);];
B=A\C;

%plots the quadratic function that passes throught the input points 
figure 
%finds the min and max x values and stores them in a matrix
xmin=min([mat(1),mat(2),mat(3)]);
xmax=max([mat(1),mat(2),mat(3)]);
x=xmin:.25:xmax;
y=(B(1)*x.^2)+(B(2)*x)+B(3);

plot(x,y)




