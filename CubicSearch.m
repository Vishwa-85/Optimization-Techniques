clc
clear all
x(1)=input('Enter initial value: ');    %Taking user input for initial values, step size, accuracy value
del=input('Enter delta (step size) value: ');
e1=input('Enter accuracy e1: ');
e2=input('Enter accuracy e2: ');
K=input('Enter No. of iterations of loop 1: ');   %This is no. of iterations to run the 1st loop 
M=input('Enter No. of iterations of loop 2: ');   %This is no. of iterations to run the 2nd loop to calculate xbar
k=1;
itr=1;
fz(1)=fad(x(1));   %derivative at initial point
if fz(1)>0
   del=-del;
end
for k=1:K   %We need to check when (fz(k+1)*fz(k))<=0, and go to next step. We have taken 50 iterations here
    x(k+1)=x(k)+(2^k)*(del);    %formula used for x(k+1)
    fz(k+1)=fad(x(k+1));        %derivative of x(k+1)
    if (fz(k+1)*fz(k))<=0
        x1=x(k);
        x2=x(k+1);
        break;
    else
        k=k+1;
    end
end
while itr<M  %M is the total number of iterations initialised by user input
    f1=fa(x1);  %funcion at x1
    f2=fa(x2);  %funcion at x2
    f1d=fad(x1);    %derivative at x1
    f2d=fad(x2);    %derivative at x2
    z=(3*(f1-f2)/(x2-x1))+f1d+f2d;  %formula for z
    w=((x2-x1)/(abs(x2-x1)))*(sqrt((z^2)-(f1d*f2d)));   %formula for w
    mu=((f2d+w-z)/(f2d-f1d+(2*w))); %formula for mu
    if mu==0        %These are the conditions to get xbar value
        xbar=x2;
    elseif 0<mu<=1
        xbar=(x2-(mu*(x2-x1)));
    elseif mu>1
        xbar=x1;
    end
    fxbar=fa(xbar); %function at xbar
    if fxbar<f1
        fxbard=fad(xbar);   %derivative at xbar
        if abs(fxbard)<=e1 | abs((xbar-x1)/xbar)<=e2
            break;
        elseif (fxbard*f1d)<0
            x2=xbar;
        else
            x1=xbar;
        end
    else
        xbar=xbar-(0.5*(xbar-x1));
    end
%     if abs(fxbard)<=e1
%         break;
%     end;
    itr=itr+1;
end
fprintf('Minima occurs at: %f\n',xbar)  %xbar is minimum value
fprintf('Value of minima is: %f\n',fxbar)

    

