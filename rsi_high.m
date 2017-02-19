function [y] =rsi_high(ip1);
int y;
if(ip1 >=45 && ip1 <=70)
    y=1;
else
    y=0;
end
