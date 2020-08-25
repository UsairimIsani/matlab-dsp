clear all; close all; clc;

F1 = 10;
F2 = 110;
Fs = 100;
Ts = 1/Fs;
t = [0 : 0.0005 : 0.2];
x1t = cos(2* pi * F1 * t);
x2t = cos(2* pi * F2 * t);

% Figure 1 Continous Signal

figure;
title('Two Sinosuids plotted');
plot(t,x1t,t,x2t,'LineWidth',2);
xlabel('cont time sec');
ylabel('Amplitude');
xlim([0,0.1]);
legend('10Hz','110hz');
grid on;


% Figure 2 of Discrete Graphs

nTs = [0:Ts:0.2];
n = [1:length(nTs)-1];
x1n = cos(2* pi * F1 * nTs);
x2n = cos(2* pi * F2 * nTs);


figure;

% Subplot 1


title('10Hz DTCV (SAMPLED ) Signal plotted');
subplot(2,1, 1); % set third argument to number of the subplot
stem(nTs,x1n,'r','LineWidth',2) % Set Third arg to the color of the line plotted. r -> Red 
xlabel('Discrete time sec');
ylabel('Amplitude');
xlim([0,0.1]);
grid on;

% Subplot 2 

title('110Hz DTCV (SAMPLED ) Signal plotted');
subplot(2,1,2); % set third argument to number of the subplot
stem(nTs,x2n,'b','LineWidth',2); % Set Third arg to the color of the line plotted. b -> Blue
xlabel('Discrete time sec');
ylabel('Amplitude');
xlim([0,0.1]);
grid on;


%% Figure 3 

figure;
plot(t,x1t,t,x2t);
hold
stem(nTs,x1n,'r','LineWidth',2)
% hold
% stem(nTs,x2n,'b','LineWidth',2); % Set Third arg to the color of the line plotted. b -> Blue
xlabel('Discrete time sec');
ylabel('Amplitude');
xlim([0,0.1]);
grid on;
xlabel('Discrete time sec');
ylabel('Amplitude');
xlim([0,0.1]);
grid on;