%update U
function [U] = updateU(W)
    [d,K]=size(W);
    U=zeros(d);
    for i=1:d
        temp=sum(W(i,:).*W(i,:))^(3/4);
        U(i,i)=1/max(temp,eps);
    end 
end 