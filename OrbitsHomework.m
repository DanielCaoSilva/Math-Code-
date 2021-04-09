clear all;
close all;
clc;

format short
syms m x;
%eqn = ((m^2)*x-(m^2)*(x^2))*(1-m*x+m*x^2)==x;
logistic = m*x*(1-x);

log2 = subs(logistic,logistic);
log3 = subs(log2,logistic);
log4 = subs(log3,logistic);
%log5 = subs(log4,logistic);
s = solve(log4==x,x);
disp(s);
orbits = zeros(length(s),1);
for i = 1:length(s)
    orbits(i) = double(subs(s(i),m,3.4));
end
disp(orbits);