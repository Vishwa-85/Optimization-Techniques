clc
clear all
x(1)=input('Enter base point x coordinate: ');  %taking user input
y(1)=input('Enter base point y coordinate: ');
r=input('Enter expansion factor >1: ');
b=input('Enter contraction factor within (0,1): ');
e=input('Enter accuracy: ');
n=input('Enter no. of iterations: ');
c=2;
err=1;         %initialising error
itr=1;
while itr<n         %Termination criteria
    x(2)=x(1)+c;    %This initial simplex is chosen in such a way, that 3 points are non linear
    y(2)=y(1);      %Plot these points and check it out!
    x(3)=x(2);
    y(3)=y(2)+c;
    for i=1:3
        fb(i)=fx(x(i),y(i));    %Function evaluations at each points
    end
    temp=fb(1);
    k=1;
    for i=2:3       %This piece of code is to get best and worst points
        if temp>fb(i)
            k=i;    %index of best point
        end
    end
    temp=fb(1);
    j=1;
    for i=2:3
        if temp<fb(i)
            j=i;    %index of worst point
        end
    end
    xl=x(k);        %xl and yl are best points
    yl=y(k);
    fl=fx(xl,yl);   %best point function
    xh=x(j);        %xh and yh are worst points
    yh=y(j);
    fh=fx(xh,yh);   %worst point functions
    xleft=6-k-j;    %to get next to worst index
    xg=x(xleft);    %next to worst points
    yg=x(xleft);
    fg=fx(xg,yg);   %next to worst point functions
    xc=((1/3)*(xl+xg)); %mean points
    yc=((1/3)*(yl+yg));
    xr=((2*xc)-xh);  %new points
    yr=((2*yc)-yh);
    xnew=xr;
    ynew=yr;
    fxr=fx(xr,yr);  %function at new value

    if fxr<fl       %These are the conditions of the algorithm given for each of the coordinates
        xnew=(((1+r)*xc)-(r*xh));   %expansion, if new point is better than best point
        ynew=(((1+r)*yc)-(r*yh));
    elseif fxr>=fh
        xnew=(((1-b)*xc)+(b*xh));   %contraction, if new point is worse than worse point
        ynew=(((1-b)*yc)+(b*yh));
    elseif fg<fxr<fh
        xnew=(((1+b)*xc)-(b*xh));   %negative contraction, if new point is between worst and next to worst point
        ynew=(((1+b)*yc)-(b*yh));
    else
        break;  %breaks the loop if none of the above conditions are applicable
    end
    fnew=fx(xnew,ynew); %calculating f(new point)
    xh=xnew;    %replacing xh and yh by new respective points 
    yh=ynew;
    %Calculating error and breaking loop if error < accuracy
    errsum=((fx(x(1),y(1))-fx(xc,yc))^2)+((fx(x(2),y(2))-fx(xc,yc))^2)+((fx(x(3),y(3))-fx(xc,yc))^2);
    errx=errsum/4;
    err=(errx^(0.5));
    if err<e
        break;
    end
    itr=itr+1;
    x(1)=xl;
    y(1)=yl;
end
err
fprintf('Minima occurs at (%d, %d)\n',xl,yl);
fprintf('\nMinimum value function is: %d',fx(xl,yl));


