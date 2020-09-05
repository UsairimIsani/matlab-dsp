clear all;
close all;
clc;
file_name_read = "BM17040_ORIGINAL.wav";
file_name_write = "BM17040_FILTERED.wav";
[data Fs] = audioread(file_name_read);

Fn = Fs/2;                                              % Nyquist Frequency (Hz)
Wp = 850/Fn;                                           % Passband Frequency (Normalised)
Ws = 890/Fn;                                           % Stopband Frequency (Normalised)
Rp = 1;                                                 % Passband Ripple (dB)
Rs = 50;                                                % Stopband Ripple (dB)
[n,Ws] = cheb2ord(Wp,Ws,Rp,Rs);                         % Filter Order
[z,p,k] = cheby2(n,Rs,Ws,'high');                       % Filter Design, z -> Zeros ,p -> Poles, k -> Gain Scalar
[soslp,glp] = zp2sos(z,p,k);                            % Convert To Second-Order-Section For Stability
figure
freqz(soslp, 2^16, Fs);                                  % Filter Bode Plot
filtered_sound = filtfilt(soslp, glp, data);
audiowrite(file_name_write,filtered_sound,Fs);
% sound(filtered_sound, Fs)   

% EXERCISE:
% Record Your Voice at home while turn any motor of your house ON.
% Design a filter using FDA Tool.
% Remove sound of motor from recorded signal.
% Listen the output signal.
% close all;
% clear all;
% clc;

% filename = "BM17040_ORIGINAL.wav";
% returns sampling rate and amplitudes
% [y, Fs] = audioread(filename);
% plotting audio signal
y = filtered_sound; % Passing through two filters
t = 0:1/Fs:length(y)/Fs-1/Fs;

% freq domain
N = length(y);
K = 0:N-1;
f = K*Fs/N;

% filter
freqRange = [2350 2390]*2/Fs;
% freqRange = [10 200]*2/Fs;

% [b, a] = butter(6, freqRange, "stop"); % order of low filter is 6    
b = fir1(64, freqRange);
a = 1;
[h, w] = freqz(b, a, length(t), "whole"); % freq response of the filter

yFiltered = filtfilt(b,a, y);
% fft of filtered signal
yRespFFT = fft(yFiltered);

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

sound(yFiltered, Fs)
audiowrite("BM17040_FILTERED_2.wav", yFiltered, Fs);