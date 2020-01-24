%filename:chem.raw.data.spectphotgraphy
%Daniel Silva
%Purpose: To show the absorbance vs wavelength both the Red and Yellow dye


close all;
clear all;
clc;

%Read the excel file 
[v,T,vT]=xlsread('chemspectlabrawdata.xlsx');

%Set variables linked to the excel file 
wavelength=v(:,1);
yellowabs=v(:,2);
redabs=v(:,3);

%Plot the Red and Yellow dyes 
p=plot(wavelength,yellowabs,'y',wavelength,redabs,'r');




%Modify the graphs 
p(1).LineWidth=3;
p(2).LineWidth=3;
p(1).Marker='o';
p(2).Marker='o';
p(1).MarkerEdgeColor='k';
p(2).MarkerEdgeColor='k';
P(1).MarkerSize=2;

%Legend
legend('Yellow Dye','Red Dye');





