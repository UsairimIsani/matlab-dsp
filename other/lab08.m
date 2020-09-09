%Study the DFT using MATLAB
clear all;
close all;
clc;
t=0:0.0001:10e-3;
xt=sin(2*pi*1000*t)+0.5*sin(2*pi*2000*t+(3*pi/4));
N=8; %8-point dft
n=0:N-1; %range
Fs=8000;
Ts=1/Fs;
xn=sin(2*pi*1000*n*Ts)+0.5*sin(2*pi*2000*n*Ts+(3*pi/4));
t1=n.*Ts;
subplot(3,1,1);
plot(t,xt,'r');
hold on;
stem(t1,xn,'filled');
xlabel('Time (sec)');
ylabel('Amplitude');
title('Input Signal');
grid
xk=zeros(1,N);
tic
for k=0:N-1
    for n=0:N-1
        xk(k+1)=xk(k+1)+(xn(n+1)*exp((-j)*2*pi*k*n/N));
    end
end
toc
magnitude=abs(xk);
k=0:N-1;
Df=Fs/N;
Fk=k*Df;
subplot(3,1,2);
stem(Fk,magnitude,'filled','r');
xlabel('Frequency(Hz)');
ylabel('Magnitude');
xlim([0 Fs]);
title ('Magnitude Spectrum');
grid
phase=angle(round(xk));
phase=(phase.*180)/pi;
subplot(3,1,3);
stem(Fk,phase,'filled','r');
xlabel('Frequency(Hz)');
ylabel('Phase');
xlim([0 Fs]);
title('Phase Spectrum');
grid


