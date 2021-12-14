%update v
function [v] = updateV(X,W,H,k,beta)
    [n,d]=size(X);
    for i=1:n
       L=norm(X(i,:)-X(i,:)*W*H)^2;
       if (L>=1/(k^2))
           v(i)=0;
       elseif (L<=1/(k+1/beta)^2)
           v(i)=1;
       else 
           v(i)=beta*(1/sqrt(L)-k);
       end 
    end 
end 