%%
clc;close all;clear all;
% Load the audio file
audioFile = '10secs.wav';
% [y, fs] = audioread('oneword.wav');

[y, Fs] = audioread(audioFile);
% Plot the waveform in the time domain
t = (0:length(y) - 1) / Fs;
figure;
subplot(2, 2, 1);
plot(t,y);
title('Original Audio Waveform');
xlabel('Time (s)');
ylabel('Amplitude');

% Objective 2: Effect of LPF filtering in Time Domain
% Design a low-pass filter using Butterworth
fc_lp = 3000; % Cutoff frequency for low-pass filter in Hz
order = 8; % Filter order
[b_lp, a_lp] = butter(order, fc_lp / (Fs / 2), 'low');

% Apply the low-pass filter to the audio using filter

y_lp = filter(b_lp, a_lp, y);

% Plot the filtered waveform in the time domain
subplot(2, 2, 2);
plot( t,y_lp);
title('Low-Pass Filtered Audio');
xlabel('Time (s)');
ylabel('Amplitude');

% Objective 3: Effect of HPF filtering in Time Domain
% Design a high-pass filter using Butterworth
fc_hp = 1000; % Cutoff frequency for high-pass filter in Hz
[b_hp, a_hp] = butter(order, fc_hp / (Fs / 2), 'high');

% Apply the high-pass filter to the audio using filter
y_hp = filter(b_hp, a_hp, y);

% Plot the filtered waveform in the time domain
subplot(2, 2, 3);
plot(t, y_hp);
title('High-Pass Filtered Audio');
xlabel('Time (s)');
ylabel('Amplitude');

% Objective 4: Segregate Voice and Un-voice parts based on frequency

% Design a low-pass filter for voice (below 6000 Hz)
fc_voice = 6000;  fc_unvoiced = 50; % Cutoff frequency for voice in Hz
f_pass=[fc_unvoiced,fc_voice];
[b_voice, a_voice] = butter(5, f_pass / (Fs / 2), 'bandpass');

[b_unvoiced, a_unvoiced] = butter(order, f_pass / (Fs / 2), 'stop');

% Apply the low-pass filter to the audio using filter to isolate voice
y_voice = filter(b_voice, a_voice, y);

% Apply the high-pass filter to the audio using filter to isolate unvoiced
y_unvoiced = filter(b_unvoiced, a_unvoiced, y);

% Plot the filtered voice and unvoiced signals in the time domain
subplot(2, 2, 4);
plot(t, (y_voice));
title('Segregated Voiced Part');
xlabel('Time (s)');
ylabel('Amplitude');



player1=audioplayer(y,Fs);
play(player1);
pause(length(y)/Fs);
player2=audioplayer(y_lp,Fs);
play(player2);    
pause(length(y_lp)/Fs);
player3=audioplayer(y_hp,Fs);
play(player3);
pause(length(y_hp)/Fs);
player4=audioplayer(y_voice,Fs);
play(player4);
pause(length(y_voice)/Fs);
player5=audioplayer(y_unvoiced,Fs);
play(player5);


%%
% Load the audio file
[y, fs] = audioread('10secs.wav');
% [y, fs] = audioread('oneword.wav');



% Compute the FFT (Fast Fourier Transform) of the audio data
Y = fft(y);

% Compute the frequencies corresponding to the FFT result
frequencies = linspace(0, fs, length(Y));

% Take only the positive frequencies for the single-sided spectrum
positive_frequencies = frequencies(1:length(frequencies)/2 + 1);
positive_Y = 2.0/length(Y) * abs(Y(1:length(Y)/2 + 1));

% Plot the single-sided spectrum
subplot(3,1,1);
plot(positive_frequencies, (positive_Y)); % Use log scale for better visualization
title('Single-Sided Spectrum');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
grid on;

% Apply Low Pass Filter (LPF)
cutoff_frequency = 1000; % Adjust the cutoff frequency as needed
order = 4; % Adjust the filter order as needed
[b, a] = butter(order, cutoff_frequency/(fs/2), 'low');
filtered_data_lpf = filter(b, a, y);

% Compute the FFT of the filtered data
filtered_Y_lpf = fft(filtered_data_lpf);

