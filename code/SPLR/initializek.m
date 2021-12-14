%Initialize k to be the inverse of the square root of the average loss per sample
function [k] = initializek(X,W,H)
    [n,d]=size(X);
    L=0;
    for i=1:n
       L = L + norm(X(i,:)-X(i,:)*W*H)^2;
    end 
    k=1/sqrt(L/n);
end 