function [y] =rsi_low(ip1);
int y;
if(ip1 >=30 && ip1 <=55)
    y=1;
else
    y=0;
end
