clc
clear all

prompt = 'Enter the number: ';
x = input(prompt);
a = x;
y = x-1;
for i=y:-1:1
    x = x*i;
end

fprintf('Factorial of %d = %d',a,x)