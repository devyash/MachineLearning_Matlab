clear ;
close all;
load('project1.mat');
x = primary.';
y = reference.';
%
m = length(y); % store the number of training examples
x = [ ones(m,1) x]; % Add a column of ones to x
n = size(x,2); % number of features
W_b_v = [0 0]';
W_s_v = [0 0]';
alpha = 0.002;
err = [0 0]';
W_b_v_v = zeros(10000,2);
W_s_v_v = zeros(50*10000,2);
for kk = 1:10000
	% b gradient descent - loop over all training set
	h_W_b = (x*W_b_v);
	h_W_b_v = h_W_b*ones(1,n);
	y_v = y*ones(1,n);
	W_b_v = W_b_v - alpha*1/m*sum((h_W_b_v - y_v).*x).';
	W_b_v_v(kk,:) = W_b_v;
	%j_W_b(kk) = 1/(2*m)*sum((h_W_b - y).^2);

	% sastic gradient descent - loop over one training set at a time
	for (jj = 1:50)
		h_W_s = (x(jj,:)*W_s_v);
		h_W_s_v = h_W_s*ones(1,n);
		y_v = y(jj,:)*ones(1,n);
		W_s_v = W_s_v - alpha*1/m*((h_W_s_v - y_v).*x(jj,:)).';
		%j_W_s(kk,jj) = 1/(2*m)*sum((h_W_s - y).^2);
		W_s_v_v(50*(kk-1)+jj,:) = W_s_v;
	end
end


j_W = zeros(250, 250);   % initialize j_W
W0_vals = linspace(-0.4, 0.4, 250);
W1_vals = linspace(-0.5, 2, 250);
for i = 1:length(W0_vals)
	  for j = 1:length(W1_vals)
		W_val_v = [W0_vals(i) W1_vals(j)]';
		h_W = (x*W_val_v);
		j_W(i,j) = 1/(2*m)*sum((h_W - y).^2);
    end
end
figure;
contour(W0_vals,W1_vals,10*log10(j_W.'))
xlabel('W1'); ylabel('W2')
title('Cost function J(W)');
hold on;
%plot(W_s_v_v(:,1),W_s_v_v(:,2),'o');
plot(W_b_v_v(:,1),W_b_v_v(:,2),'.');