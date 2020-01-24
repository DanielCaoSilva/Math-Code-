%File Name: Graph_bar_example 
%Arineh Arzoumanian 
%September 13, 2016
%Purpose: Generate a bar graph
%Define Variables: 
% x - defines the bin 
% y - y values of bar graph
clear all; 
close all; 
clc;
x = 1990:1:2014;
y = [5115.1	773.9	406.2;
5064.9	777	396.1;
5170.3	776.9	404.1;
5284.8	764.1	420.5;
5377.5	770.5	402.5;
5441.6	767.9	420.6;
5630.1	762.2	428.9;
5705	747.2	412.3;
5744.7	737.8	433.9;
5819	723.5	401.1;
5992.4	717.5	401.4;
5894.5	712.7	399.3;
5935.7	706.3	400.9;
5982.3	708.6	401.8;
6097	704.9	428.6;
6122.7	717.4	397.6;
6042.4	719.6	410.1;
6121.7	726	419;
5923.2	738.9	396.8;
5488.3	735.4	399.5;
5688.8	722.4	410.3;
5559.5	717.4	416.5;
5349.2	714.4	409.3;
5502.6	721.5	403.4;
5556	730.8	403.5];




bar(x,y,'grouped'); 
axis([1985 2015 250 6122.7],'normal');
legend('CO2','CH4','N2O','location','southwestoutside'); 
colormap summer 
xlabel('Years'); 
ylabel('Gas/Source');
ax.XGrid = 'on';      % draw gridlines perpendicular to x-axis
ax.YGrid = 'on';      % draw gridlines perpendicular to y-axis
ax.FontSize=3;