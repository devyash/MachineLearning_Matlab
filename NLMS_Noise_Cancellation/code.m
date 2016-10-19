clear;
load('project1.mat');
mu=0.5;
M=70;
[e,w]=nlms1(mu,M,primary,reference);

subplot(3,1,1);
plot(1:70000,primary);
title('Primary Signal');
subplot(3,1,2);
plot(1:70000,reference);
title('Reference Signal');
subplot(3,1,3);
sound(e,fs);
plot(1:70000,e);
title('Error or the Desired signal');