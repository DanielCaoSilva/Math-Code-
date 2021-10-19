clear all;
close all;
clc;

syms x1 x2 x3

A = [x1,x2,x3;x1,-4,0];
b = [4;0];

B(:,:,1) = [A(:,1),A(:,2)];
B(:,:,2) = A(:,2:3);
B(:,:,3) = [A(:,1),A(:,3)];

N(:,1) = A(:,3);
N(:,2) = A(:,1);
N(:,3) = A(:,2);



for i = 1:3
    X(:,i) = [inv(B(:,:,i))*b;0];
    D(:,i) = [-inv(B(:,:,i))*N(:,i);1];
end

disp(X)
disp(D)

syms lamda1 lamda2 lamda3 mu1 mu2 mu3

lamda = [lamda1,lamda2,lamda3]';
mu = [mu1,mu2,mu3]';

x = X*lamda+D*mu;
disp(x)
simplify(real(x));

sol1 = solve(x(1),x1)
sol2 = solve(x(2),x2)
sol3 = solve(x(3),x3)









