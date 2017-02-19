function [y] =ma_high(ip2);
int y;
if(ip2 >=5.6 && ip2 <=22.7)
    y=1;
else
    y=0;
end
