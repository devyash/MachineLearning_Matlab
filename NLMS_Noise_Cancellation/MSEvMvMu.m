clear;
load('project1.mat');
i=0;
for M=2:50
    i=i+1;
    j=0;
for mu=0.001:0.01:0.1
    j=j+1;
[e,w]=nlms1(mu,M,primary,reference);
z(i,j)=sum(e.^2);
end
end
surf(z);