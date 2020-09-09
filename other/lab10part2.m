%Designing FIR & IIR FILTERS
close all;
clear all;
clc;
%Frequencies in Hz;
F1=100;
F2=150;
%Sampling Frequencies in samples/sec
Fs=1000;
t=[0:1/Fs:1];%Time Vector
F=Fs*[0:length(t)-1]/length(t);%Frequency Vector
x=exp(j*2*pi*F1*t)+2*exp(j*2*pi*F2*t); %Signal 
bh=fir1(64,[125 175]/500); %Filter coefficients 6 is order 500 is fs/2
b1=fir1(64,[75 125]/500); %Filter coefficients
[hh,wh]=freqz(bh,1,length(t),'whole'); %Frequency response
[h1,w1]=freqz(b1,1,length(t),'whole'); %Frequency response
%Filter operation
yh=filtfilt(bh,1,x);
y1=filtfilt(b1,1,x);
%Plotting
figure,
subplot(511),plot(F,abs(fft(x)));xlim([0 Fs/2]);
title('FFT of original signal');
subplot(512),plot(F,abs(hh));xlim([0 Fs/2]);
title('Frequency response of Filter 1');
subplot(513),plot(F,abs(fft(yh)));xlim([0 Fs/2]);
title('FFT of filtered signal from filter 1');
subplot(514),plot(F,abs(h1));xlim([0 Fs/2]);
title('Frequency response of filter two');
subplot(515),plot(F,abs(fft(y1)));xlim([0 Fs/2]);
title('FFT of filtered signal from filter two');
xlabel('Hz');
%Pole zero Constellations
[bh,ah]=eqtflength(bh,1);
[zh,ph,kh]=tf2zp(bh,ah);
[b1,a1]=eqtflength(b1,1);
[zl,pl,kl]=tf2zp(b1,a1);
figure,
subplot(121),zplane(bh,ah);xlim([-1.5 1.5]);ylim([-1.5 1.5]);
title('Filter One');
subplot(122),zplane(b1,a1);xlim([-1.5 1.5]);ylim([-1.5 1.5]);
title('Filter Two');
