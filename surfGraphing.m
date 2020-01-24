clear all;
close all;
clc;
[X,Y] = meshgrid(-10:0.1:10,-10:0.1:10);
%Z = sin(X) + cos(Y);
%surf(X,Y,Z)
%g = (exp(X^2)/4)+((3*exp(Y^2))/4);
%h = sqrt(log((exp(X^2)/4)+((3*exp(Y^2))/4)));
%surf(X,Y,g);
%surf(X,Y,h);
f = X^3 + exp(3*Y) - 3*X*exp(Y);
surf(X,Y,f);