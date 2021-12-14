%calculate the objective function value of DISR
function [value]=objective(E,Z,G,S,lambda1,lambda2)
    temp1=norm21(E);
    temp2=lambda1*norm21(Z);
    temp3=lambda2*trace(S'*G*ones(length(G))*G');
    value=temp1+temp2+temp3;
end