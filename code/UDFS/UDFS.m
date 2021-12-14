function [W,index,obj]=UDFS(X,para,regu,class_num)
% The UDFS feature selection algorithm
% Ref: 
% L21-Norm Regularized Discriminative Feature Selection for Unsupervised Learning. 
% Yi Yang, Heng Tao Shen, Zhigang Ma, Zi Huang and Xiaofang Zhou. 
% International Joint Conferences on Artificial Intelligence 2011, (IJCAI-2011).
%
% X: the input data matrix;
% X_2: the output selected feature matrix;
% fea_num: the number of selected features
% para.k: the number of knn for local discriminative analysis
% regu: the regularization parameter 


X=mapminmax(X',0,1);
X=X';

L = LocalDisAna(X', para);
% unsupervised local discriminative analysis 

A = X'*L*X;
[W, obj]=LquadR21_reg(A, class_num, regu);

score= sum(W.*W,2);
[res, index] = sort(score,'descend');
end

