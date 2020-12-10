clear all;
close all;
sampled_data = [43, 24, 100, 35, 85];
B = 200;
n = length(sampled_data);
max_sample = max(sampled_data);
% Part A)
% From the equation given, it is obvious that:
g = @(N) (1./(N.^n)).*(N<=B).*(max_sample<=N);

% From MatLab convention, a conditional returns 1 if true and 0
% if false. By doing this, the function becomes:
% 1/N^n if max(selected_data) <= N <= B, 0 otherwise.

% Clearly, this is a discrete setting with integer values.
% Therefore, t should be discrete integers.
t = linspace(max_sample, B, B-max_sample+1);
dist = g(t)./sum(g(t)); % Normalize to 1 so it is a valid distribution
plot(t, dist,  'k.');

% Part B)
% Expected value of a discrete pmf: sum(x*f(x)) for all possible values
% of x. 
mean = sum(t.*dist)

%Std of a discrete pmf: (E[X^2] - E[x]^2)^.5
variance = sum((t.^2).*dist) - mean.^2;
std = variance.^.5

% Part C) 

% P[X>150] = sum(f(x)) for x > 150.
probablity_x_greaterthan_150 = sum(dist.*(t>150))