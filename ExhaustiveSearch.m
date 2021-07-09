%Prg 3: EXHAUSTIVE SEARCH METHOD

clc
clear all
a=input('Lower limit: ');
b=input('Upper limit: ');
n=input('No. of iterations: ');
del=((b-a)/n);
x(1)=a;
for i=2:3
        x(i)=del+x(i-1);
end
diff=x(3)-x(1);
while diff>0.0001
    if fa(x(1))>=fa(x(2)) && fa(x(2))<=fa(x(3))
         fprintf('Minima lies between %f and %f\n',x(1),x(3));
         ans=(((x(1))+(x(3)))/2);
         fprintf('Approximate position of minima: x = %d\n',ans);
         fprintf('Value of f(x): f(x) = %d\n\n',fa(ans));
         break;
    else
        x(1)=x(2);
        x(2)=x(3);
        x(3)=x(2)+del;
    end
end
