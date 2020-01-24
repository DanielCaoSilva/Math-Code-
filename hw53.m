function  [triperi, triarea, circumrad, inrad] = hw53(x1,y1,x2,y2,x3,y3)

a=distance2points(x1,y1,x2,y2);
b=distance2points(x2,y2,x3,y3);
c=distance2points(x3,y3,x1,y1);
triperi=a+b+c;
s=triperi/2;
triarea=sqrt(s*(s-a)*(s-b)*(s-c));
circumrad=(a*b*c)/(4*triarea);
inrad=triarea/s;


