function  [triperi, triarea, circumrad, inrad] = hw53triangle(x1,y1,x2,y2,x3,y3)

a=distance2points(x1,y1,x2,y2);%calls the distance fucntion to determine the length 
b=distance2points(x2,y2,x3,y3);
c=distance2points(x3,y3,x1,y1);
triperi=a+b+c;%finds the sum of all the lengths
s=triperi/2;%defines s
triarea=sqrt(s*(s-a)*(s-b)*(s-c));%uses predefined variables to find the area 
circumrad=(a*b*c)/(4*triarea);
inrad=triarea/s;


