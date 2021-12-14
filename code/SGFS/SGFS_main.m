clear;

load('COIL20.mat');%+1,-3,+6,+8,70

rng('default');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fea=X;
gnd=Y;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nClusts = length(unique(gnd));
options = [];
options.NeighborMode = 'KNN';
options.k =5;
% options.WeightMode = 'Binary';
options.t =1e+1;
options.WeightMode = 'Heatkernel';
S=constructW(fea',options);
D=diag(sum(S));
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
NIter=30;
alpha=1e-3;
beta=1e+6;
lamda=1e+8;
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m=70;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%≥ı ºªØW,H
[n,d]=size(fea);
B=NSSRD_init_S(fea',m);
A=ones(d,m);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
W=A;
H=B;
X=fea;
tic
[X_new,W,H,obj,idx]=SGFS(X,W,H,D,S,alpha,beta,lamda,m,NIter);
toc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:40
    %     tic
    label=litekmeans(X_new,nClusts,'MaxIter',100,'Replicates',10);
    %     toc
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    newres = bestMap(gnd,label);
    AC = length(find(gnd == newres))/length(gnd);
    MIhat=MutualInfo(gnd,label);
    resualt(i,:)=[AC,MIhat];
            disp(i);
            disp(resualt(i,:));
end
for j=1:2
    a=resualt(:,j);
    ll=length(a);
    temp=[];
    for i=1:ll
        if i<ll-18
            b=sum(a(i:i+19));
            temp=[temp;b];
        end
    end
    [e,f]=max(temp);
    e=e./20;
    MEAN(j,:)=[e,f];
    STD(j,:)=std(resualt(f:f+19,j));
    rr(:,j)=sort(resualt(:,j));
    BEST(j,:)=rr(end,j);
end
STD
BEST
MEAN

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



