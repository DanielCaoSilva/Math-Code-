%filename: hw41.m
%Daniel Silva
%October 16, 2016
%Purpose: Sort two arrays and display the sorted arrays in one sorted array

clear all;
close all;
clc;

%Variables
arr1 =[ 1 3 5 8 9]; 
arr2 = [2 5 7 9];

%combine both arrays
array3=[arr1,arr2];

%check conditions
if(size(array3,1)>1)
    disp('Input must be a 1xN vector');
elseif(isempty(array3))
    disp('Input should not be empty');
end

%find the length of the new array
n = length(array3);

%loop an insertion sort 
for i = 2:n
    d = i;    
    while((d > 1) && (array3(d) < array3(d-1)))%checks to see if it is in the right place
        temp = array3(d);%uses temp to store the value until it can be placed in the right place
        array3(d) = array3(d-1);%moves it over to the left
        array3(d-1) = temp;
        d = d-1;
    end
end

disp(['Sorted Array: ' num2str(array3)]);
