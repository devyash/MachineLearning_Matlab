clear ;
close all;
load ('project1.mat');
x = primary.';
y = reference.';
%
m = length(y); % store the number of training examples
x = [ ones(m,1) x]; % Add a column of ones to x
n = size(x,2); % number of features
w_batch_vec = [0 0]';
w_stoch_vec = [0 0]';
alpha = 0.002;
err = [0 0]';
w_batch_vec_v = zeros(10000,2);
w_stoch_vec_v = zeros(50*10000,2);
for kk = 1:10000
	% batch gradient descent - loop over all training set
	h_w_batch = (x*w_batch_vec);
	h_w_batch_v = h_w_batch*ones(1,n);
	y_v = y*ones(1,n);
	w_batch_vec = w_batch_vec - alpha*1/m*sum((h_w_batch_v - y_v).*x).';
	w_batch_vec_v(kk,:) = w_batch_vec;
	%j_w_batch(kk) = 1/(2*m)*sum((h_w_batch - y).^2);

	% stochastic gradient descent - loop over one training set at a time
	for (jj = 1:50)
		h_w_stoch = (x(jj,:)*w_stoch_vec);
		h_w_stoch_v = h_w_stoch*ones(1,n);
		y_v = y(jj,:)*ones(1,n);
		w_stoch_vec = w_stoch_vec - alpha*1/m*((h_w_stoch_v - y_v).*x(jj,:)).';
		%j_w_stoch(kk,jj) = 1/(2*m)*sum((h_w_stoch - y).^2);
		w_stoch_vec_v(50*(kk-1)+jj,:) = w_stoch_vec;
	end
end

figure;
plot(x(:,2),y,'bs-');
hold on
plot(x(:,2),x*w_batch_vec,'md-');
plot(x(:,2),x*w_stoch_vec,'rp-');
legend('measured', 'predicted-batch','predicted-stochastic');
grid on;
xlabel('Page index, x');
ylabel('Page views, y');
title('Measured and predicted page views');

j_w = zeros(250, 250);   % initialize j_w
w0_vals = linspace(-5, 5, 250);
w1_vals = linspace(-5, 5, 250);
for i = 1:length(w0_vals)
	  for j = 1:length(w1_vals)
		w_val_vec = [w0_vals(i) w1_vals(j)]';
		h_w = (x*w_val_vec);
		j_w(i,j) = 1/(2*m)*sum((h_w - y).^2);
    end
end
figure;
contour(w0_vals,w1_vals,10*log10(j_w.'))
xlabel('w_0'); ylabel('w_1')
title('Cost function J(w)');
hold on;
%plot(w_stoch_vec_v(:,1),w_stoch_vec_v(:,2),'o');
plot(w_batch_vec_v(:,1),w_batch_vec_v(:,2),'o');