% Prg 4: REGION ELIMINATION

clc
clear all
a=input('Lower limit: ');
b=input('Upper limit: ');
n=input('Step size: ');
i=0;
while (b-a)>0.0001
    L=((b-a)/n);
    x1=a+L;
    x2=b-L;
    xm=((a+b)/2);
    f1=fa(x1);
    f2=fa(x2);
    fm=fa(xm);
    if f1>fm
        a=x1;
    else
        b=xm;
    end
    if f2>fm
        b=x2;
    else
        a=xm;
    end
    i=i+1;
end
ans=((a+b)/2);
fprintf('Minimum value of f(x) occurs x = %d in %d iterations',ans,i);
fprintf('\nValue of f(x) is: f(x) = %d',fa(ans));

