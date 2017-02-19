function [fs1,fs2]=fuzzy_set(ip1,ip2);

fs1=[0 0 0 0];
fs2=[0 0];

%======================== for RSI ================================
if(rsi_vlow(ip1))
    [fs1(1)] = trapezoid(-10,0,30,35,ip1);
end
if(rsi_low(ip1))
    [fs1(2)] = triangle(30,40,55,ip1);
end

if(rsi_high(ip1))
    [fs1(3)] = triangle(45,60,70,ip1);
end


if(rsi_vhigh(ip1))
    [fs1(4)] = trapezoid(65,70,100,110,ip1);
end

%========================== for MA==============================
if(ma_low(ip2))
    [fs2(1)] = trapezoid(-5,0,5.6,17.03,ip2);
end
if(ma_high(ip2))
    [fs2(2)] = trapezoid(5.6,17.03,22.7,25,ip2);
end
