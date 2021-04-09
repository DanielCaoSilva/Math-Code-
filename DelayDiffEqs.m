%Daniel Silva 
%Modeling  1 HW 3

%func = @(y,t) 3y(t-2);
clear all;
close all;
clc;

lags = 2;
tf = 3;

sol = dde23(@ddefun,lags, @yhist,[0 tf]);

t = linspace(0,tf,100);
y = deval(sol,t);

figure;
plot(t,y);
title('Computed DDE23 Plot');
    xlabel('time');
    ylabel('y');
axis([0 3 0 15]);
grid on;


figure;
syms x1;
%y1 = piecewise(x1<=0,1,(0<=x1)&(x1<=2),3*x1+1,(2<=x1)&(x1<=3),(9*(x1^2)/2)-15*x1+19);
y1 = piecewise(x1<=0,1,0<=x1<=2,3*x1+1,2<=x1<=3,(9*(x1^2)/2)-15*x1+19);
fplot(y1,[0,3]);
title('Exact Piecewise Plot');
    xlabel('time');
    ylabel('y');
axis([0 3 0 15]);
grid on;

exact = double(subs(y1,x1,t));
err = abs(exact - y);
figure;
plot(t,err);
title('Error Plot');
    xlabel('time');
    ylabel('error');

function yp = ddefun(t,y,L)
    yp = 3*L;
end   
function y = yhist(t)
    y = 1;
end