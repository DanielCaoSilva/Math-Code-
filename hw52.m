%filename: hw52.m
%Daniel Silva
%10/31/16
%Purpose: The purpose of this program is to read data from the truss file
%and graph the geometry of the structure


clear all; 
close all;
clc;

%The given points that are needed
p=[ -1,   -1,   0 ;
     1,   -1,   0 ;
     1,    1,   0 ;
    -1,    1,   0 ;
    -0.5, -0.5, 1 ;
     0.5, -0.5, 1 ;
     0.5,  0.5, 1 ;
    -0.5,  0.5, 1 ];
%The given connectivites 
con= [ 1     5;
       1     6;
       5     2;
       2     6;
       2     7;
       6     3;
       3     7;
       3     8;
       7     4;
       4     8;
       4     5;
       1     8;
       5     7;
       6     8;
       5     6;
       6     7;
       7     8;
       8     5];
%defines the size of the connectivites matrix
[conrow,concol]=size(con);
%empty matrices that will be used later
x=zeros(1,8);
y=zeros(1,8);
z=zeros(1,8);
tempx=zeros(conrow,2);
tempy=zeros(conrow,2);
tempz=zeros(conrow,2);
%loop that stores all the points in the respective matrices 
for xi=1:8
x(xi)=p(xi,1);
y(xi)=p(xi,2);
z(xi)=p(xi,3);
end
figure
%stores the necessary connectivity points into a temp matrix and plots them

for ii=1:conrow
    tempx(ii,1)=x(con(ii,1));
    tempx(ii,2)=x(con(ii,2));
    tempy(ii,1)=y(con(ii,1));
    tempy(ii,2)=y(con(ii,2));
    tempz(ii,1)=z(con(ii,1));
    tempz(ii,2)=z(con(ii,2));
    plot3(tempx,tempy,tempz,'k-')
end

        
