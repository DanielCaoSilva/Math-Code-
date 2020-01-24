clear all;
close all;
clc;


e=10;
for i= 1:e
    h(1)=1;
    g(i)=(h(i)^2)-2;
    %syms h;
    %gp(i)=diff(g,h);
    gp(i)=2*h(i);
    h(i+1)=h(i)-(g(i)/gp(i));
end
disp('Problem 1: Approximating sqrt(2) starting at 1');
for i=1:e
    fprintf('x_%d =% d\n',i,h(i));
end
figure 
x=1:11;
plot(x,h,'-o');
title('Problem 2: sqrt(2)');


for i= 1:e
    h(1)=1;
    g(i)=(h(i)^5)-2;
    %syms h;
    %gp(i)=diff(g,h);
    gp(i)=5*(h(i)^4);
    h(i+1)=h(i)-(g(i)/gp(i));
end
disp('Problem 4: 2^(1/5)');
for i=1:e
    fprintf('x_%d =% d\n',i,h(i));
end
figure 
x=1:11;
plot(x,h,'-o');
title('Problem 5: 2^(1/5)');

disp('Problem 7: a^(1/n)');
a=input('Enter a value for a:\n');
n = input('Enter a value for n:\n');
for i= 1:e
    h(1)=1;
    g(i)=(h(i)^n)-a;
    %syms h;
    %gp(i)=diff(g,h);
    gp(i)=n*(h(i)^(n-1));
    h(i+1)=h(i)-(g(i)/gp(i));
    err(i)=a^(1/n)-h(i);
end
for i=1:e
    fprintf('x_%d =% d\n',i,h(i));
end
disp('Problem 8: Errors in a^(1/n)');
disp(err);
figure 
x=1:11;
plot(x,h,'-o');
title('Problem 9: a^(1/n)');


for i= 1:e
    h(1)=2;
    g(i)=sin(h(i));
    %syms h;
    %gp(i)=diff(g,h);
    gp(i)=cos(h(i));
    h(i+1)=h(i)-(g(i)/gp(i));
end
disp('Problem 10: pi');
for i=1:e
    fprintf('x_%d =% d\n',i,h(i));
end
figure 
x=1:11;
plot(x,h,'-o');
title('Approximation of PI');







    