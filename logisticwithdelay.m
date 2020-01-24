clear all;
close all;
clc;


%Daniel Silva
%tiledlayout(2,2);
r=[2,2,2];
K=[100,100,100];
ho = [.1,.5,.7];
tau=[0.1,10,4]; % try larger values of tau to see oscillations
xhist=[50,50,50]; %constant history before time 0; x(0)=50 as well;
T=[100,100,100]; % solve out to time 

rhs1=@(t,x,xlag) r(1)*x*(1-x/K(1))-ho(1)*xlag; % x is x(t); xlag is x(t-tau)
sol=dde23(rhs1,tau(1),xhist(1),[0,T(1)]); % dde23 is the delay diff eqns solver

rhs2=@(t2,x2,xlag2) r(2)*x2*(1-x2/K(2))-ho(2)*xlag2; % x is x(t); xlag is x(t-tau)
sol2=dde23(rhs2,tau(2),xhist(2),[0,T(2)]); % dde23 is the delay diff eqns solver

rhs3=@(t3,x3,xlag3) r(3)*x3*(1-x3/K(3))-ho(3)*xlag3; % x is x(t); xlag is x(t-tau)
sol3=dde23(rhs3,tau(3),xhist(3),[0,T(3)]); % dde23 is the delay diff eqns solver

xinit = .5;
a = [1.5,3.1,3.5,3.559,3.6,3.7];
leng = 50;
x4 = zeros(1,leng);
xb = zeros(1,leng);
xc = zeros(1,leng);
xd = zeros(1,leng);
xe1 = zeros(1,leng);
xe2 = zeros(1,leng);
n = zeros(1,leng+1);
x4(1) = xinit;
xb(1) = xinit;
xc(1) = xinit;
xd(1) = xinit;
xe1(1) = xinit;
xe2(1) = xinit;
for i = 1:leng
    x4(i+1)=a(1)*x4(i)*(1-x4(i));
    xb(i+1)=a(2)*xb(i)*(1-xb(i));
    xc(i+1)=a(3)*xc(i)*(1-xc(i));
    xd(i+1)=a(4)*xd(i)*(1-xd(i));
    xe1(i+1)=a(5)*xe1(i)*(1-xe1(i));
    xe2(i+1)=a(6)*xe2(i)*(1-xe2(i));
    n(i) = i;
end

figure;
subplot(2,2,1);
plot(sol.x,sol.y,'r-','LineWidth',2) % sol.x and sol.y are row vectors for time t and x(t) respectively
xlabel('Time','FontSize',15)
ylabel('X','FontSize',15)
title('r=2,k=100,ho=.1,tau=0.1,xhist=50,T=100');

subplot(2,2,2);
plot(sol2.x,sol2.y,'r-','LineWidth',2) % sol.x and sol.y are row vectors for time t and x(t) respectively
xlabel('Time','FontSize',15)
ylabel('X','FontSize',15)
title('r=2,k=100,ho=0.5,tau=10,xhist=50,T=100');

subplot(2,2,3);
plot(sol3.x,sol3.y,'r-','LineWidth',2) % sol.x and sol.y are row vectors for time t and x(t) respectively
xlabel('Time','FontSize',15)
ylabel('X','FontSize',15)
title('r=2,k=100,ho=.7,tau=4,xhist=50,T=100');


figure;
subplot(2,2,1);
plot(n,x4,'k','LineWidth',2);
xlabel('N','FontSize',15)
ylabel('Xn','FontSize',15)
title('a= 1.5');

subplot(2,2,2);
plot(n,xb,'k','LineWidth',2);
xlabel('N','FontSize',15)
ylabel('Xn','FontSize',15)
title('a= 3.1');

subplot(2,2,3);
plot(n,xc,'k','LineWidth',2);
xlabel('N','FontSize',15)
ylabel('Xn','FontSize',15)
title('a= 3.5');

subplot(2,2,4);
plot(n,xd,'k','LineWidth',2);
xlabel('N','FontSize',15)
ylabel('Xn','FontSize',15)
title('a= 3.559');

figure;
subplot(2,1,1);
plot(n,xe1,'k','LineWidth',2);
xlabel('N','FontSize',15)
ylabel('Xn','FontSize',15)
title('a= 3.6');

subplot(2,1,2);
plot(n,xe2,'k','LineWidth',2);
xlabel('N','FontSize',15)
ylabel('Xn','FontSize',15)
title('a= 3.7');


