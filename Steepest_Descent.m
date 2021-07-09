clc
clear all
x10=input('initial x coordinate: ') %initial point
x20=input('initial y coordinate: ')%initial point
e1=10^-3; %two termination parameter
e2=10^-3;
k=1; %defining k for iteration counter
M=10; %defining maximum iteration number
dydx1=@(x1,x2) 2*x1 + 4*x1*(x1^2 + x2 - 11) + 2*x2^2 - 14 %function of derivative w.r.t x1 
dydx2=@(x1,x2) 2*x2 + 4*x2*(x2^2 + x1 - 7) + 2*x1^2 - 22 %function of derivative w.r.t x2
while k>0
    y= @(x1, x2) ((x1.^2)+x2-11).^2+(x1+(x2.^2)-7).^2 %definig function w.r.t x1 and x2 for plotting
    ezcontour(y, [-5 5 -5 5]);
    x0 = [x10 x20];
    s1=-dydx1(x10,x20);
    s2=-dydx2(x10,x20);
    fz=[s1 s2]; %vector containing search directions
    %Now determine the search direction by finding value of alpha
    x1d = @(d) x10+(d*s1)
    x2d = @(d) x20+(d*s2)
    yd = @(d) y(x1d(d),x2d(d))
    d1 = fminsearch(yd,0)
    %value of alpha is nothing but d1
    if norm(fz,2)<e1
        break;
    elseif k>=M
        break;
    else
        x1=x0+(d1*fz);
    end
    x10 = x1(1);
    x20 = x1(2);
    k=k+1;
end
fprintf('No. of iterations is: %f\n',(k-1));
fprintf('Minima lies at (%f,%f)\n',x1(1),x1(2));