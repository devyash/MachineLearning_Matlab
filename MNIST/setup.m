clear;
clc;
tr = csvread('mnist_train.csv', 1, 0);                  % read train.csv
n = size(tr, 1);                    % number of samples in the dataset
targets  = tr(:,1);                 % 1st column is |label|
targets(targets == 0) = 10;         % use '10' to present '0'
targetsd = dummyvar(targets);       % convert label into a dummy variable
inputs = tr(:,2:end);               % the rest of columns are predictors

inputs = inputs';                   % transpose input
targets = targets';                 % transpose target
targetsd = targetsd';               % transpose dummy variable




rng(1);                             % for reproducibility
c = cvpartition(n,'Holdout',n/7);   % hold out 1/7 of the dataset

Xtrain = inputs(:, training(c));    % 2/3 of the input for training
Ytrain = targetsd(:, training(c));  % 2/3 of the target for training
Xtest = inputs(:, test(c));         % 1/3 of the input for testing
Ytest = targets(test(c));           % 1/3 of the target for testing
Ytestd = targetsd(:, test(c));      % 1/3 of the dummy variable for testing

nnstart

load myWeights                          % load the learned weights
W1 =zeros(100, 715);                  % pre-allocation
W1(:, x1_step1.keep) = IW1_1;           % reconstruct the full matrix
figure                                  % plot images
colormap(gray)                          % set to grayscale
for i = 1:25                            % preview first 25 samples
    subplot(5,5,i)                      % plot them in 6 x 6 grid
    digit = reshape(W1(i,:), [28,28])'; % row = 28 x 28 image
    imagesc(digit)                      % show the image
end


Ypred = myNeuralNetworkFunction(Xtest);             % predicts probability for each label
Ypred(:, 1:5)                       % display the first 5 columns
[~, Ypred] = max(Ypred);            % find the indices of max probabilities
sum(Ytest == Ypred) / length(Ytest) % compare the predicted vs. actual


sweep = [10,50:100:700];                 % parameter values to test
scores = zeros(length(sweep), 1);       % pre-allocation
models = cell(length(sweep), 1);        % pre-allocation
x = Xtrain;                             % inputs
t = Ytrain;                             % targets
trainFcn = 'trainscg';                  % scaled conjugate gradient
for i = 1:length(sweep)
    hiddenLayerSize = sweep(i);         % number of hidden layer neurons
    net = patternnet(hiddenLayerSize);  % pattern recognition network
    net.divideParam.trainRatio = 70/100;% 70% of data for training
    net.divideParam.valRatio = 15/100;  % 15% of data for validation
    net.divideParam.testRatio = 15/100; % 15% of data for testing
    net = train(net, x, t);             % train the network
    models{i} = net;                    % store the trained network
    p = net(Xtest);                     % predictions
    [~, p] = max(p);                    % predicted labels
    scores(i) = sum(Ytest == p) /...    % categorization accuracy
        length(Ytest);
end

figure
plot(sweep, scores, '.-')
xlabel('number of hidden neurons')
ylabel('categorization accuracy')
title('Number of hidden neurons vs. accuracy')