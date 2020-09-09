%Studying time frequency characteristics using CTFS
clear all;
close all;
clc;
Ts=0.001; %sampling time (it is so small because to approximate continous time)
t=[-10:Ts:10]; %time vector
Tp=1; %time period of square wave %change values and observe effects
tau=0.5; %pulse width/duty cycle
x=(1+square(2*pi*t/Tp,tau*100))/2;
plot(t,x);
xlabel('Seconds');
ylim([-1.2 1.2]);
pause; %it require any key to stop
Fo=1/Tp;
%Extract a portion from this signal equal to its period
I_period=find(t==-Tp/2): find(t==Tp/2); %extracting the x-axis portion
xport=x(I_period); %extracting the y-axis portion
figure;
plot(t(I_period),xport);
xlabel('Seconds');
ylim([-1.2 1.2]);
pause

%computing CTFS coeeficients
for k=1:20
    B=exp(-j*2*pi*(k-1)*Fo.*[-Tp/2:Ts:Tp/2]);
    C(k)=sum((xport.*B)/length(xport)*Tp);
end
kFo=Fo*[0:k-1] %freq in Hz
figure;
stem(kFo,abs(C));
title('CTFS Coefficients');
xlabel('Hz');
