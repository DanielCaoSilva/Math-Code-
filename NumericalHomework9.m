%Daniel Silva
%Numerical Analysis - Homework 9 
clear all;
close all;
clc;
format long;

A = [2,1,0,0,0,0;
    1,3,1,0,0,0;
    0,1,4,1,0,0;
    0,0,1,5,1,0;
    0,0,0,1,6,1;
    0,0,0,0,1,7];

%Problem 3
%Consider the matrix A, determine the dominant eigenvalue of A
[v,d]=eig(A);
qo = ones(6,1)/norm(ones(6,1));
[eig,q,muk] = normVerPowerMethod(A,qo,100);
fprintf("The dominant eigenvalue: %d\n",muk(100));

%Problem 4 
%Use the deflation method using Householder matrices to obtain H so that
% (HAH)*e1 = lamda1*e1
%Give w and H 



function [eig,q,muk] = normVerPowerMethod(A,qo,it)
    q(:,1) = qo;
    qH(:,1) = A*qo;
    eig = zeros(1,it);
    for k = 1:it
       qH(:,k) = A*q(:,k);
       eig(k)= q(:,k)'*A*q(:,k);
       muk(k)=norm(qH(:,k));
       q(:,k+1)=qH(:,k)/muk(k);
    end
end




