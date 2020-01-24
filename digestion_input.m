clear all;
close all;
clc;
%Daniel Silva
%Food Intake Rate Function
tau = 30;
t0 = 7*60;  %Breakfast 
t1 = 12*60; %Lunch
t2 = 19*60; %Dinner
a = 1200;
T = 7*1440; %Over 7 days
input = @(t) a/(sqrt(2*pi*tau^2))*(exp(-1/(2*tau^2)*(mod(t,24*60)-t1)^2)...
    +exp(-1/(2*tau^2)*(mod(t,24*60)-t2)^2)...
     +exp(-1/(2*tau^2)*(mod(t,24*60)-t0)^2));
t=linspace(0,T,10080);
u=NaN(10000,1);
for j=1:10080
  u(j)=input(t(j));
end
mi = zeros(1,7);
for i= 1:7
    mi(i) = i*1440;
end
plot(t,u,'r-','LineWidth',2)
vline(mi,'k',{'Day 1','Day 2','Day 3','Day 4','Day 5','Day 6','Day 7'})
xlabel('time [min]','FontSize',20)
ylabel('energy [kcal]','FontSize',20)
set(gca,'FontSize',20)
legend('Food Intake c(t)','Location','NorthEast')%,'Orientation','Horizontal')
%legend('BoxOff')
title('Food Intake Rate Function c(t) over 1 week');