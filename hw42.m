%filename:hw42.m
%Daniel Silva
%October 16,2016
%Purpose: The purpose of this program is to multiply two different matrices
%and load the answer into another matrix and display it. 

clear all;
close all;
clc;

%load the matrices


matrixA=[1.0000000e+00   8.0000000e+00   1.0000000e+00   8.0000000e+00;
         
         1.0000000e+01   8.0000000e+00   4.0000000e+00   4.0000000e+00;
   
         0.0000000e+00   9.0000000e+00   3.0000000e+00   9.0000000e+00;
   
         2.0000000e+00   9.0000000e+00   3.0000000e+00   6.0000000e+00;
   
         1.0000000e+00   5.0000000e+00   1.0000000e+00   1.0000000e+00];

matrixB=[2.0000000e+00   5.0000000e+00;
   
         9.0000000e+00   1.0000000e+01;
   
         2.0000000e+00   1.0000000e+00;
   
         8.0000000e+00   4.0000000e+00];

%check the rows and colums needed to make sure that you can multiply the
%matrices
[m,n]=size(matrixA);
[h,p]=size(matrixB);

%create an empty matrix full of zeros
c=zeros(m,p);
for ii=1:m
    for ij=1:p
        for jk=1:n %loop the multiplication and addition of each row and colum need in matrix algebra
            c(ii,ij)=c(ii,ij)+(matrixA(ii,jk)*matrixB(jk,ij));
        end
    end
end
disp('The product of matrix A and B is: ');
disp(c);





