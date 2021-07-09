% Prg 7: NEWTON RAPHSON METHOD

clc
clear all

x(1)=input('Enter initial guess: ');
n=input('No. of iterations: ');
e=input('Accuracy level: ');
i=1;
while i<n
    a=x(i);
    x(i+1)=a-(g(a)/h(a));   %g(x) is a function for first derivative and h(x) is a function of second derivative
    if a==e
        break;
    else
        i=i+1;
    end
end
z=(length(x));
fprintf('The minimum value: %d\n',x(z));
fprintf('Min function value: %d',fa(x(z)));