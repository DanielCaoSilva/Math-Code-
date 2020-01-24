clear all;
close all;
clc;

%Daniel Silva
%Homework #3
%Initialize Var for #1
xfinal = zeros(2,8);
err = ones(2,8);
del = zeros(1,8);
b = zeros(2,8);
%Initialize Var for #2
xfinal2 = zeros(2,8);
err2 = ones(2,8);
b2 = zeros(2,8);
for n = 2:2:16
    %Problem 1
    del(n/2) = 10^(-n);
    b(:,n/2) = [1+del(n/2),2];
    L = [1,0;1/del(n/2),1];
    U = [del(n/2),1;0,1-(1/del(n/2))]; 
    y = L\b(:,n/2);
    xfinal(:,n/2) = U\y;
    err(:,n/2) = err(:,n/2)-xfinal(:,n/2);
    %Problem 2
    b2(:,n/2) = [2,1+del(n/2)];
    L2 = [1,0;del(n/2),1];
    U2 = [1,1;0,1-del(n/2)]; 
    y2 = L2\b2(:,n/2);
    xfinal2(:,n/2) = U2\y2;
    err2(:,n/2) = err2(:,n/2)-xfinal2(:,n/2);
end
nvals = 2:2:16;
varNames = {'n','b','xfinal','Error'};
T1 = table(nvals',b',xfinal',err','VariableNames',varNames);
T2 = table(nvals',b2',xfinal2',err2','VariableNames',varNames);
disp('Table for Problem 1:');
disp(T1);
disp('Table for Problem 2:');
disp(T2);

