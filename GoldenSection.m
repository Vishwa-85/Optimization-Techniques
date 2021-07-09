%Prg 6: Golden section search method with comments---
clc
clear all
x1=input('Value x1: ');            %Specifying the intervals x1 & x4 i.e., first and last point 
x4=input('Value x4: ');
ni=input('Interval reductions: '); %Specifying the number of interval reductions: n=ni+1
I1=abs(x4-x1);                     %I1=|x4 - x1|
n=ni+1;
e=input('Desired accuracy: ');     %If the user is interested to give desired accuracy
if e>0                             %Accuracy must be >0
    F(1)=1;                        %Fibonacci series is used so that we get smallest value of n so that (1/Fn)<e
    F(2)=1;
    z=50;
    for i=3:z
        F(i)=F(i-1)+F(i-2);        %This loop gives Fibonacci series for 50 terms starting from F(1) to F(50)
    end                            %Ex: 1   1   2   3   5   8 .. (upto 50 terms) 
    for i=1:z
        if (1/F(i))<e
            break;                 %Breaks the loop as soon as it gets a term such that (1/Fn) < e
        end
    end
    n=i-1;
end
a=0.618;                           %For Golden section search, we need constant value of alpha i.e, 0.618
x2=(a*x1)+((1-a)*x4);              
f2=fa(x2);                         %evaluating function at x2
i=1;
while i<n
    x3=(a*x4)+((1-a)*x1);
    f3=fa(x3);                     %evaluating function at x3
    if f2<f3
        x4=x1;                     %by doing this step we are basically setting the new values of x1 and x4
        x1=x3;                     %reason: the minimum is around x2 so we are reducing the interval
    else
        x1=x2;                     %here since f3<f2, the minimum is around x3. so, we are reducing the interval by setting new values to x1, x2
        x2=x3;
        f2=f3;
    end
    i=i+1;                          %incrementing i for next iteration
    if i==n
        break;
    end
end
x1,x4
fprintf('Final Interval: %f\n',abs(x1-x4));           %final interval is supposed to be mod(x1-x4)
fprintf('Approximate value of x = %f\n',((x1+x4)/2)); %taking avg value of x1 and x4 to be approximate value of x
fprintf('Value of f(x): %f\n',fa((x1+x4)/2));         %evaluating function at avg value
