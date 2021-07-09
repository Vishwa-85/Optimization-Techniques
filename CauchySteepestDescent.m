clc
clear all
x(1)=input('Initial value of x: ');
y(1)=input('Initial value of y: ');
e=input('Enter termination parameter: ');
M=input('Enter no. of iterations: ');
xnew=x(1);
ynew=y(1);
k=0;
a(1)=0.127;    %alpha value
a(2)=0.0397277671;  %HOW TO GET alpha values using GOLDEN RATIO??!!
% K=k+1;
itr=1;
while itr<M
    S1(k+1)=-fx1(xnew,ynew)
    S2(k+1)=-fx2(xnew,ynew)
    x(k+2)=x(k+1)-(a(k+1)*fx1(x(k+1),y(k+1)))
    y(k+2)=y(k+1)-(a(k+1)*fx2(x(k+1),y(k+1)))
    xnew=x(k+2)
    ynew=y(k+2)
    k=k+1
    itr=itr+1   
end
xnew
ynew