clear all;
close all;
clc;

%Daniel Silva
%Numerical Analysis 5080 
%Plot the cpu time vs n when performing the product as (AB)C and A(BC)
iterBegin = 1000;
iterEnd = 5000;
t0 = zeros(1,iterEnd);
t1 = zeros(1,iterEnd);
for n = iterBegin:iterEnd
    A = rand(n);
    B = rand(n);
    C = rand(n,1);
    startAB=tic;
    x = (A*B);
    out = x*C;
    t0(n) = toc(startAB);
    startBC = tic;
    y = A*(B*C);
    t1(n) = toc(startBC);
end
%plot(t0);
%plot(t1);
axis = log(iterBegin:iterEnd);
T0 = log(t0(iterBegin:iterEnd));
T1 = log(t1(iterBegin:iterEnd));
poly0=polyfit(axis,T0,1);
poly1=polyfit(axis,T1,1);
z0=polyval(poly0,axis);
z1=polyval(poly1,axis);
%plot(iterBegin:iterEnd,yhat);
%yhat=10.^[polyval(poly,[T0(1) T0(end)])];
%loglog([t0(1) t0(end)],yhat);
%hold on;
loglog(iterBegin:iterEnd,t0(iterBegin:iterEnd),'r-','LineWidth',1)
hold on;
loglog(iterBegin:iterEnd,t1(iterBegin:iterEnd),'k--','LineWidth',1)
hold on;
loglog(iterBegin:iterEnd,exp(z0));
%text(10,10,num2str(poly0(1),'y = %.3fx'));
hold on;
loglog(iterBegin:iterEnd,exp(z1));
hold off;
legend('ABfirst','BCfirst',...
    num2str(poly0(1),'LineForAB with slope a=%.3f'),num2str(poly1(1),...
    'LineForBC with slope a=%.3f'),'Location','NorthEast')%,'Orientation','Horizontal')
legend('BoxOff')
xlabel('n','FontSize',20)
ylabel('CPU time','FontSize',20)
title('CPU time vs n');




