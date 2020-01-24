close all;
clear all;
clc;

N = 1e6;
alpha = 1e-6;
beta = 1/3;
sigma = 1/50;
S0 = 9e5;
I0 = 1e5;
x0 = [S0; I0; N-S0-I0];
SIRendemic_rhs = @(t,Xt) [sigma*N-alpha*Xt(1)*Xt(2)-sigma*Xt(1); 
                        alpha*Xt(1)*Xt(2)-beta*Xt(2)-sigma*Xt(2);
                        beta*Xt(2)-sigma*Xt(3)];
T = 50;
[time,X] = ode45(SIRendemic_rhs,[0,T],x0);
plot(time, X(:,1),'k-','LineWidth',3)
hold on
plot(time, X(:,2),'r--','LineWidth',3)
plot(time, X(:,3),'k-.','LineWidth',3)
xlabel('Time[years]','FontSize',15)
ylabel('number of individuals','FontSize',15)
hold off
legend('S','I','R')

perOSusceptible=(X(end,1)/N)*100;
perOInfected=(X(end,2)/N)*100;
perORecovered=(X(end,3)/N)*100;
disp(perOSusceptible);
disp(perOInfected);
disp(perORecovered);
disp(perOSusceptible+perOInfected+perORecovered);
maxDuringEpid=max(X(:,2));
perOMaxDurEpid=(maxDuringEpid/N)*100;
disp(perOMaxDurEpid);
index = find(X(:,2)>=200000);
ydesired = time(index);
%yDesired = interp1(X(:,2),time, 200000);
hline(200000);
vline(ydesired(1));
vline(ydesired(end));
disp(ydesired(end)-ydesired(1));



