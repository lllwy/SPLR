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
    Oyjle74CrIBWSy/24FYBsw==
    %Initialize W and H
    VMcVdqd2vucQBCL6QZChcg==
    8hJhgBz6KAHDK++tWi0fXQ==
    zznpvA+qbtyTgXqASSxBEBnDTKHF6NgUuKPqvCIRu9o=
    KNzhb4p0V747XGYHuyf0Vg==
    %calculate the similarity between features
    AiCdxnMgNKC8Y32ZeBthE4wVDgRJPAuzT2kw6fcADWA=
    v8vD1dKz/MJ9QARpcUwBYvR67wUTRhK5yPM0yRwD0Fg=
    5F21vaPYucwtvYRaWj6T8Yv/+h/wSnfNl9W84ppOO2M=
    %calculate the similarity between samples
    CXmgBvi6OlUAf9oKaF/AHMRLpwKV/YQS5pmB4i/GB+0=
    NwY0Q89ofetYw2Ga0d4/p9KM3BWZn/oza5I07l0Z7hg=
    QdnUA/WzTONwX+amt3/txBoS6JGRsZiHh2MNKdEWo6o=
    %calculate the Laplacian matrix L
    9fDEc7nqnCHgrY5xHjHWrQQfCvNCk4/eq1BwOdJuuDE=
    iter=1;
    %Initialize k
    +27pvC15tZZeJ0iSkGtW9SCiZtvFFejIGNp1dCthEbQ=
    while (iter<=maxIter)
        %update v
        krXUYQRIcdnSCdDAsiIKw1M5V2Uz7hPxNxgyXZAI+Mc=
        %update G
        NXNrXauERY/PZFNQG5QkHZ6nfHB7Fwyw7kS8OJo5bSs=
        %update H
        CL60XavGX6kMW2/kQ5oz9nEXJ4nI0GTdq5OMWDqWG0YzrQctFq3VIuoL9t40r5sA
        %update V
        CpA2L+y+xEjXHO+NMtV5xw==
        1Gm7jaOULeBriCNm3kVt9vItNZ894h8cD+XClvaDOpEm/+NzG7rf525m+HUBybXfBaKq8y93+YJNJgX5ugm2vALv1DRlOUqV19772ycPOBVstqqqQ7jYh1N7DZXbCadVzjUYTQr49DH6pcnvYoziQqlv3s5H8LPeTwBMrKIGxN9N2xfYKpau/o5Bozh8QegRW=W.*(G'*G*H'+lambda2*X'*Z*X*W+lambda3*W)./(G'*G*W*(H*H')+alpha*V*W+lambda1*S*W*ones(K,K)+lambda2*X'*(L+Z)*X*W+lambda3*(W*W')*W+eps);%update W
        %calculate the value of the objective function
        INiXXi7Ey6pWuO2BZ8SHzln45JjPho5Vqh1nd5ykzAfSNxix/y2hTrglsLk6KfO7OB9PCarxGhhVoBa0YBlXxKdB9DfmBujhLfVS2jRb5bvnpSl4u4JhZtxoEqmsI6w8HLNc2medoD7cWvrITgT/VWPro0tbvVlGjgzH0Wp8/Nrki8zVusLPEIDjWHjIYF47SN/W5Lv3OFkMBs5Dcl3q2eZ/rVaCZ4qPGiqM9Dsciw1Ij9/cUn10rzhtyZvaw0hgr4FuI1BT0VdozYcLvX60cA==
        %update k
        zIDRMiKM7LqHOuVzXpV1LQ==
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