% BM17040 Muhammad Usairim Isani
% Assignment
% Record Your Voice at home while turn any motor (Used Padestal Fan) of your house ON.
% Remove sound of motor from recorded signal.
% Generate Audio File(s).
% Listen to the output signal.

clear all;
close all;
clc;

% Reading Audio File

% Original File to Read 

file_name_read = "BM17040_ORIGINAL.wav";

% Filtered Files to Write 

file_name_write_pass_one = "BM17040_FILTERED_1.wav";

% file_name_write_pass_two = "BM17040_FILTERED_2.wav";

% Data after Reading File

[data Fs] = audioread(file_name_read); % Fs -> Sampling Rate, data -> Audio Signal 

% Plotting original Signal

t = 0:1/Fs:length(data)/Fs-1/Fs; % The x-axis is time.

figure
subplot(4,1,1);
plot(t,data);
title("Original signal");
xlabel("Time (sec)");
ylabel("Amplitude");


% Do spectral Analysis of signal to find unwanted frequencies

% Frequencies present

freq_resp = fft(data);
mag_freq_resp = abs(freq_resp);

% Calculation the x-axis for signal frequency spectrum  

f = Fs*[0:length(t)-1]/length(t);

% Plotting frequency response

subplot(4,1,2);
plot(f,mag_freq_resp);
title("Frequency Response of Signal");
xlabel("Frequency in Hz");
ylabel("Amplitude");

% After Analysis of my signal i have found that frequencies starting from 590 to 2600 hz are of my voice indicated in blue.


% Designing filter to remove unwanted frequencies

Fn = Fs/2;                                             % Nyquist Frequency (Hz)
Wp = 900/Fn;                                           % Passband Frequency (Normalised)
Ws = 1800/Fn;                                          % Stopband Frequency (Normalised)
Rp = 1;                                                % Passband Ripple (dB)
Rs = 15;                                               % Stopband Ripple (dB)
[n,Ws] = cheb2ord(Wp,Ws,Rp,Rs);                        % Filter Order
[z,p,k] = cheby2(n,Rs,Ws,'high');                      % Filter Design
[soslp,glp] = zp2sos(z,p,k);                           % Convert To Second-Order-Section For Stability
figure(2)
freqz(soslp, 2^16, Fs);                                % Filter Bode Plot
filtered_sound = filtfilt(soslp, glp, data);

% Tried Using a low pass filter to remove staticish noise.

% Fn = Fs/2;                                             % Nyquist Frequency (Hz)
% Wp = 4/Fn;                                           % Passband Frequency (Normalised)
% Ws = 5000/Fn;                                          % Stopband Frequency (Normalised)
% Rp = 1;                                                % Passband Ripple (dB)
% Rs = 15;                                               % Stopband Ripple (dB)
% [n,Ws] = cheb2ord(Wp,Ws,Rp,Rs);                        % Filter Order
% [z,p,k] = cheby2(n,Rs,Ws,'low');                      % Filter Design
% [soslp,glp] = zp2sos(z,p,k);                           % Convert To Second-Order-Section For Stability
% figure(2)
% freqz(soslp, 2^16, Fs);                                % Filter Bode Plot
% filtered_sound = filtfilt(soslp, glp, filtered_sound);



% Plotting Filtered Signal

figure(1)
subplot(4,1,3);
plot(t,filtered_sound);
title("Filtered signal");
xlabel("Time (sec)");
ylabel("Amplitude");

% Poltting the Frequency response of filtered Signal

figure(1)
subplot(4,1,4)
plot(f,abs(fft(filtered_sound)));
title("Frequency Response of Filtered Signal");
xlabel("Frequency in Hz");
ylabel("Amplitude");

% Writing WAV file of Filtered sound.

audiowrite(file_name_write_pass_one,filtered_sound,Fs);

% Playing the the Filtered Signal

sound(filtered_sound, Fs)  

