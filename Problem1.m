clear all;
close all;
%Part a)
% Grid of 140 dots (including both endpoints makes it 141) between -2 to 12.
% Since (12+2)/.1 = 140, this is exactly steps of .1
t = linspace(-2,12,141);

% Part b)
%Observed data
y = [0 10 9 8 11 3 3 8 8 11];
n = 10;

% As provided, the postiere distribution is such:

g =@(theta) prod( 1./(1+(y - theta).^2) );
X = [];
for i = 1:141
    X(i) = g(t(i));
end

% Since we know all distributions integrate to 1, we can
% easily scale this distribution:
sum = 0;
for i = 2:141
    sum = sum + X(i)*(t(i) - t(i-1));
    % t(i) - t(i-1) % Uncomment to verify that t(i) - t(i-1)
    % really is .1.
end
X = X./sum;

% Part C)

plot(t,X);

% Part d)

%To increase accuracy of standard deviation and mean, I wanted to turn
%up the accuracy.
t = linspace(-2,12,10001);
X = [];
%Redo the calcuations
for i = 1:10001
    X(i) = g(t(i));
end
sum = 0;
for i = 2:10001
    sum = sum + X(i)*(t(i) - t(i-1));
end
X = X./sum;

%Riemann sum.
Average = 0;
for i = 2:10001 
    Average = Average + t(i)* X(i)*(t(i) - t(i-1));
    % integrate -2 to 12: x*f(x)*dx. x = t(i). X(i) = f(x). dx = t(i) - t(i-1)
end

Squaredaverage = 0;
for i = 2:10001 
    Squaredaverage = Squaredaverage + t(i)^2* X(i)*(t(i) - t(i-1)); 
    % E[X^2] = integrate -2 to 12: x^2*f(x)*dx. x = t(i). X(i) = f(x). dx = t(i) - t(i-1)
end
%variance = E[X^2] - E[X]^2
std = Squaredaverage - Average^2;

Average
std

