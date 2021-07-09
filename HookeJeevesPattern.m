%Vishwambhar 202113207
%Prg 12: HOOKE JEEVES PATTERN METHOD

clc
clear all
x(1)=input('Enter first point x coordinate: ');
y(1)=input('Enter first point y coordinate: ');
del=input('Enter delta value: ');
alpha=input('Step reduction factor >1: ');
e=input('Enter accuracy value: ');
n=input('Enter No. of Iterations: ');
k=1;
itr=1;
while itr<n
   %EXPLORATORY MOVE
        xc=x(1); %(xc,yc) is current point
        yc=y(1);
        xnew(1)=xc;
        ynew(1)=yc;
        ft(1)=fx(x(1),y(1));    %current point function
        x(2)=x(1)+del;    %First point
        y(2)=y(1);
        ft(2)=fx(x(2),y(2));    %f(+)
        x(3)=x(1)-del;    %Second point
        y(3)=y(1);
        ft(3)=fx(x(3),y(3));    %f(-)
        minval=ft(1);   %this is to get the minimum valued function and its index
        j=1;
        for i=2:3
            if minval>ft(i)
                minval=ft(i);
                j=i;
            end
        end
        ft;
        minval;
        if minval<ft(1)
            %Exploration is success: it means if the minimum valued function is less than the earlier function, it is success
            x(1)=x(j);  %putting the value of minimum point into x(1)
            ft(1)=fx(x(1),y(1));    %new min point function calculation
            x(2)=x(1);  %First point
            y(2)=y(1)+del;
            ft(2)=fx(x(2),y(2));    %f(+)
            x(3)=x(1);  %Second point
            y(3)=y(1)-del;
            ft(3)=fx(x(3),y(3));    %f(-)
            minval=ft(1);   %to get minimum valued function and its index
            j=1;
            for i=2:3
                if minval>ft(i)
                    minval=ft(i);
                    j=i;
                end
            end
%             minval
%             ft
            if minval<ft(1)
                ftn(k+1)=ft(j);  %ftn is an array of best point functions and this statement is used to compare later
                %Exploration is success: it means if the minimum valued function is less than the earlier function, it is success
                xnew(k+1)=x(j);  %putting the value of minimum point into xnew(k+1)
                ynew(k+1)=y(j);  %putting the value of minimum point into ynew(k+1)
            end
        elseif minval==0
            break;
        else
%             fprintf('Exploration is FAILURE\n');
             if del<e   %if exploration is FAILURE: Change the value of del
                    break;
             else
                    del=(del/2);
             end
        end
%         ftn
        if ftn(k+1)==0  %%This is the condition when we ACTUALLY ACHIEVE ACCURATE MINIMA
            x(1)=xnew(k+1);
            y(1)=ynew(k+1);
            break;
        end
    xnew(k+2)=(2*xnew(k+1))-xnew(k);   %PATTERN MOVE TO GET NEW BASE POINT 
    ynew(k+2)=(2*ynew(k+1))-ynew(k);
    ftn(k+2)=fx(xnew(k+2),ynew(k+2));
    if ftn(k+2)<ftn(k+1)
        x(1)=xnew(k+2); %This sets up the new base point for next iteration
        y(1)=ynew(k+2);
    elseif ftn(k+2)==0
        x(1)=xnew(k+2); %This is the condition when we ACTUALLY ACHIEVE ACCURATE MINIMA
        y(1)=ynew(k+2);
        break;
    else
        if del<e   %if exploration is FAILURE: Change the value of del
              break;
        else
              del=(del/2);
        end
    end
   itr=itr+1;
   k=k+1;
end
% ftn;
fprintf('Minima occurs at (%f, %f)\n',x(1),y(1));
fprintf('Min. value: %f\n',fx(x(1),y(1)));
 
            
        
    
            
        
    
    