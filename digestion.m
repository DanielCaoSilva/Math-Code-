close all;
clear all;
clc;
%Daniel Silva 
%Gastric and Blood Model
tau = 30;
t0 = 7*60;  %Breakfast 
t1 = 12*60; %Lunch
t2 = 19*60; %Dinner
a = 1200/(sqrt(2*pi)*tau);
input = @(t) a*(exp(-1/(2*tau^2)*(mod(t,24*60)-t1)^2)...
    +exp(-1/(2*tau^2)*(mod(t,24*60)-t2)^2)...
    +exp(-1/(2*tau^2)*(mod(t,24*60)-t0)^2));
T_digest = 80;
T_metabolic = 240;
k1 = 1/T_digest;
k2 = 1/T_metabolic;
A = [-k1 0; k1 -k2];
rhs = @(t,ut) A*ut + [input(t); 0];
u0 = [500;600];
T = 7*1440;
[time,u] = ode45(rhs,[0,T],u0);
%Create Vertical Line for Days - Days Examples: 1440, 2880, 4220 ... 
mi = zeros(1,7);
labs = strings(1,7);
for i = 1:7
    mi(i) = i*1440;
    labs(i)=strcat('Day ',num2str(i));
end
%gastric is u(:,1);
plot(time,u(:,1),'k-','LineWidth',3)
hold on
%blood is u(:,2);
plot(time,u(:,2),'k--','LineWidth',3)
mostBlood=maxk(u(:,2),7);
mostBlood(1);
minGas=mink(u(:,1),7);
minBlood=mink(u(:,2),10);
minBlood(1);
minGas(1);
ind = 0;
ind1 = 0;
ind2 = 0;
%disp(minGas);
%disp(mostBlood);
%disp(minBlood);

%Finds the index at which the min values occured 
for i=1:813
    if (mostBlood(1) == u(i,2))
        ind = i;
    end
    if (minBlood(1) == u(i,2))
        ind2 = i;
    end
    if (minGas(1) == u(i,1))
        ind1 = i;
    end
    
end
%Corresponds the index to the time
highestBloodTime=time(ind);
lowestGasTime = time(ind1);
lowestBloodTime = time(ind2);

%Added visuals for the max and min values with vertical and horizontal
%lines 
vline(highestBloodTime,'g');
%vline(lowestGasTime,'b','LowestGastric');
vline(lowestBloodTime,'b','LowestBlood');
hline(minBlood(1),'b');
hline(mostBlood(1),'g','HighestBlood');
%hline(minGas(1),'b','LowestGastric');

%Prints out the Max and Min Values of Blood Energy in min of a day(eg
%0-1440 only)
fprintf('Highest Blood Time: %d\n',mod(highestBloodTime,24*60)/60);
fprintf('Lowest Blood Time: %d',mod(lowestBloodTime,24*60)/60);
vline(mi,'r',{'Day 1','Day 2','Day 3','Day 4','Day 5','Day 6','Day 7'})
%vline(mi,{'g','g','g','g','g','g','g'},labs)
hold off
%line(days(2),5)
%hold off
legend('Gastric x(t)','Blood y(t)','Location','NorthEast')%,'Orientation','Horizontal')
legend('BoxOff')
xlabel('time [min]','FontSize',20)
ylabel('energy [kcal]]','FontSize',20)
set(gca,'FontSize',20)
title('Gastric Channel, x(t), and Blood, y(t), Energy Content over 1 week');