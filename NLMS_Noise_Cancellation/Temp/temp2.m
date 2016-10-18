clear;
load('project1.mat');
mu=0.1;
M=2;
%[e,w,W]=nlms1(mu,M,primary,reference);
x=primary(:);
y=reference(:);

j_W = zeros(250, 250);   % initialize j_W
W1 = linspace(-5, 5, 250);
W2 = linspace(-5, 5, 250);
for i = 1:length(W1)
	  for j = 1:length(W2)
		W = [W1(i); W2(j)];
		h_W = (x*W);
		j_W(i,j) = 1/(2*mu)*sum((h_W - y).^2);
    end
end
figure;
contour(W1,W2,10*log10(j_W.'))
xlabel('W_0'); ylabel('W_1')
title('Cost function J(W)');
hold on;
plot(W(:,1),W(:,2),'o');