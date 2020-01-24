%Numerical Homework #4
%Daniel Silva

clear all;
close all;
clc;

%Problem 1
A = [10,1,2,-3;
    1,20,8,-2;
    2,8,30,5;
    -3,-2,5,100];
[L,D,Lt] = GaussElimSym(A);
disp('Problem 1:')
disp('A = ');
disp(A);
disp('L = ');
disp(L);
disp('D = ');
disp(D);
disp('Lt = ');
disp(Lt);

%Problem 3 
disp('Problem 3:');
b = [100,1000,10000,100000];
disp('b = ');disp(b);
xmaybe = A\b';
bmaybe=A*xmaybe;
%if(b' == bmaybe)
%    disp(true);
%else 
%    disp(false);
%end
x = L\b';
y = D\x;
z = Lt\y;
%disp(z);
%disp(A*z);
x1=forward(L,b');
y1 =forward(D,x1);
z1=backward(Lt,y1);
disp('Solution =');
disp(z1);
%disp(A*z1);

%Problem 6
disp('Problem 6:');
Ex=[4,-1,1;
    -1,4.25,2.75;
    1,2.75,16];
disp('A = ');disp(Ex);
[check,check1]=CholeskyColWise(Ex);
disp('Rt =');disp(check);
disp('R =');disp(check1);
%disp(check*check1);





