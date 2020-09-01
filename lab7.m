clear all;
close all;
clc;

Ts = 0.001; % Approximate the continous time
t = -10:Ts:10; %Time verctor small step size to appr continous time
Tp = 1;
tau = 0.5; % Pulse Width, duty cycle
dc = 1; % DC offset 
x = (dc + square(2 * pi * t/Tp, tau*100));
plot(t,x);
xlabel("Secs ");
ylim([-1.2 1.2]);
pause 

Fo = 1 / Tp;

% Extract a portion from this signal

fi_per = find(t == -Tp/2) : find(t == Tp/2) ; 
xport = x(fi_per);
figure 
plot(t(fi_per),xport);
xlabel("Sec");
ylim([-1.2 1.2]);
pause 



