% Prg 10: BOX SEARCH METHOD with comments---

clc
clear all
resp = input('Please enter the coordinates of initial point: ','s');    %Taking user input for the coordinates in the form of (x1, x2) as string input
num = sscanf(resp, '%g %g');                    %Reads the input given and puts the value in num
x1(1)=num(1);                                   %initialising the vectors x1 and x2 each indicating the values of variables x1 and x2
x2(1)=num(2);
fprintf('\nThe given initial point is (%d,%d)\n',x1(1),x2(1));
del=input('\nSelect the value of size reduction step: ');   %value of size reduction step
diff_x1=1;                      %difference in successive values of x1 and x2 respctively, this is one of the Termination criteria
diff_x2=1;
n=input('No. of iterations: ');
e=input('Enter accuracy: ');    %Termination criteria: difference between successive values of x1 and x2 should be less than e
itr=1;                          %itr is the counter to measure iterations
while diff_x1>e && diff_x2>e || itr<n
    fprintf('\nIteration %d begins... ',itr);
    x1(2)=x1(1)+del;            %new values of x1(i) and x2(i) are calculated based on these formulae 
    x2(2)=x2(1);                %Basically we need to search for the coordinates which gives us minimum value, so this is the logic followed to get those points
    fprintf('\nThe first point is (%d,%d)\n',x1(2),x2(2));
    x1(3)=x1(1)-del;
    x2(3)=x2(1);
    fprintf('The second point is (%d,%d)\n',x1(3),x2(3));
    x1(4)=x1(1);
    x2(4)=x2(1)+del;
    fprintf('The third point is (%d,%d)\n',x1(4),x2(4));
    x1(5)=x1(1);
    x2(5)=x2(1)-del;
    fprintf('The fourth point is (%d,%d)\n',x1(5),x2(5));
    for i=1:5
        v(i)=fx(x1(i),x2(i));   %evaluating function values for each of those points we obtained earlier
    end
    minVal=v(1);
    j=1;
    for i=2:5                   %this is for finding out which value of the functions is least and for which particular point we get least function value
        if minVal>v(i)
            minVal=v(i);
            j=i;
        end
    end
    x1b=x1(j);
    x2b=x2(j);
    if x1b==x1(1) && x2b==x2(1) %If best point = initial point, then reduce del by half
        del=(del/2);
    else
        x1(1)=x1b;              %Else, put the values of best point as the initial value
        x2(1)=x2b;
    end
    itr=itr+1;       %incrementing the counter
    diff_x1=x1(itr)-x1(itr-1);      %Difference between the successive values of x1 and x2 respectively
    diff_x2=x2(itr)-x2(itr-1);
%     delta=sqrt(((x1(j))^2)+(x2(j))^2);                   
end
fprintf('The point at which near minima occurs is (%d,%d)\n',x1(j),x2(j)); %x1(j) and x2(j) are the best values we get from above program
fprintf('Value of minima is: %d\n',fx(x1(j),x2(j)));    %function evaluation at the best point

