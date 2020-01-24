%Filename: test_distance2points 
%Daniel Silva
%10/18/16

%Purpose: Program tests the function distance2points

%Define Variables 
%ax - x coordinate of point a 
%ay - y coordinate of point a
%bx - x coordinate of point b
%by - y coordinate of point b 
clear all;clc;close all;
%Ask for input data 
ax = input('Input x value for point a:');
ay = input('Input y value for point a:');
bx = input('Input x value for point b:');
by = input('Input y value for point b:');

%Evaluate the function 
result = distance2points(ax,ay,bx,by);
[a,b,c,d]=hw53triangle(0,0,1,1,0,1);

%write out the output
fprintf('The distance is %f\n',result);

