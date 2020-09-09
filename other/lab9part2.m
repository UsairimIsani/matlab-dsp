%Studying the FFT using MATLAB
clear all;
close all;
clc;
t=0:0.0001:10e-3;
xt=sin(2*pi*1000*t)+0.5*sin(2*pi*2000*t+(3*pi/4));
N=8;
n=0:N-1;
Fs=8000;
Ts=1/Fs;
xn=sin(2*pi*1000*n*Ts)+0.5*sin(2*pi*2000*n*Ts+(3*pi/4));
t1=n.*Ts;
subplot(311);
plot(t,xt,'r');
hold on;
stem(t1,xn,'filled');
xlabel('Time(sec)');
ylabel('Amplitude');
title('Input Signal');
grid;
xk=zeros(1,N);
tic
for k=0:N-1
    for n=0:N-1
        xk(k+1)=xk(k+1)+(xn(n+1)*exp((-j)*2*pi*k*n/N));
    end
end
toc
%ft=fft(xn);
ft=xk
magnitude=abs(ft);
k=0:N-1;
Df=Fs/N;
Fk=k.*Df;
subplot(312);
stem(Fk,magnitude,'filled','r');
xlabel('Frequency(Hz)');
ylabel('Magnitude');
title('Magnitude Spectrum');
xlim([0 Fs]);
grid;
phase=angle(round(ft));
phase=(phase.*180)/pi;
subplot(313);
stem(Fk,phase,'filled','r');
xlabel('Frequency(Hz)');
ylabel('Phase Angle');
title('Phase Spectrum');
grid;

