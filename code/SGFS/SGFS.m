function [X_new,W,H,obj,idx]=SGFS(X,W,H,D,S,alpha,beta,lamda,m,NIter)

X=mapminmax(X',0,1);
X=X';

[n,d]=size(X);
U=eye(d);
I=eye(m);
for iter=1:NIter
    G=sqrt(diag(sum(W'*W,2)));
    W=W*inv(G);
    H=G*H;
    

    W=W.*((alpha*X'*X*H'+lamda*W)./(alpha*X'*X*W*H*H'+beta*U*W+lamda*W*W'*W+eps));


    H=H.*((alpha*W'*X'*X+H*S)./(alpha*W'*X'*X*W*H+H*D+eps));
    
    Wi = sqrt(sum(W.*W,2)+eps);
    u = 0.5./Wi;
    U = diag(u);
    

    obj(iter)=trace(H*(D-S)*H')+alpha*trace((X-X*W*H)*(X-X*W*H)')+beta*sum(Wi)+0.5*lamda*trace((W'*W-I)*(W'*W-I)');

    
    if iter>2
        if abs(obj(iter)-obj(iter-1))/obj(iter-1)<1e-6
            break
        end
    end
end

score= sqrt(sum(W.*W,2));
[res, idx] = sort(score,'descend');

X_new = X (:,idx(1:m));
end




