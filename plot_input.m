function plot_input
figure(1);
%Fuzzy Membership Function for input variable RSI%
verylow1x=0:1:35;
low1x=30:1:55;
high1x=45:1:70;
veryhigh1x=65:1:100;
verylow1y=trapmf(verylow1x,[-10 0 30 35]);
low1y=trimf(low1x,[30 40 55]);
high1y=trimf(high1x,[45 60 70]);
veryhigh1y=trapmf(veryhigh1x,[65 70 100 110]);
subplot(2,1,1);
plot(verylow1x,verylow1y,'g');
hold on;
plot(low1x,low1y,'b');
hold on;
plot(high1x,high1y,'r');
hold on;
plot(veryhigh1x,veryhigh1y,'y');
hold on;
legend('verylow','low','high','vryhigh');
title('Fuzzy MF for RSI');
xlim('manual')
xlim([0 100]);
ylim([0 1]);


%Fuzzy Membership Function for input variable MA
low1x=0:1:17.03;
low1y=trapmf(low1x,[-5 0 5.6 17.03]);
high1x=5.6:1:22.7;
high1y=trapmf(high1x,[5.6 17.03 22.7 25]);
subplot(2,1,2);
plot(low1x,low1y,'g');
hold on;
plot(high1x,high1y,'y');
hold on;
legend('Low', 'High');
title('Fuzzy MF for MA');
xlim('manual')
xlim([0 22.7]);
ylim([0 1]);
