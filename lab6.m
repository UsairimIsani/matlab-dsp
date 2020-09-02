% Correlation
clear all;
close all;
clc;
ph1 = 0;
ph2 = 0;
n = [0:9];

% x 

org_x = 1;
x = sin(2 * pi * 0.1 * n * ph1);
nx = [0:length(x)-1] - org_x + 1;

% y 

org_y = 1;
y = sin(2 * pi * 0.1 * n * ph1);
ny = [0:length(y)-1] - org_y + 1;

%  Autocorrelatron

rxy = xcorr(x,y);
nxy = [nx(1)-ny(end): nx(end)-ny(1)];
[maxR indR] = max(rxy);

% Display max Value in autocorrelation 

disp(["The maximum value is at lag", num2str(rxy(indR)) "."]);
 
figure
subplot(3,1,1);
stem(nx,x);
xlabel("Time Index");
ylabel("Amplitude");
title("Signal x(n)");

subplot(3,1,2);
stem(ny,y);
xlabel("Time Index");
ylabel("Amplitude");
title("Signal y(n)");

subplot(3,1,3);
stem(nxy,rxy);
xlabel("Time Index");
ylabel("Amplitude");
title("Signal Correlation");
pause