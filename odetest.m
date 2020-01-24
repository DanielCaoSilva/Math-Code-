clear all;
clc;
close all;
%get the function that defines the derivative 
ode45function = @func1
%solve the equation over the priod t_span
t_span =[0 10];
%set the initial value for y
y0=1;
%call the differential equation od45
[t y] = ode45(ode45function,t_span,y0);
%plot
plot(t,y)