%  BM17050

clear all;
close all;
clc;
file_name = "bm17045.wav";
file_name_w = "bm17045_FILTERED.wav";
[y Fs] = audioread(file_name);

t = 0:1/Fs:length(y)/Fs-1/Fs;

% freq domain
N = length(y);
K = 0:N-1;
f = K*Fs/N;

% filter
% Hammad
freqRange = [300 600]*2/Fs;
% Ubadah
% freqRange = [500 1000]*2/Fs;

b = fir1(64, freqRange);
a = 1;
[h, w] = freqz(b, a, length(t), "whole"); % freq response of the filter

yFiltered = filtfilt(b,a, y);

% fft of filtered signal
yRespFFT = fft(yFiltered);
figure
subplot(5,1,1);
plot(t,y);
title("Original signal");
xlabel("Time (sec)");
ylabel("Amplitude");

subplot(5,1,2);
plot(f, abs(fft(y)));
title("FFT of original signal")
xlabel("Frequency (Hz)");
xlim([0 Fs/2]);
ylabel("Amplitude");

subplot(5,1,3)
plot(f, abs(h));
xlim([0 Fs/2]);
title("Filter response");
xlabel("Frequency (Hz)");
ylabel("Amplitude");

subplot(5,1,4)
plot(f, abs(yRespFFT));
xlim([0 Fs/2]);
title("FFT of the Filtered signal");
xlabel("Frequency (Hz)");
ylabel("Amplitude");

subplot(5,1,5);
plot(t, yFiltered);
title("Filtered signal");
xlabel("Time (sec)");
ylabel("Amplitude");

audiowrite(file_name_w, yFiltered, Fs);
sound(yFiltered, Fs)    