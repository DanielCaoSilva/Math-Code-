clear all;
close all;
clc;

n = 300;
for i=1:n
    x=25/i*cos(i);
    y=25/i*sin(i);
    scatter(x,y)
    hold on
    axis([-2 2 -2 2])
    pause(.001)
end



% x = 0:pi/50:2*pi;
% y = sin(4*x);
% plot(x,y)
% hold on
% h = plot(x(1),y(1),'mo','MarkerFaceColor','m',...
%                    'YDataSource','Y',...
%                    'XDataSource','X');
% for t = 1:numel(x)
%     X = x(t);
%     Y = y(t);
%     refreshdata(h,'caller');
%     drawnow;
%     pause(.1);
% end



