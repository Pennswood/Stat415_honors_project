close all;
clear all;
% Part b)
data = [751, 594, 1213, 1126, 819];
s = sum(data);
n = length(data);

% Sample of theta ~ gamma (# of data points = 5, sum of the data)
% for 1000 samples.
% theta variable is 1000 samples of the theta (gamma) distribution.

% MatLab uses the definition of Gamma (a, b) = ___*e^(x/b), so 1/s
% is neccessary
num_sample = 1000;
theta = gamrnd(n,1/s,num_sample,1);

% Problem only asked us to create teh data, but what's the 
% point of creating the data if we can't see it?
%Create histogram with 100 bins and overlay a fitted red gamma line.
histfit(theta, num_sample/10,'gamma');


% Part C)

% Change of variables
% lamda variable is 1000 samples of the lamda distribution.
lambda = 1./theta;
figure;
histfit(lambda, num_sample/10,'gamma');

% Part C - Check my answer

% We know the distribution of lamda g(lamda) ~ lamda^(-n-1)*e^(s/lamda)

l = linspace (0, 4000, 10001);
hold on;
lamda_dist = l.^-(n+1).*exp(-s./l); % Distribution of lamda
plot(l, lamda_dist*10^21*7, 'k.');

% The black line created is not to scale (the scaling is estimated)
% So the integral will not integrate to the same # as the red line.
% However, it does sort of verify that the answer looks correct.

%Part D)
larger_than_1000_probability = sum(lambda>1000)/num_sample





