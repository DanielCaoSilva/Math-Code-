clc; 
close all;
clear all;

%initalize the sums
n=0;
sum_x=0;
sum_x2=0;

x=input('enter the first value');

while x>=0
    n=n+1;
    sum_x=sum_x+x;
    sum_x2=sum_x2+x^2;
    x=input('enter the next value');
    
end
x_bar=sum_x/n;
