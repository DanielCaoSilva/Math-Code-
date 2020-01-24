%Daniel Silva
ageGroupNum=8;
timeVals = 50;
b = zeros(1,ageGroupNum);
mu = zeros(1,ageGroupNum -1);
b = [0,0.1,0.6,0.5,0.8,0.7,0.5,0.1];
mu = [0.6,0.08,0.1,0.13,0.15,0.2,0.3];
b2 = 0.3;
b3 = 0.7;
b4 = 0.2;
m1 = 0.04;
m2 = 0.08;
m3 = 0.13;
b1 = 1-((1-m1)*b2+(1-m1)*(1-m2)*b3+(1-m1)*(1-m2)*(1-m3)*b4); % generates steady state distribution
%b1 = 0.5 % put a random value here if you want to see a non-steady state situation
b(1) = 1-((1-mu(1))*b(2)+(1-mu(1))*(1-mu(2))*b(3)+(1-mu(1))*(1-mu(2))*(1-mu(3))*b(4)+(1-mu(1))*(1-mu(2))*(1-mu(3))*(1-mu(4))*b(5)...
    +(1-mu(1))*(1-mu(2))*(1-mu(3))*(1-mu(4))*(1-mu(5))*b(6)+(1-mu(1))*(1-mu(2))*(1-mu(3))*(1-mu(4))*(1-mu(5))*(1-mu(6))*b(6)...
    + (1-mu(1))*(1-mu(2))*(1-mu(3))*(1-mu(4))*(1-mu(5))*(1-mu(6))*(1-mu(7))*b(8));
%R = [b1 b2 b3 b4; 1-m1 0 0 0; 0 1-m2 0 0; 0 0 1-m3 0];
%b(1) = abs(b(1));
b(1) = .1;
rBot = [diag((1-mu)),zeros(ageGroupNum-1,1)];
R = [b;rBot];
agearray = zeros(ageGroupNum,timeVals);
agearray(:,1)=[75;0;0;0;0;0;0;0];
for j=2:timeVals
    for i=1:ageGroupNum
        agearray(i,j)=R(i,1)*agearray(1,j-1)+R(i,2)*agearray(2,j-1)...
            +R(i,3)*agearray(3,j-1)+R(i,4)*agearray(4,j-1)...
            +R(i,5)*agearray(5,j-1)+R(i,6)*agearray(6,j-1)...
            +R(i,7)*agearray(7,j-1)+R(i,8)*agearray(8,j-1);
    end
end
agearray;
disp("Problem 1a:");
disp("approx. steady state:");
disp(agearray(:,20));
disp("Average:");
for i = 1:4
    disp(agearray(i,20)/(sum(agearray(:,20))));
end

subplot(8,1,1);
plot(agearray(1,:))
axis([0 timeVals -10 100])
xlabel('Time')
ylabel('Age 0-1')

subplot(8,1,2);
plot(agearray(2,:))
axis([0 timeVals -10 100])
xlabel('Time')
ylabel('Age 1-2')

subplot(8,1,3);
plot(agearray(3,:))
axis([0 timeVals -10 100])
xlabel('Time')
ylabel('Age 2-3')

subplot(8,1,4);
plot(agearray(4,:))
axis([0 timeVals -10 100])
xlabel('Time')
ylabel('Age 3-4')

subplot(8,1,5);
plot(agearray(5,:))
axis([0 timeVals -10 100])
xlabel('Time')
ylabel('Age 4-5')

subplot(8,1,6);
plot(agearray(6,:))
axis([0 timeVals -10 100])
xlabel('Time')
ylabel('Age 5-6')

subplot(8,1,7);
plot(agearray(7,:))
axis([0 timeVals -10 100])
xlabel('Time')
ylabel('Age 6-7')

subplot(8,1,8);
plot(agearray(8,:))
axis([0 timeVals -10 100])
xlabel('Time')
ylabel('Age 7-8')
