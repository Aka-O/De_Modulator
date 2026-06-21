clear all;
close all;

f0 = 200;
f1 = 1000;

% convert to ASCII binary
message = 'Roger That';
binaryMessage = reshape(dec2bin(message, 8).', 1, 8 * length(message));
binaryMessage = double(binaryMessage) - '0';

% apply hamming code
binary_stream4 = reshape(binaryMessage, 4, [])';
G = [1 0 0 0 1 1 0; 0 1 0 0 1 0 1; 0 0 1 0 0 1 1; 0 0 0 1 1 1 1];
hammed = mod(binary_stream4 * G, 2);
hammed_vec = reshape(hammed, 1, [])';
hammed_stream = reshape(hammed, 1, []);

% generate modulation signal
% Rb = 50;
% Tb = 1/Rb;
% fs = 10000;
% Ac = 1;
% t = 0:1/fs:Tb;
% signal = [];
% 
% for i = 1:length(hammed_stream)
%     if hammed_stream(i) == 0
%         f = f0;
%     else
%         f = f1;
%     end
%     s = Ac*sin(2*pi*f*t);
%     signal = [signal s];
% end
% 
% num_1 = signal(1:14*length(t));
% 
% grid on
% plot(signal)
% title('First letter')
% xlabel('samples')
% ylabel('Amplitude')
% 
% % sound(signal, fs);
% 
% fm = 1.35e3;
% vff = Ac*cos(2*pi*13500*t + 5*sin(2*pi*fm*t));
% figure
% plot(vff)
% 
