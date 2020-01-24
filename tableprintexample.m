%File Name: tableprint_example 
%Arineh Arzoumanian 
%September 15, 2016
%Purpose: Calculate values of z and prints out a table of results
%Define Variables: 
%x, defined variable 
%y, defined variable 
%z, x+y 
%A, 3x10 matrix  includes x,y,z
clc; clear all; close all;
x = 0.1:0.1:1; 
y = 2:2:20;
z = x+y; 
A = [x; y; z];
fprintf('          My Table\n'); 
fprintf('----------------------------\n'); 
fprintf('  %4s   %4s    %4s\n','x','y','z'); 
fprintf('  %6.2f   %6.2f    %6.2f\n',A);