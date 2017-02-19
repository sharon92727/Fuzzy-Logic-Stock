function defuzzify(m_min,rules)
k=0;
outx=0:1:100;
s=size(outx,2);
rs=3;


vwx=0:1:50;
wx=45:1:55;
lwx=50:1:100;

%==========================================================================
% y co-ordinates of output membership function
vwy=trapmf(vwx,[-10 0 15 30]);
wy=trimf(wx,[15 30 45]); 
lwy=trapmf(lwx,[30 45 55 70]);



%==========================================================================
% computing y co-ordinates for aggregated graph

o_vwy=zeros(1,s);
o_wy=zeros(1,s);
 o_lwy=zeros(1,s);


for i=1:rs
    if(m_min(i)>0)
        if(rules(i,2)==1)
           range1=0;
           for r1=1:s
               if(outx(r1)==vwx(1))
                  range1=r1;
                  break;
               end
           end
        
           range1=1;
           for j=1:size(vwy,2)
                   if(vwy(j)<=m_min(i))
                        o_vwy(range1)=vwy(j);
                    else
                        o_vwy(range1)=m_min(i);
                    end
                range1=range1+1;    
            end
        end
        
        if(rules(i,2)==2)

           range1=45;
            for j=1:size(wy,2)
                    if(wy(j)<=m_min(i))
                        o_wy(range1)=wy(j);
                    else
                        o_wy(range1)=m_min(i);
                    end
                range1=range1+1;
            end
        end
        
        if(rules(i,2)==3)
            range1=0;
            for r1=1:s
               if(outx(r1)==lwx(1))
                  range1=r1;
                  break;
               end
            end
           
            range1=70;
            for j=1:size(lwy,2)
                    if(lwy(j)<=m_min(i))
                        o_lwy(range1)=lwy(j);
                    else
                        o_lwy(range1)=m_min(i);
                    end
                    range1=range1+1;
            end
        end
        
        
            
       
        
    end
    
end

mat=[o_vwy;o_wy;o_lwy];

for i=1:size(mat,2)
    agg_value(i)=max(mat(:,i));
end

figure(3);
x=0:1:100;
plot(x,agg_value,'blue');
xlim([0 100]);
ylim([0 1.5]);

hold on;
%================================================================
% defuzzification using center of gravity

centroid(outx,agg_value);

