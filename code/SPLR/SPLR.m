%{
Unsupervised feature selection via self-paced learning and low-redundant regularization
input:
X:data matrix with n rows and d columns
alpha,lambda1,lambda2,lambda3:balance parameters
beta,k,mu:parameters related to self-paced learning
maxIter:maximum iteration number
K:dimension of the subspace
output:
W:projection matrix with d rows and K columns
index:sorted index of the l2-norm of rows of matrix W
obj:values of the objective function during the iteration
%}
function [W,index,obj] = SPLR(X,alpha,lambda1,lambda2,lambda3,beta,mu,maxIter,K)
    [n,d]=size(X);
    %Initialize W and H
    W=ones(d,K);
    H=rand(K,d);
    X=mapminmax(X',0,1);
    X=X';
    %calculate the similarity between features
    featuresX=normalize(X);
    S=featuresX'*featuresX;
    S=S-diag(diag(S));
    %calculate the similarity between samples
    samplesX=normalize(X');
    samplesX=samplesX';
    Z=samplesX*samplesX';
    %calculate the Laplacian matrix L
    L=diag(sum(Z,2))-Z;
    iter=1;
    %Initialize k
    k=initializek(X,W,H);
    while (iter<=maxIter)
        %update v
        v=updateV(X,W,H,k,beta);
        %update G
        G=diag(sqrt(v))*X;
        %update H
        H=H.*(W'*(G'*G))./(W'*(G'*G)*W*H+eps);
        %update V
        V=updateU(W);
        W=W.*(G'*G*H'+lambda2*X'*Z*X*W+lambda3*W)./(G'*G*W*(H*H')+alpha*V*W+lambda1*S*W*ones(K,K)+lambda2*X'*(L+Z)*X*W+lambda3*(W*W')*W+eps);%update W
        %calculate the value of the objective function
        obj(iter)=trace((G-G*W*H)*(G-G*W*H)')+alpha*trace(W'*updateU(W)*W)+beta^2/sum(v+beta*k)+lambda1*trace(S'*W*ones(K,K)*W')+lambda2*trace(W'*X'*L*X*W)+lambda3/2*trace((W'*W-eye(K,K))*(W'*W-eye(K,K))');
        %update k
        k=k/mu;
        %the stop criteria
        if (iter>2)
            if (abs(obj(iter-1)-obj(iter))/abs(obj(iter-1))<10^(-3))
                break;
            end 
        end 
        iter=iter+1;
    end 
    %calculate the score
    score=sum((W.*W),2);
    [~,index]=sort(score,'descend');
end 