% Take only the positive frequencies for the single-sided spectrum
positive_filtered_Y_lpf = 2.0/length(filtered_Y_lpf) * abs(filtered_Y_lpf(1:length(filtered_Y_lpf)/2 + 1));

% Plot the single-sided spectrum of the filtered output
subplot(3,1,2);
plot(positive_frequencies, (positive_filtered_Y_lpf)); % Use log scale for better visualization
title('Single-Sided Spectrum after LPF');
xlabel('Frequency (Hz)');
ylabel('Amplitude ');
grid on;

% Compute the inverse FFT of the positive frequencies of the filtered signal
filtered_signal_time_domain_lpf = ifft(filtered_Y_lpf);

% High Pass Filter (HPF)
cutoff_frequency_hpf = 1000; % Adjust the cutoff frequency as needed
order = 4; % Adjust the filter order as needed
[b, a] = butter(order, cutoff_frequency_hpf/(fs/2), 'high');
filtered_data_hpf = filter(b, a, y);

% Compute the FFT of the filtered data
filtered_Y_hpf = fft(filtered_data_hpf);

% Take only the positive frequencies for the single-sided spectrum
positive_filtered_Y_hpf = 2.0/length(filtered_Y_hpf) * abs(filtered_Y_hpf(1:length(filtered_Y_hpf)/2 + 1));

% Plot the single-sided spectrum of the filtered output
subplot(3,1,3);
plot(positive_frequencies, (positive_filtered_Y_hpf)); % Use log scale for better visualization
title('Single-Sided Spectrum after HPF');
xlabel('Frequency (Hz)');
ylabel('Amplitude ');
grid on;

% Compute the inverse FFT of the positive frequencies of the filtered signal
filtered_signal_time_domain_hpf = ifft(filtered_Y_hpf);

% BandPass Filter
% Apply BandPass Filter
cutoff_frequency = [100,6000]; % Adjust the cutoff frequency as needed
order = 4; % Adjust the filter order as needed
[b, a] = butter(order, cutoff_frequency/(fs/2), 'bandpass');
filtered_data_voice = filter(b, a, y);

% Compute the FFT of the filtered data
filtered_Y_voice = fft(filtered_data_voice);

% Take only the positive frequencies for the single-sided spectrum
positive_filtered_Y_voice = 2.0/length(filtered_Y_voice) * abs(filtered_Y_voice(1:length(filtered_Y_voice)/2 + 1));

% Compute the inverse FFT of the positive frequencies of the filtered signal
filtered_signal_time_domain_voice = ifft(filtered_Y_voice);

% Plot the spectrum of the BandPass filtered output
figure;
subplot(2,1,1);
plot(positive_frequencies, positive_filtered_Y_voice);
title('Voice segregated Frequencies');
xlabel('Frequency (Hz)');
ylabel('Amplitude');

% BandStop Filter
% Apply BandStop Filter
cutoff_frequency = [100,6000]; % Adjust the cutoff frequency as needed
order = 4; % Adjust the filter order as needed
[b, a] = butter(order, cutoff_frequency/(fs/2), 'stop');
filtered_data_noise = filter(b, a, y);

% Compute the FFT of the filtered data
filtered_Y_noise = fft(filtered_data_noise);

% Take only the positive frequencies for the single-sided spectrum
positive_filtered_Y_noise = 2.0/length(filtered_Y_noise) * abs(filtered_Y_noise(1:length(filtered_Y_noise)/2 + 1));

% Compute the inverse FFT of the positive frequencies of the filtered signal
filtered_signal_time_domain_noise = ifft(filtered_Y_noise);

% Plot the spectrum of the BandStop filtered output
subplot(2,1,2);
plot(positive_frequencies, positive_filtered_Y_noise);
title('Noise Part of Frequencies');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
% Play the original audio
sound(y,fs);
pause(length(y)/fs);

% Play the filtered audio (LPF, HPF, BandPass, BandStop)
sound(filtered_signal_time_domain_lpf, fs);
pause(length(filtered_signal_time_domain_lpf)/fs);
sound(filtered_signal_time_domain_hpf, fs);
pause(length(filtered_signal_time_domain_hpf)/fs);
sound(filtered_signal_time_domain_voice, fs);
pause(length(filtered_signal_time_domain_voice)/fs);
sound(filtered_signal_time_domain_noise, fs);
pause(length(filtered_signal_time_domain_noise)/fs);
