Array = readmatrix('world.csv');
time = Array(:, 1);         %number of days(238)
deaths = Array(:, 2);       %number of deaths

Fs = 1;  % Sampling Frequency
N = length(deaths);    %289  Number of FFT points                   

bpFilt = designfilt('bandpassiir', 'StopbandFrequency1', 1/21, ...% Frequency constraints
                    'PassbandFrequency1', 1/19, ...
                    'PassbandFrequency2', 1/9, ...
                    'StopbandFrequency2', 1/8, ...
                    'StopbandAttenuation1', 40, ...   % Magnitude constraints
                    'PassbandRipple', 0.01, ...
                    'StopbandAttenuation2', 40, ...
                    'SampleRate', Fs, ...              % Design method
                    'DesignMethod', 'ellip');

fvtool(bpFilt);
Filtered_deaths = filtfilt(bpFilt, deaths);

figure(1) 
plot(time,deaths, 'LineWidth',1)
hold on; 
title('New daily deaths in the U.S. before and after processing by bandpass filter') 
plot(time,Filtered_deaths, 'LineWidth',1)
xlabel 'time(days)'; 
ylabel 'daily new deaths'; 
grid on
hold off;
xlim([0 238]);
legend('Daily deaths','Filtered daily deaths','Location','best'); 

