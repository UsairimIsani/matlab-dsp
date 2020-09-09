%Study the DT convolution in MATLAB
%h(n)={3,2,1,-2,2,0,-4,0,3}
%x(n)={1,-2,3,-4,3,2,1}

close all;
clear all;
clc;
h=[3 2 1 -2 2 0 -4 0 3]; %N=9
org_h=1;
nh=[0:length(h)-1]-org_h+1; %yeh step smjh ni aya
x=[1 -2 3 -4 3 2 1]; %M=7
org_x=1;
nx=[0:length(x)-1]-org_x+1;
y=conv(h,x);
ny=[nh(1)+nx(1):nh(end)+nx(end)];
figure;
subplot(3,1,1);
stem(nh,h);
xlabel('Time Index');
ylabel('Amplitude');
title('Impulse Response');
subplot(3,1,2);
stem(nx,x);
xlabel('Time Index');
ylabel('Amplitude');
title('Input Signal x(n)');
subplot(3,1,3);
stem(ny,y);
xlabel('Time Index');
ylabel('Amplitude');
title('Convolved Output y(n)');



