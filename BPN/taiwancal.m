function [a1,a2]=taiwancal(data)

disp('ASSUME ETA = 0.9 ');
disp('TOLERANCE VALUE = 0.5');

[nset l]=size(data);
l=2;
n=1;        
tol=0.5;
error=Inf;
a=-1;b=1;
m=5;
v=rand(2,2);
v
w=rand(2,1);
w
a1=v;
a2=w;
flag=0;
nv=zeros(2,2);
nw=zeros(2,1);
epochs=0;
disp('');
disp('Processing............');

while error>=tol
    
    for k=11:59
         disp(sprintf('CALCULATION FOR %d TRAINING SET',k));
        [v,w,nv,nw,Ep(k),temp]=taineural(data(k,:),nv,nw,v,w,l,m,flag); 
    end

    sum_error=sum(Ep);
       
    error=sum_error/nset;
    error;
    epochs=epochs+1;
    
end

disp(sprintf('Number of epochs: %d',epochs));

disp('FINAL WEIGHTS:');

v
w

for i=11:59
%         Ii(1:l,1)=0;
%         Oi(1:l,1)=0;
%         [a b]=size(v');
%         Ih(1:a,1)=0;
        Ii(:,1)=data(i,12:13)';
        Oi(:,1)=Ii(:,1);
        Ih(:,1)=v'*Oi(:,1);
        Oh=sigmf(Ih,[1 0]);
        Io(:,1)=w'*Oh(:,1);
        Oo=sigmf(Io,[1 0]);
        Oo
%         if(Oo<0.4)              
%             disp ' Stock can be Bought';
%         end
%         if(Oo>0.4 && Oo<0.5)
%             disp ' Stock is on Hold';
%         end
%             if(Oo>0.5)
%             disp ' Stock can be Sold';
%             end
        count=xlsread('test.xlsx');
        size_excel=size(count,1);
        size_excel=size_excel+1;
        b=num2str(size_excel);
        c=strcat('A',b);
        %xlswrite('god.xlsx',Oo,1,c);

        if(Oo>0.8)
            xlswrite('test.xlsx',-1,1,c);
        end
        if(Oo<0.2)
            xlswrite('test.xlsx',1,1,c);
        end
        if(Oo>0.2 && Oo<0.8)
            xlswrite('test.xlsx',0,1,c);
        end
end
data1=xlsread('taiwandata.xlsx');
%data2=xlsread('test.xlsx');
%count1=0;
%for i=1:150
 %if (data1(i,17)== data2(i,1))
  %  count1=count1+1;
%end
%end
%disp(count1);
%disp 'Calculating accuracy'
%acc=(count1/150)*100;
%disp(acc);
end