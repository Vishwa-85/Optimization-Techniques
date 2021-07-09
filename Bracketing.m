clc
clear all

% Getting the minimum of equation x^2 = 4*y 
r=input('Enter the value of Gap factor: ');
x1=input('Enter the first approximation of x: ');
del=input('Enter the gap between successive approximations: ');

x2=x1+del
x11(1)=x1;
x11(2)=x2;
F1=(((x1+4)^2)/4)+4
F2=(((x2+4)^2)/4)+4
x3=x2;
F3=F2;
x11(3)=x3;

mf11(1)=F1;
mf11(2)=F2;
mf11(3)=F3;
ans=1
while ans==1
    
    if F2<F1
        del=(r*del);
        x3=x2+del;        %x(3)=x(2)+del
        F3=(((x3+4)^2)/4)+4;    % F3 is calculated
        x11(3)=x3;
        mf11(3)=F3;
    else
        var=F1;                %interchanging F2 and F1
        F1=F2;
        F2=var;
        
        var=x1;              %interchanging x(2) and x(1)
        x1=x2;
        x2=var;
        
        del=-del;
    end

   if F3<F2
        F1=F2;
        F2=F3;
        x1=x2;
        x2=x3;
        
        del=(r*del);
        x3=x2+del;        
        F3=(((x3+4)^2)/4)+4;
        x11(3)=x3;
        mf11(3)=F3;
   else 
       ans=F2
       break
    
   end
end

plot(x11,mf11)

% for i=1:n
%     F(i)=((x(i))^2)-y         % F1 is calculated
%     x(i+1)=x(i)+del         % x(2)=x(1)+del
%     F(i+1)=((x(i+1))^2)-y    % F2 is calculated
%     
%     if F(i+1)<F(i)
%         del=(r*del)
%         x(i+2)=x(i+1)+del        %x(3)=x(2)+del
%         F(i+2)=((x(i+2))^2)-y    % F3 is calculated
%     else
%         var=F(i)                %interchanging F2 and F1
%         F(i)=F(i+1)
%         F(i+1)=var
%         
%         varX=x(i)               %interchanging x(2) and x(1)
%         x(i)=x(i+1)
%         x(i+1)=varX
%         
%         del=-del
%     end
%     
%     if F(i+2)<=F(i+1)
%         F(i)=F(i+1)
%         F(i+1)=F(i+2)
%         x(i)=x(i+1)
%         x(i+1)=x(i+2)
%         
%         del=(r*del)
%         x(i+2)=x(i+1)+del        
%         F(i+2)=((x(i+2))^2)-y 
%     end
% end
        
    

