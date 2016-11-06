clear;
load('project1.mat');
j=0;
E=zeros(8,10);
for M=14:50
    j=j+1;
    i=0;
for mu=0.01:0.01:0.1
i=i+1;
[e,w]=nlms1(mu,M,primary,reference);
E(j,i)=sum(e.^2);
%sound(e,fs);
end
end
surf(0.01:0.01:0.1,14:50,E);
title('Best Step size and Filter order')
ylabel('Filter Order');
xlabel('Step Size');
zlabel('Cost Function(J)');