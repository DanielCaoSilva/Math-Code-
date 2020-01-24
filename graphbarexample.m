%File Name: Graph_bar_example 
%Arineh Arzoumanian 
%September 13, 2016
%Purpose: Generate a bar graph
%Define Variables: 
% x - defines the bin 
% y - y values of bar graph
clear all; close all; clc;
x = 1:5;
y = zeros(5,3);
y (1,:) = [1 2 3]; 
y (2,:) = [2 3 4];
y (3,:) = [3 4 5]; 
y (4,:) = [4 5 4]; 
y (5,:) = [5 4 3];
bar(x,y); 
axis([0 6 0 7])
legend('first column','second column','third column'); 
colormap summer 
xlabel('x'); 
ylabel('y');