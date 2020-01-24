%Progress Report #1 Code:
% File Name: final_project
% Yessica Nelson
% November 21, 2016
 
% clear all previous variables

 
% Import UN data 
% Year = xlsread('UNdatapopconnectedwasteh2o','b2:b685');
% Percentages = xlsread('UNdatapopconnectedwasteh2o','c2:c685');
% %scatter(Year,Percentages)
% %pie(Percentages)
% %axis auto
 
%A= imread('competingwateruse.png');
%image(A)
 
% Water Use Per day Data from 2002
country=xlsread('Average_Water_Use_Per_Person_Per_Day','a2:a30');
litres=xlsread('Average_Water_Use_Per_Person_Per_Day','c2:c30');
%[num txt raw] = xlsread('Average_Water_Use_Per_Person_Per_Day');
 
 
bar(country,litres)
Labels = {'US', 'Australia', 'Italy', 'Japan','Mexico','Spain','Norway','France','Austria','Denmark','Germany','Brazil','Peru','Phillippines','UK','India','China','Bangladesh','Kenya','Ghana','Nigeria','Burkina Faso','Niger','Angola','Cambodia','Ethiopia','Haiti','Rwanda','Uganda','Mozambique'};
set(gca, 'XTick', 2:30, 'XTickLabel', Labels);
axis auto
ylabel Liters
title 'Average Water Use per Person per Day';
xlim=get(gca,'xlim');
hold on
plot(xlim,[30 30])