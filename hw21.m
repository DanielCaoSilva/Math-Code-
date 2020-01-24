%File Name: hw21.m 
%Daniel Silva
%September 13, 2016
%Purpose: A program that creates two pie charts for:
%Global Greenhouse Gas Emissions by Gas and Global Greenhouse Gas Emissions
%by Econmonic Sector 
%Define Variables: 
% x - Greenhouse gas emissions by gas 
% y - Greenhouse gas emissions by economic sector

clear all; 
close all; 
clc;
%Pie Chart for the Global Greenhouse Gas Emissions by Gas
figure
x = [.2 .6 1.6 1.1 6.5];
labelsx={'F-gases 2%','Nitrous Oxide 6%','Methane 16%','Carbon Dioxide 11%','Carbon Dioxide 65%'};
px=pie(x,labelsx);
%Front Size of the Labels
t1=px(2);
t1.FontSize=7;
t2=px(4);
t2.FontSize=7;
t3=px(6);
t3.FontSize=7;
t4=px(8);
t4.FontSize=7;
t5=px(10);
t5.FontSize=7;
title('Global Greenhouse Gas Emissions by Gas');


%Global Greenhouse Gas Emissions by Economic Sector
figure
y = [2.5 2.4 0.6 1.4 2.1 1];
labelsy={'Other Energy 10%','Industry 21%','Transportation 14%','Buildings 6%','Agriculture,Forestry and Other Land Use 24%','Electricity and Heat Production 25%'};
py=pie(y,labelsy);
%Font Size of the Labels
r1=py(2);
r1.FontSize=7;
r2=py(4);
r2.FontSize=7;
r3=py(6);
r3.FontSize=7;
r4=py(8);
r4.FontSize=7;
r5=py(10);
r5.FontSize=7;
r6=py(12);
r6.FontSize=7;
title('Global Greenhouse Gas Emissions by Economic Sector'); 
colormap summer; 
