%filename: Sudoku
%Daniel Silva
%April 20,2017
%Purpose: To create a playable sudoku game.

clear all;
close all;
clc;

%Initialize the board
%row1=randperm(9);
%row2=randperm(9);
%row3=randperm(9);
%row4=randperm(9);
%row5=randperm(9);
%row6=randperm(9);
%row7=randperm(9);
%row8=randperm(9);
%row9=randperm(9);
%board=[ row1;row2;row3;row4;row5;row6;row7;row8;row9];
board=zeros(9,9);

%Conditons for filling the boxes
%for i=1:9
    %board(1:9,i)=randperm(9);
    %board(i,1:9)=randperm(9);
%end
%board(1:9,1)=randperm(9);
%board(1:9,2)=randperm(9);
%board(1:9,3)=randperm(9);
%board(1:9,4)=randperm(9);
%board(1:9,5)=randperm(9);
%board(1:9,6)=randperm(9);
%board(1:9,7)=randperm(9);
%board(1:9,8)=randperm(9);
%board(1:9,9)=randperm(9);
%lia=ismember(board(,randperm(9));
A=1:9;
B=true(9); 
C=[ 1 1 1 1 1 1 1 1 1 ];
for i=1:9
    for j=1:9
        while board(i,j)==0
            if C==ismember(A,board(1:i,1:j))
                board(i,j)=randperm(9,1);
                %liat=ismember(A,board(1:i,1:j));
            end
                
        end
    end
end

lia=ismember(A,board(1:9,1));
disp(board);
        

    