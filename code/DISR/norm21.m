function [res]=norm21(W)
    [m,n]=size(W);
    for i=1:m
       temp(i)=norm(W(i,:)); 
    end
    res=sum(temp);
end