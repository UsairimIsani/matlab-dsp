clear all;
close all;
clc;

Ts = 0.001; % Approximate the continous time
t = -10:Ts:10; %Time verctor small step size to appr continous time
Tp = 1;
tau = 0.5; % Pulse Width, duty cycle
dc = 1; % DC offset 
x = (dc + square(2 * t * pi / Tp, tau*100))/2;
plot(t,x);
xlabel("Secs ");
ylim([-1.2 1.2]);
% pause 

Fo = 1 / Tp;

% Extract a portion from this signal

fi_per = find(t == -Tp/2) : find(t == Tp/2) ; 
xport = x(fi_per);
figure 
plot(t(fi_per),xport);
xlabel("Sec");
ylim([-1.2 1.2]);
% pause 

for k = 1:20
    B = exp(-1j * 2 * pi * (k-1) * Fo.* [-Tp/2:Ts:Tp/2]);
    C(k) = sum(xport.*B) / length(xport) * Tp;
end

kFo = Fo*[0:k-1];
figure,
stem(kFo,abs(C));
title("CTFS Coefficients"); 
xlabel("Hz");


% tau = 0.2; % Pulse Width, duty cycle Decreasing increases lobe width
% if tau=0.001 Pulse width becomes impulses and lobe width increase to impulses in frequency domain
% if tau=1 Pulse width becomes dc and lobe width becomes impuls in frequency domain



