function [y]=triangle (a,b,c,x)
    if x<a || x>c
        y=0
    elseif x>=a && x<b
        y=(x-a)/(b-a);
    elseif x>=b && x<=c
        y=(c-x)/(c-b);
    end