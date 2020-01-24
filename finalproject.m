%File: final_project_progress_report 
%Group Members:Yessica Nelson, Daniel Silva, Travis Merrill and Jason 
%Morales

%Purpose: Our purpose is to show that providing clean water is a global 
%issue that needs to be addressed. We are supporting this by presenting data sets 
%that directly demonstrate the issue at hand. In addition to showing the
%problem, we are also listing various potential solutions to this issue.

%Clearing previous variables 
clc; 
clear all; 
close all;

% Yessica's Code 
% Purpose: Display relevant figures to illustrate sources of water deficiency

% Figure to demonstrate economic sectors that compete for water 
figure(1) 
A= imread('competingwateruse.png'); %upload figure to matlab 
image(A) 
hold on;

% Water Use Per day Data from 2002 
country=xlsread('Average_Water_Use_Per_Person_Per_Day','a2:a30'); %read data from excel file 
litres=xlsread('Average_Water_Use_Per_Person_Per_Day','c2:c30'); 
[num, txt, raw] = xlsread('Average_Water_Use_Per_Person_Per_Day.xlsx');% created to read txt from excel and use as labels 

% Use uploaded data to plot a horizontal bar graph 
figure(2) 
barh(country,litres) 
Labels=txt;% using countries in excel sheet as labels 
set(gca, 'YTick', 2:30, 'YTickLabel', Labels); 
axis auto 
xlabel Liters 
title 'Average Water Use per Person per Day';

%From UN information setting a range of what avg water usage should be 
%starting at 50L and ending at 100L 
ylim=get(gca,'ylim'); 
hold on 
plot([50 50],ylim) 
plot([100 100],ylim)

%[num1, txt1, raw1]=xlsread('freshwaterwithdrawl_agricultureuse.xlsx');
%surfyear=cell2mat(raw1(:,2));
%surffresh=cell2mat(raw1(:,3));
%surfargri=cell2mat(raw1(:,4));
%x=1:30;
%plot3(x,surffresh,surfargri)
%[X, Y, Z]=meshgrid(txt1();

figure(4)
% load excel file to matlab on the percentage of freshwater used in
% agriculture
country1=xlsread('world.data.agriculture.xlsx','a1:a30');
y2007= xlsread('world.data.agriculture.xlsx','b1:b30'); % y2007 is the data for the year 2007
y2012= xlsread('world.data.agriculture.xlsx','c1:c30'); % y2012 is the data for the year 2012
y2014= xlsread('world.data.agriculture.xlsx','d1:d30'); % y2014 is the data for the year 2014
% separating text from number values
[num1, txt1, raw1] = xlsread('world.data.agriculture.xlsx');
labels1=txt1;% seting tick labels as text
bar3(num1); % creating a 3D graph from data set of the 30 countries presented earlier
%labeling of axes
zlabel('Percent of freshwater used for Agriculture')
ylabel Countries
xlabel Years
legend({'Percent Usage 2007','Percent Usage 2012','Percent Usage 2014'},'Location','northwest') % legend to identify color/year correlation
set(gca, 'YTick', 0:29, 'YTickLabel', labels1);% renaming tick labels
set(gca, 'XTick', 1:3, 'XTickLabel', ['2007';'2012';'2014'])% renaming tick labels

% Figure on groundwater depletion
figure (5)
B= imread('grace.jpg'); %uploads image to matlab
fullscreen=get(0,'ScreenSize'); 
image (B)

%Input/output
contorno=input('Would you like to know any specific information on a country[y/n]?','s');
if (contorno=='y')
prompt='Would you like to know the exact water use per person per day for a specific country?[y/n]';
yesorno=input(prompt,'s');
while(yesorno=='y')
    %user enter country as a string
    countryask=input('Enter the country name:','s');
    %looks for that string in the raw data set and gives it a 1
    %p=strcmpi(countryask,raw(:,2));
    %finds which row the match is at
    %rowNum=find(p==1);
    %prints the statistic where the row was found after converting cell2mat
    da=finddata(countryask,raw,2,3);
    %(countryname,data set that you are looking through,col where the
    %string is and it checks all rows, col of data that you are extracting)
    fprintf('The average water user per day is %f liters\n',da);%cell2mat(raw(rowNum,3))); 
    %uses to either continue or break the loop
    again=input('Would you like to check another country[y/n]?','s');
    if (again=='n')
        break
    end
end

yesorno=input('Would you like to know which countries are above/below the recommended water useage per person per day?[y/n]','s');
if (yesorno=='y')
    Below=num(:,3)<50;
    Above=num(:,3)>100;
    correct=num(:,3)<100 & num(:,3)>50;
    rnumcorr=find(correct==1);
    rnumbelow=find(Below==1);
    rnumabove=find(Above==1);
    fprintf('The following countries are under the recommended water useage:\n');
    belowrec=txt(rnumbelow,1);
    disp(belowrec);
    fprintf('The following countries are above the recommended water useage:\n');
    aboverec=txt(rnumabove,1);
    disp(aboverec);
    fprintf('The following countries are in the correct interval of water useage:\n');
    corrrec=txt(rnumcorr,1);
    disp(corrrec);
    
end
yesorno=input('Would you likek to know the perentage of freshwater agriculture use for a specific country?[y/n]\n','s');
while(yesorno=='y')
    countryask=input('Enter the country name:','s');
    da=finddata(countryask,raw1,1,2);
    da1=finddata(countryask,raw1,1,3);
    da2=finddata(countryask,raw1,1,4);
    fprintf('For %s the percentage of freshwater agriculture use in 2007 was %f , in 2012 it was %f, and in 2014 it was %f. \n',countryask,da,da1,da2);
    again=input('Would you like to check another country[y/n]?','s');
    if (again=='n')
        break
    end
end    
    
disp('next question');

end



