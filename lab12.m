clear all;
close all;
clc;
file_name_read = "BM17040_ORIGINAL.wav";
file_name_write = "BM17040_FILTERED.wav";
[data Fs] = audioread(file_name_read);

Fn = Fs/2;                                              % Nyquist Frequency (Hz)
Wp = 1150/Fn;                                           % Passband Frequency (Normalised)
Ws = 1200/Fn;                                           % Stopband Frequency (Normalised)
Rp = 1;                                               % Passband Ripple (dB)
Rs = 50;                                               % Stopband Ripple (dB)
[n,Ws] = cheb2ord(Wp,Ws,Rp,Rs);                         % Filter Order
[z,p,k] = cheby2(n,Rs,Ws,'high');                        % Filter Design
[soslp,glp] = zp2sos(z,p,k);                            % Convert To Second-Order-Section For Stability
figure
freqz(soslp, 2^16, Fs);                                  % Filter Bode Plot
filtered_sound = filtfilt(soslp, glp, data);
audiowrite(file_name_write,filtered_sound,Fs);
sound(filtered_sound, Fs)   