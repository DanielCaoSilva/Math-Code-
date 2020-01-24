clear all;
close all;
clc;

bc = [100,100,100,0];%top,left,right,bottom

numRows = 10;% The size of the square matrix
n = numRows*numRows;
fours = 4*ones(1,n);
negone = -1*ones(1,n-1);
negonem = -1*ones(1,n-numRows);
zs = zeros(1,numRows-1);
dv = zeros(1,numRows-1);
one = [1];
for i=1:numRows-1
    dv = [dv one zs];
end
mainD = diag(fours);
upD = diag(negone,1)+diag(dv,1);
upupD = diag(negonem,numRows);
dwnD = diag(negone,-1)+diag(dv,-1);
dwndwnD = diag(negonem,-numRows);

mat = mainD+upD+upupD+dwnD+dwndwnD;

%For b vector
oneone = bc(1)+bc(2);
topMid = bc(1)*ones(1,numRows-2);
onec = bc(1)+bc(3);
rightSideMids = bc(2);
leftSideMids = bc(3);
mids = zeros(1,(numRows-2));
midPart = [];
if numRows > 3;
    midPart = [rightSideMids mids leftSideMids];
    for i = 1:numRows-3
        midPart = [midPart rightSideMids mids leftSideMids];
    end
end
r1 = bc(2)+bc(4);
botMid = bc(4)*ones(1,numRows-2);
rc = bc(4)+bc(3);
bVect = [oneone topMid onec midPart r1 botMid rc]';
if numRows < 3;
  bVect = [oneone topMid botMid onec r1 rc]'
end
%Needs TC, MT, TC, (LM,0...0,RM)X(r-2)...
%disp(mat);

A=[  4,-1, 0,-1, 0, 0, 0, 0, 0;
    -1, 4,-1, 0,-1, 0, 0, 0, 0;
     0,-1, 4, 0, 0,-1, 0, 0, 0;
    -1, 0, 0, 4,-1, 0,-1, 0, 0;
     0,-1, 0,-1, 4,-1, 0,-1, 0;
     0, 0,-1, 0,-1, 4, 0, 0,-1;
     0, 0, 0,-1, 0, 0, 4,-1, 0;
     0, 0, 0, 0,-1, 0,-1, 4,-1;
     0, 0, 0, 0, 0,-1, 0,-1, 4];
b=[200;100;200;100;0;100;100;0;100];
temp=inv(mat)*bVect;
%disp(bVect);
if numRows < 2
  temp = [75];
end
tempgrid=transpose(reshape(temp,[numRows,numRows]));
figure;
contour(100-tempgrid,1500)% interior of plate ("100-" for blue to be cold)
figure;
imagesc(tempgrid)% different style
axis off