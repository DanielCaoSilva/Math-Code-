clear all;
close all;
clc;

syms x y
f = 2*(x^4)+(y^2)-4*x*y+5*y;
h=hessian(f,[x,y]);
j=transpose(jacobian(f,[x,y]));
b=inv(h)*j;
for i=1:11
    suby(:,1)=zeros(2,1);
    hess=subs(h,x,suby(1,i));
    xsub=subs(j,x,suby(1,i));
    jac=subs(xsub,y,suby(2,i));
    fhf=inv(hess)*jac;
    suby(:,i+1)=suby(:,i)-fhf;
    fprintf('x_%d = \n',i-1);
    disp(suby(:,i));
end