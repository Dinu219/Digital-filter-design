Array = readmatrix('world.csv');
time = Array(:, 1);         %number of days(238)
deaths = Array(:, 2);       %number of deaths

Fs = 1;  % Sampling Frequency
N = length(deaths);    %289  Number of FFT points                   

lpFilt = designfilt('lowpassiir','PassbandFrequency',1/21, ...
         'StopbandFrequency',1/19,'PassbandRipple',0.01, ...
         'StopbandAttenuation',40,'DesignMethod','ellip','SampleRate',Fs);

fvtool(lpFilt);

%Fpass = 1/21;        Passband Frequency
%Fstop = 1/19;        Stopband Frequency
%Apass = 0.01;       Passband Ripple (dB)
%Astop = 40;         Stopband Attenuation (dB)

Filtered_deaths = filtfilt(lpFilt, deaths);

figure(1) 
plot(time,deaths, 'LineWidth',1)
hold on; 
title('New daily deaths in the U.S. before and after processing by low pass filter 2') 
plot(time,Filtered_deaths, 'LineWidth',1)
xlabel 'time(days)'; 
ylabel 'daily new deaths'; 
xlim([0 238]);
grid on
hold off; 
legend('Daily deaths','Filtered daily deaths 2 ','Location','best'); 
