%Daniel Silva 
%Disease Model
close all;
clear all;
clc;

N = 1e6; %Entire population 
D = 10; %average duration of infection 
beta = 1; %infections rate controls the rate of spread
lam = 1/D;
sigma = 1; %incubation rate
S0 = 9e5;
I0 = 1e5;
E0 = 1e3;
R0 = beta/lam;
x0 = [S0; E0;I0; R0];
SIRendemic_rhs = @(t,Xt) [-(beta*Xt(1)*Xt(3))/N;
                        ((beta*Xt(1)*Xt(3))/N)-sigma*Xt(2);    
                        sigma*Xt(2)-lam*Xt(3);
                        lam*Xt(3)];
T = 50;
[time,X] = ode45(SIRendemic_rhs,[0,T],x0);
plot(time, X(:,1),'g.','LineWidth',3)
hold on
plot(time, X(:,2),'r--','LineWidth',3)
plot(time, X(:,3),'k-.','LineWidth',3)
plot(time, X(:,4),'b-','LineWidth',3)
xlabel('Time','FontSize',15)
ylabel('number of individuals','FontSize',15)
title('SEIR Model');
hold off
legend('S','E','I','R')





