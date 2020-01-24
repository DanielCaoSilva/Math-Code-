%filename: hw43.m
%Daniel Silva
%October 16, 2016
%Purpose: The purpose of this program is to 
clear all;
close all;
clc;

%The input of the student scores
student_scores=[   5.2000000e+01
   9.2000000e+01
   9.7000000e+01
   8.4000000e+01
   8.8000000e+01
   8.7000000e+01
   7.0000000e+01
   8.3000000e+01
   5.9000000e+01
   8.5000000e+01
   5.2000000e+01
   6.4000000e+01
   5.2000000e+01
   5.5000000e+01
   9.1000000e+01
   8.5000000e+01
   6.6000000e+01
   9.8000000e+01
   5.2000000e+01];

%finds how many students there are
number_of_students=length(student_scores);
A=0;
B=0;
C=0;
D=0;
F=0;

fourpointo=zeros(1,number_of_students);
threepointo=zeros(1,number_of_students);
twopointo=zeros(1,number_of_students);
onepointo=zeros(1,number_of_students);
zeropointo=zeros(1,number_of_students);
for ii=1:number_of_students
    n=ii;
    if student_scores(n)>=90
        fourpointo(n)=fourpointo(n)+student_scores(n);
        A=A+1;
    elseif student_scores(n)>=80&&student_scores(n)<90
        threepointo(n)=threepointo(n)+student_scores(n);
        B=B+1;
    elseif student_scores(n)>=70&&student_scores(n)<80
        twopointo(n)=twopointo(n)+student_scores(n);
        C=C+1;
    elseif student_scores(n)>=60&&student_scores(n)<70
        onepointo(n)=onepointo(n)+student_scores(n);
        D=D+1;
    elseif student_scores(n)<=50
        zeropointo(n)=zeropointo(n)+student_scores(n);
        F=F+1;
    end
end

fprintf('Total number of students: %d\n',n);
disp('Score         Letter Grade         Grade Point       Number of Students');
fprintf('>=90               A                   4.0                  %d\n',A);
fprintf('80-<90             B                   3.0                  %d\n',B);
fprintf('70-<80             C                   2.0                  %d\n',C);
fprintf('60-<70             D                   1.0                  %d\n',D);
fprintf('<60                F                   0.0                  %d\n',F);







