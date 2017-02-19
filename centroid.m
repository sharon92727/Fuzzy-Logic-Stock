function centroid(support,mf)
total_area = sum(mf);
    value = sum(mf.*support)/total_area
    
    if value < 45
        disp ('Buy')
    elseif( value > 45 && value < 55 )
        disp('hold')
    else
        disp('Sell')
    end
end