close all;
clear all;
clc;

% Figure One with x(n)

x = [ 0 0 0 0 1 1 1 1];
n = -4:3 ;
stem(n,x);
title("x(n)");
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

% Flip 

y = fliplr(x);
figure
stem(n,y);
title("x(-n)");
xlabel("n");
ylabel("Amplitude");

% Downsample 
y1 = downsample(x,2);
n1 = -2:1:1;
figure
stem(n1,y1);
title("x(-n)");
xlabel("n");
ylabel("Amplitude");

% Upsample

y2 = upsample(x,2);
n2 = -8:1:7;
figure
stem(n2,y2);
title("x(-n)");
xlabel("n");
ylabel("Amplitude");
