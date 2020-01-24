% File name: quadratic_equation.m 
% Daniel Silva 
% September 22, 2016
% Purpose: The program calculates the roots of quadratic equation 
% regardless of the value of discriminant
% Define Variables 
% a - coeifficient of x2 
% b - coeifficient of x 
% c - constant 
% discriminant - discriminant of the equation 
% real_part - real part of complex root 
% imag_part - imaginary part of complex root
clc; 
close all; 
clear all;
%ask the user to input the coeifficient of the equation disp('This program solves for the roots of quadratic equation'); disp('of the form AX^2 + BX + C = 0.');
a = input ('Enter the coefficient A: '); 
b = input ('Enter the coefficient B: '); 
c = input ('Enter the constant C: ');
%calculate the discriminant 
discriminant = b^2 - 4*a*c;
%solve for the roots 
if discriminant > 0     
    x1 = (-b + sqrt(discriminant))/(2*a);     
    x2 = (-b - sqrt(discriminant))/(2*a);       
    fprintf('x1 = %f\n', x1);     
    fprintf('x2 = %f\n', x2);
elseif discriminant == 0     
    x1 = (-b)/(2*a);         
    fprintf('x1 = x2 = %f\n', x1);     
else     real_part = (-b)/(2*a);     
    imag_part = sqrt(abs(discriminant))/(2*a);         
    fprintf('x1 = %f + i %f\n', real_part, imag_part);     
    fprintf('x2 = %f - i %f\n', real_part, imag_part); 
end
   