clear all;
close all;
clc;

%figure
for ii=1:5
A=zeros(1,2*ii);
B=[surface_area_and_volume_function(ii,1),A];
fprintf('The surface area is %d and the volume is %d for a cylinder with radius %d and height 1 \n',B(1),B(2),ii);
%subplot(5,1,ii);
%plot(surface_area(ii),1)
end 
