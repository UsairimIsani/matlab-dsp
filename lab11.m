% Filters
% discrimminates what signal pass through it
% FIR and IIR Filters
% N => Filter order
% Wn => Edge frequency
% Rp => Passband peak to peak ripples in dB
% Rs => stopband peak to peak ripples in dB
% b,a => filter coefficients of length N + 1, 
% vector 'b' gives numerator and vector 'a' gives denominator values in descending power of z.
% These functions gives the filter coefficients b and a. 
% After obtaining the filter coefficients filter response can be obtained using 'freqz' function.

% [b,a] = butter(N,Wn);
% [b,a] = cheby1(N,Rp,Wp);
% [b,a] = cheby2(N,Rs,Ws);
% [b,a] = ellip(N,Rp,Rs,Wp);
clear all;
close all;
clc;

%  Frequency in Hz

F1 = 100;
F2 = 150;

% Sampling frequency

Fs = 1000;

% Time Vector

t = [0:1/Fs:1]; 

% Frequncy Vector

F = Fs*[0:length(t)-1]/length(t);

% Signal  

x = exp(j * 2 * pi * F1 * t) + 2 * exp(j * 2 * pi * F2 * t);

% Filter Coefficients

[bh,ah] = fir1(64,[125 175]/500); 
[bl,al] = fir1(64,[75 125]/500);

% Frequncy 

[hh,wh] = freqz(bh,1,length(t),"whole");
[hl,wl] = freqz(bl,1,length(t),"whole");

% Filter operation 

yh = filtfilt(bh,1,x);
yl = filtfilt(bl,1,x);

% Plotting

figure,
subplot(5,1,1),plot(F,abs(fft(x)));xlim([0 Fs/2]);
title("FFT of original Signal");
subplot(5,1,2),plot(F,abs(hh));xlim([0 Fs/2]);
title("Frequency Response of Filter One");
subplot(5,1,3),plot(F,abs(fft(yh)));xlim([0 Fs/2]);
title("FFT of Filtered Signal from filter one");
subplot(5,1,4),plot(F,abs(hl));xlim([0 Fs/2]);
title("Frequency Response of Fitler Two");
subplot(5,1,5),plot(F,abs(fft(yl)));xlim([0 Fs/2]);
title("FFT of Filtered Signal from filter one");
xlabel("Hz");

%  Pole zero constellation

[bh,ah] = eqtflength(bh,1);
[zh,ph,kh] = tf2zp(bh,ah);
[bl,al] = eqtflength(bl,1);
[zh,ph,kh] = tf2zp(bl,ah);

% Plotting
figure,
subplot(1,2,1),zplane(bh,ah);xlim([-1.5 1.5]);ylim([-1.5 1.5]);
title("Filter One");
subplot(1,2,2),zplane(bl,al);xlim([-1.5 1.5]);ylim([-1.5 1.5]);
title("Filter Two");





pause