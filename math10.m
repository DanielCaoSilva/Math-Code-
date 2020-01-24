clear all; 
close all;
clc;

%Math 10 EignenValue/Vector/Spaces

n=input('Enter the dim of the matrix that you are trying to solve: ');


for j=1:n;
    for i=1:n;
        A(i,j)=input('Enter elements in col vector form: ');
    end     
end

R=rref(A);
disp(R);
