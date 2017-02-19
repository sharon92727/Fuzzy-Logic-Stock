function stock_prediction(ip1,ip2,datasetnum)
%disp('the inputs are:');

plot_input();
plot_output();


[fs1,fs2]=fuzzy_set(ip1,ip2);


rules=xlsread('rules.xlsx');
rs=8;
m_min=zeros(8,1);
for i=1:rs
    a=fs1(rules(i,1));
    b=fs2(rules(i,2));
    c=rules(i,3);
    m_min(i)= min(a,b);
end


   [maxval ind]= max(m_min);
   
   c = rules(ind,3);
   
  % xlswrite('findataset.xlsx',c , 'Sheet1',  strcat('P',num2str(datasetnum)))
   if c == 1
        disp ('Buy')
    elseif( c == 2 )
        disp('hold')
    else
        disp('Sell')
    end

   


