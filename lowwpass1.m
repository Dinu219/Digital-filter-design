Array = readmatrix('world.csv');
time = Array(:, 1);         %number of days(238)
deaths = Array(:, 2);       %number of deaths

Fs = 1;  % Sampling Frequency          

lpFilt = designfilt('lowpassiir','PassbandFrequency',1/9, ...freq constraints
         'StopbandFrequency',1/8,...
         'PassbandRipple',0.01, ... % Magnitude constraints
         'StopbandAttenuation',40,...
         'DesignMethod','ellip','SampleRate',Fs);

fvtool(lpFilt);
Filtered_deaths = filtfilt(lpFilt, deaths); 

figure(1) 
plot(time,deaths, 'LineWidth',1)
hold on; 
title('New daily deaths in the U.S. before and after processing by low pass filter 1') 
plot(time,Filtered_deaths, 'LineWidth',1)
xlabel 'time(days)'; 
ylabel 'daily new deaths';
xlim([0 238]);
grid on
hold off; 
legend('Daily deaths','Filtered daily deaths','Location','best'); 
