clc
clear all

% f=@(x) ((((x+4)^2)/4)+4);
x1=input('Enter Starting point: ');
n=input('Enter no. of iterations: ');
del=1;
r=1;

x2=x1+del;
x11(1)=x1;
x11(2)=x2;

f1=fm(x1)
f11(1)=f1;

f2=fm(x2)
f11(2)=f2;

if f2>f1
    del=r*del;
else
    del=-del;
end

for i=3:n
    x3=x2+del;
    f3=fm(x3)
    
    x11(i)=x3;
    f11(i)=f3;
    
    if f(3)<f(2)
        x1=x3;
        f1=f3;
        del=-del;
        r=0.75*r;
        del=r*del;
    else
        x1=x2;
        x2=x3;
        f1=f2;
        f2=f3;
        del=r*del;
    end
end

plot(x11,f11)
        

