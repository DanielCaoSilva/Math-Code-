clear all;
close all;
clc;

%f = @(t,Y) [Y(2); sqrt(2*cos(Y(1)))];
f = @(t,Y) [Y(2); -sin(Y(1))];
%f = @(t,Y) [sqrt(2*cos(Y(1))); Y(2)];

y1 = linspace(-8,20,20);
y2 = linspace(-8,8,20);


[x,y] = meshgrid(y1,y2);
size(x)
size(y)

u = zeros(size(x));
v = zeros(size(x));

t = 0;
for i = 1:numel(x)
    Yprime = f(t,[x(i); y(i)]);
    u(i) = Yprime(1);
    v(i) = Yprime(2);
end

quiver(x,y,u,v,'r'); figure(gcf)
xlabel('y_1')
ylabel('y_2')
axis tight equal;


hold on
for y20 = [-1.5 -1 -0.5 0 0.5 1 1.5 2 2.5 pi]
    [ts,ys] = ode45(f,[0,5],[0;y20]);
    plot(ys(:,1),ys(:,2))
    plot(ys(1,1),ys(1,2),'bo') % starting point
    plot(ys(end,1),ys(end,2),'ks') % ending point
end
hold off