Array = readmatrix('world.csv');
time = Array(:, 1);         %number of days(238)
deaths = Array(:, 2);       %number of deaths

Fs = 1;  % Sampling Frequency
hpFilt = designfilt('highpassiir','PassbandFrequency',1/7, ...
         'StopbandFrequency',1/8,'PassbandRipple',0.01, ...
         'StopbandAttenuation',40,'DesignMethod','ellip','SampleRate',Fs);

fvtool(hpFilt);
Filtered_deaths = filtfilt(hpFilt, deaths);

figure(1) 
plot(time,deaths, 'LineWidth',1)
hold on; 
title('New daily deaths in the U.S. before and after processing by high pass filter') 
plot(time,Filtered_deaths, 'LineWidth',1)
xlabel 'time(days)'; 
ylabel 'daily new deaths'; 
grid on
hold off; 
xlim([0 238]);
legend('Daily deaths','Filtered daily deaths','Location','best'); 
