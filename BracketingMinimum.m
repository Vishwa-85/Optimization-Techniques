% Vishwambhar R Kulkarni
% Scholar No. 202113207
% All MATLAB Programs 
% Prg 1: BRACKETING THE MINIMUM

clc
clear all
r=1;
del=1;
x1=input('Starting point: ');
f1=fa(x1);
x2=x1+del;
f2=fa(x2);
x11(1)=x1;
mf11(1)=f1;
x11(2)=x2;
mf11(2)=f2;
if f2<f1
    del=r*del;
else
    del=-del;
end
for i=3:15
    x3=x2+del;
    f3=fa(x3);
    x11(i)=x3;
    mf11(i)=f3;
    if f3>f2
        x1=x3;
        f1=f3;
        del=-del;
        r=0.5*r;
        del=r*del;        
    else
        f1=f2;
        f2=f3;
        x1=x2;
        x2=x3;
        del=r*del;
    end
end
plot(x11,mf11)
fprintf('Minima lies at: %d\n',x2);
fprintf('Value of f(x): f(x) = %d\n',fa(x2));
