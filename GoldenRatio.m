clear all;
close all;
clc;

% f_ratio = [1 1];
% f=[1 1];
% x=1;
% while f(x) < 10000
% f(x+2)=f(x+1)+f(x);
% f_ratio(x+2) = f(x+2)/f(x+1);
% x=x+1;
% end
% plot(f_ratio);
n = 400;
for i = -400:n
    X1 = rand(1, 10);
    X2 = rand(1, 10);
    Y1 = rand(1, 10);
    Y2 = rand(1, 10);
    x=(-1)^(i)*i;
    y=(-1)^(i)*i*sin(i)*cos(i);
%     subplot(1,2,1)
    plot(x,y,'o');
    hold on;
    pause(.001)
%     subplot(1,2,2)
%     plot([X1; X2].', [Y1; Y2].')  % Two polygones
%     hold on;
%     pause(.001);
end


