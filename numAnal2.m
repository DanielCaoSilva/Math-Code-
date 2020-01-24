clear all;
close all;
clc;

%Daniel Silva
%Math 4170
%Homework #2

A = [17,24,1,8,15;
     23,5 ,7 ,14,16;
     4 ,6 ,13,20,22;
     10,12,19,21,3 ;
     11,18,25,2 ,18];
b = [0,1,9,6,7];
disp("Let A =");
disp(A);
disp("Let b^T =");
disp(b);
[L,U]=geee(A);
disp("Problem 4");
disp("The LU factorization");
disp("L =");
disp(L);
disp("U =");
disp(U);

S=size(L);
m=S(1);
x=zeros(1,m);

%Forward substitution
for k=2:m
        x1=1/L(k,k).*(b(k)-sum(L(k,k-1:-1:1).*x(k-1:-1:1)));
        x(1,k)=x1;
end
x = x';
%disp('x:');
%disp(x);

S=size(U);
m=S(1);

%Backward Substition 
xy=zeros(1,m);
xy(1,m)=x(end)./U(m,m);
%disp(xy);
for k=m-1:-1:1
        x2=1/U(k,k).*(x(k)-sum(U(k,k+1:end).*xy(k+1:end)));
        xy(k)=x2;
        %xy(k)=x2;
end

%disp('xy:');
%disp(xy');

y = inv(L)*b';
xfinal = inv(U)*y;
disp("Problem 5");
disp("x vector:");
disp(xy');
%disp("y vect:");
%disp(y);









