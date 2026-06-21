clc;
close all;
clear all;

A = 0.5;
fc =  1350;  % Task number  3.5
B = 5;
fm = 135;

fs = 10*1350;  % 10fc
t = 0:1/fs:5;  % Time vector for 10 ms duration
Vff = A * cos(2 * pi * fc * t + B * sin(2 * pi * fm * t));  % Modulated signal
Vm = sin(2*pi*fm*t);

%% Message Vs time
figure
plot(t, Vm);
xlabel('Time(s)');
ylabel('Amplitude');
title('Message Signal');
grid on;

%% Vff Vs Time
figure
plot(t, Vff);
xlabel('Time(s)');
ylabel('Amplitude');
title('FM Signal');
grid on;


%% Vff Vs sample
n = 0:length(Vff) - 1;

figure
plot(n, Vff);
xlabel('Time(s)');
ylabel('Amplitude');
title('FM Signal');
grid on;

%% Mag spectrum
N = length(Vff);
V = fft(Vff);
f = (0:N-1)*(fs/N);

figure;
plot(f, abs(V));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Magnitude Spectrum of FM Signal');
grid on;

sound(Vff, fs)