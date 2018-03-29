clear all; close all; clc;

%Ex 3.3.1
% generate phone number
%phone_number = unidrnd(10, 1, 8)-1
phone_number = [8,9,1,9,6,0,2,5]
% sampling frequency 
f_samp = 32768;
%  sampling time
t_samp = 1/f_samp;
%time duration of each tone
t_tone = 0.25*f_samp;

tone_sig = [];

duration = [];
for temp = 1:172032
    duration(temp) = 5.25*temp/172032;
end

for time_increment = 1:t_tone
    tone_sig(time_increment) = dial_tone_genenrator(0,time_increment/t_tone);
end
for time_increment = t_tone*2:t_tone*3
    tone_sig(time_increment) = dial_tone_genenrator(2,time_increment/t_tone);
end
for time_increment = t_tone*4:t_tone*5
    tone_sig(time_increment) = dial_tone_genenrator(0,time_increment/t_tone);
end

j=1;
for time_increment = 6:2:20
    digit = phone_number(j);
    for time_increment = t_tone*time_increment:t_tone*(time_increment+1)
        tone_sig(time_increment) = dial_tone_genenrator(digit,time_increment/t_tone);
    end 
    j=j+1;
end

figure;
set(gcf,'Color','w')
subplot(3,1,1)
plot(duration, tone_sig)
number_s = sprintf('%d', phone_number);
regexprep(number_s,'\W','');
str = sprintf('Dialled', number_s);
title(str);
hold on;
%title('Representation of the Dial Tone Signal for different time ranges')
xlabel('Time (s)')
ylabel('Signal apmitude')
axis([0 5.5 -2 2])
subplot(3,1,2)
plot(duration, tone_sig)
xlabel('Time (s)')
ylabel('Signal apmitude')
axis([0.1 0.11 -2 2])
subplot(3,1,3)
plot(duration, tone_sig)
xlabel('Time (s)')
ylabel('Signal apmitude')
axis([0.5 0.51 -2 2])

%Ex 3.4.2
Nx = length(tone_sig);
nsc = floor(Nx/21);
nov = 0;
figure;
%set(gcf,'Color','w')
%spectrogram(tone_sig, 8192, 0, 8192, 32768,'yaxis');
spectrogram(tone_sig,hamming(nsc),nov,32768,'yaxis');
ylim([0 0.15])
title('Spectrogram for the dial tone signal')

%Part 3.3.4
%generate noise same length as signal
noise = randn(1,172032);
figure(3)
low_noise_dialtone = tone_sig + 0.2*noise;
subplot(1,3,1)
%set(gcf,'Color','w');
spectrogram(low_noise_dialtone,hamming(nsc),nov,32768,'yaxis');
ylim([0 0.15])
title('Spectrogram with low noise(0.2X)')

medium_noise_dialtone = tone_sig + noise;
subplot(1,3,2)
spectrogram(medium_noise_dialtone,hamming(nsc),nov,32768,'yaxis');
ylim([0 0.15])
title('Spectrogram with medium noise(1X)')

high_noise_dialtone = tone_sig + 3*noise;
subplot(1,3,3)
spectrogram(high_noise_dialtone,hamming(nsc),nov,32768,'yaxis');
ylim([0 0.15])
title('Spectrogram with high noise(3X)')

figure(4)
set(gcf,'Color','w')
subplot (3,1,1)
plot(duration, low_noise_dialtone)
title('Dial Tone Signal with low, medium and high noise')
xlabel('Time (s)')
ylabel('Signal amplitude')
axis([0.5 0.51 -5 5])
subplot (3,1,2)
plot(duration, medium_noise_dialtone)
xlabel('Time (s)')
ylabel('Signal amplitude')
axis([0.5 0.51 -5 5])
subplot (3,1,3)
plot(duration, high_noise_dialtone)
xlabel('Time (s)')
ylabel('Signal amplitude')
axis([0.5 0.51 -10 10])
