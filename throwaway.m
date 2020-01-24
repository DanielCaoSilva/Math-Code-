%File Name: hw21.m 
%Daniel Silva
%September 13, 2016
%Purpose: Program that generates the piee charts for:
%Global Greenhouse Gas Emissions by Gas and Global Greenhouse Gas Emissions
%by Econmonic Sector 
%Define Variables: 
% x - Greenhouse gas emissions by gas 
% y - Greenhouse gas emissions by economic sector
clear all; 
close all; 
clc;

figure
x = [.2 .6 1.6 1.1 6.5];
labelsx={'F-gases 2%','Nitrous Oxide 6%','Methane 16%','Carbon Dioxide 11%','Carbon Dioxide 65%'};
px=pie(x,labelsx,{'F-gases 2%','Nitrous Oxide 6%','Methane 16%','Carbon Dioxide 11%','Carbon Dioxide 65%'},'Font',20);
title('Global Greenhouse Gas Emissions by Gas');

figure
y = [2.5 2.4 0.6 1.4 2.1 1];
labelsy={'Other Energy 10%','Industry 21%','Transportation 14%','Buildings 6%','Agriculture,Forestry and Other Land Use 24%','Electricity and Heat Production 25%'};
py=pie(y,labelsy);
title('Global Greenhouse Gas Emissions by Economic Sector'); 
colormap summer; 
