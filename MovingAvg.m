Array = readmatrix('world.csv');
time = Array(:, 1); 
deaths = Array(:, 2);

B = 1/7*ones(7,1); % seven day moving average
movfilt = filter(B,1,deaths); % adding the filter
fvtool(B);

figure(1) % Compare output
plot(time, deaths,'LineWidth',1);
hold on; 
title('Filtering using seven day moving average filter') 
plot(time, movfilt, 'LineWidth',1)
xlabel('time - days')
ylabel('Daily new death count')
xlim([0 238]);
grid on;
hold off; 
legend('Daily cases','Moving filter'); 

