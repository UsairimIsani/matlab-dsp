% Assignment
% Record Your Voice at home while turn any motor (Used Padestal Fan) of your house ON.
% Remove sound of motor from recorded signal.
% Generate Audio File(s).
% Listen to the output signal.
clear all;
close all;
clc;
file_name_read = "BM17040_ORIGINAL.wav";
file_name_write_pass_one = "BM17040_FILTERED_1.wav";
file_name_write_pass_two = "BM17040_FILTERED_2.wav";
[data Fs] = audioread(file_name_read);

% Passing Through IIR First

Fn = Fs/2;                                              % Nyquist Frequency (Hz)
Wp = 800/Fn;                                           % Passband Frequency (Normalised)
Ws = 890/Fn;                                           % Stopband Frequency (Normalised)
Rp = 1;                                                 % Passband Ripple (dB)
Rs = 50;                                                % Stopband Ripple (dB)
[n,Ws] = cheb2ord(Wp,Ws,Rp,Rs);                         % Filter Order
[z,p,k] = cheby2(n,Rs,Ws,'high');                       % Filter Design, z -> Zeros ,p -> Poles, k -> Gain Scalar
[soslp,glp] = zp2sos(z,p,k);                            % Convert To Second-Order-Section For Stability
figure
freqz(soslp, 2^16, Fs);                                  % Filter Bode Plot
filtered_sound = filtfilt(soslp, glp, data);
audiowrite(file_name_write_pass_one,filtered_sound,Fs);
% sound(filtered_sound)
% Passing the IIR filtered signal through FIR 
% y = filtered_sound; 
y = data;
t = 0:1/Fs:length(y)/Fs-1/Fs;

% freq domain
N = length(y);
K = 0:N-1;
f = K*Fs/N;

% filter
freqRange = [800 2600]*2/Fs;

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

audiowrite(file_name_write_pass_two, yFiltered, Fs);
sound(yFiltered, Fs)    