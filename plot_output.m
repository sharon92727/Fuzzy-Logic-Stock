function plot_output
figure(2);
%Fuzzy Membership Function for input variable dew point spread%
buy1x=0:1:50;
buy1y=trapmf(buy1x,[-10 0 45 50]);
hold1x=45:1:55;
hold1y=trimf(hold1x,[45 50 55]);
sell1x=50:1:100;
sell1y=trapmf(sell1x,[50 55 100 105]);
subplot(1,1,1);
plot(buy1x,buy1y,'g');
hold on;
plot(hold1x,hold1y,'r');
hold on;
plot(sell1x,sell1y,'y');
hold on;
legend('buy','hold','sell');
title('Fuzzy MF for trading');
xlim('manual')
xlim([0 100]);
ylim([0 1]);
