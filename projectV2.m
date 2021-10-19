clear all;
close all;
clc;

%Daniel Silva 

format long;

param = [10,2, pi/8;
          4,1,-pi/7];
syms t ta tb

for i = 1:2
    trigMat(:,:,i) = [cos(param(i,3)),sin(param(i,3));
                     -sin(param(i,3)),cos(param(i,3))];
    pMat(:,i) = [(param(i,2)-param(i,1))/2 + (param(i,2)+param(i,1))/2 *cos(t);
                    sqrt(param(i,2)*param(i,1))*sin(t)];
    orbits(:,i) = trigMat(:,:,i)*pMat(:,i);
end

[t1,t2] = meshgrid(0:.1:10);
x1t1 = double(subs(orbits(1,1),t,t1));
x2t2 = double(subs(orbits(1,2),t,t2));
y1t1 = double(subs(orbits(2,1),t,t1));
y2t2 = double(subs(orbits(2,2),t,t2));
dist = 0.5.*((x1t1-x2t2).^2 + (y1t1-y2t2).^2);
figure;
contourf(t1,t2,dist,70);

d = 0.5.*((subs(orbits(1,1),t,ta)-subs(orbits(1,2),t,tb)).^2 + (subs(orbits(2,1),t,ta)-subs(orbits(2,2),t,tb)).^2);
gd = gradient(d)

%steepestdescentold(d)




figure;
ezplot(orbits(1,1),orbits(2,1));
hold on;
ezplot(orbits(1,2),orbits(2,2));
hold off;