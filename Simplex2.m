clear all;
close all;
clc;

csmall = input('Enter the coefficients for the Objective Function: ');
A = input('Enter the coefficients for all constraints: ');
b = input('Enter the values for the RHS: ');
I= eye(size(A,1),size(A,1));
c = [csmall,zeros(1,size(I,1))];
AI=[A,I];
iBasis = [3 4 5];

tab = getTab(iBasis,c,A,AI,b,csmall);
disp(tab);
disp(getTab(getBasis(tab,b,AI),c,A,AI,b,csmall));
% function basis = getBasis(tab)
%     
% end

