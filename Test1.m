clear all;
close all;
clc;

A = [1 0;0 2;3 2];
I = [1 0 0 ; 0 1 0; 0 0 1];
AI = [A,I];
c = [3 5 0 0 0];
csmall = [3 5];
b = [4;12;18];
basis = input('Enter a basis: ');
for test = 1:3
    cb(test)=c(basis(test));
end
for test1 = 1:3
    B(:,test1) = AI(:,basis(test1));
end
Bin=inv(B);
wcbBin = cb*Bin;
cbBinA_c = cb*Bin*A-csmall;
cbBinb = cb*Bin*b;
BinA = Bin*A;
Binb = Bin*b;
tab = [cbBinA_c,cbBin,cbBinb;BinA,Bin,Binb];



