close all;
clear all;
clc;

% Figure One with x(n)
x = [ 0 0 0 0 1 1 1 1];
n = -4:3 ;
stem(n,x);
title("DSP");
xlabel("n");
ylabel("Amplitude");

% x(n-1)
figure
stem(n+1,x);
title("x(n-1) Delayed");
xlabel("n-1");
ylabel("Ampliture");

% x(n+1)

figure
stem(n-1,x);
title("x(n+1) Advanced");
xlabel("n+1");
ylabel("Ampliture");