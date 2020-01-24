function [data]=finddata(countryask,raw,col,datcol)

    %user enter country as a string
    %countryask=input('Enter the country name:','s');
    %looks for that string in the raw data set and gives it a 1
    p=strcmpi(countryask,raw(:,col));
    %finds which row the match is at
    rowNum=find(p==1);
    %prints the statistic where the row was found after converting cell2mat
    data=cell2mat(raw(rowNum,datcol)); 
   
