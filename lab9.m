clear all;
close all;
clc;

Ts = 0.001;
Tp = 1;
t = 0:0.0001:10e-3;
dc = 0.5;
xt = sin(2 * pi * 1000 * t) + dc * sin(2 * pi * 2000 * t + (3 * pi / 4));
% N = 8;
% N = 1000; 
% For N = 1000;
% Elapsed time is 0.229460 seconds.
% Elapsed time is 0.002041 seconds.
n = 0 : N-1;
Fs = 8000;
Ts = 1 / Fs;
xn = sin(2 * pi * 1000 * n * Ts) + dc * sin(2 * pi * 2000 * n * Ts + (3 * pi/4));
t1 = n.*Ts;
subplot(3,1,1);
plot(t,xt,"r");
hold on;
stem(t1,xn,"filled");
xlabel("Time in Sec");
ylabel("Amplitude");
title("Input Signal");
grid;
tic
xk = zeros(1,N);
for k = 0:N-1
    for n = 0:N-1
        xk(k+1) = xk(k+1) + xn(n+1) * exp(-j * 2 * pi * k * n/N);
    end
end
ft = xk; 
toc
% Elapsed time is 0.003998 seconds. for DFTElapsed time is 0.003998 seconds.
%  Only this line has changed from lab8 in lab9
tic
ft = fft(xn); 
toc
% Elapsed time is 0.000847 seconds. For fft
magnitude = abs(ft);
k = 0:N-1;
Df = Fs/N;
Fk = k*Df;
subplot(3,1,2);
stem(Fk,magnitude,"filled","r");
xlabel("Frequency - Hz");
ylabel("Magnitude");
xlim([0 Fs]);
title("Magnitude spectrum");
grid;


phase = angle(round(ft));
phase = (phase.*180)/pi;
subplot(3,1,3);
stem(Fk,phase,"filled","b");
xlabel("Freq Hz");
ylabel("Phase ");
xlim([0 Fs]);
title("Phase spectrum");
grid;