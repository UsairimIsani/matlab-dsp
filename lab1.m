close all; clear all; clc;
f=2;
t=0:0.0005:1.0;
xt=sin(2*pi*f*t);
fs = 8;
ts=1/fs;
nts=0:ts:1.0;
xn=sin(2*pi*f*nts);
plot(t,xt);
hold on;
stem(nts,xn);
pause