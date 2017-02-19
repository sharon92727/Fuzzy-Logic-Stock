function [y]=trapezoid(a,b,c,d,x)
    if x<a || x>d
        y=0
    elseif x>=a && x<b
        y=(x-a)/(b-a);
    elseif x>=b && x<c
        y=1;
    elseif x>=c && x<=d
        y=(d-x)/(d-c);
    end