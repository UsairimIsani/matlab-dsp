%Discrete time correlation using MATLAB
clear all;
close all;
clc;
ph1=0;
ph2=0;
n=[0:9];
x=sin(2*pi*0.1*n+ph1);
org_x=1;
nx=[0:length(x)-1]-org_x+1;
y=sin(2*pi*0.1*n+ph2);
org_y=1;
ny=[0:length(y)-1]-org_y+1;
rxy=xcorr(x,y); %for convoultion use rxy=conv(x,fliplr(y));
nr=[nx(1)-ny(end) : nx(end)-ny(1)];
[maxR indR]=max(rxy);
disp(['The maximum correlation is at lag' num2str(nr(indR))'.']);
figure;
subplot(3,1,1);
stem(nx,x);
xlabel('Time Index');
ylabel('Amplitude');
title('Signal x(n)');
grid;
subplot(3,1,2);
stem(ny,y);
xlabel('Time Index');
ylabel('Amplitude');
title('Signal y(n)');
grid;
subplot(3,1,3);
stem(nr,rxy);
xlabel('Time Index');
ylabel('Amplitude');
title('Correlation b/w x(n) & y(n)');
grid;


    
