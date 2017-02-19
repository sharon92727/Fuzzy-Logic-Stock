function [a1,a2]=cal(data)

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
disp('Processing. . . .');

while error>=tol
    
    for k=11:59
         disp(sprintf('CALCULATION FOR %d th TRAINING SET',k));
        [v,w,nv,nw,Ep(k),temp]=neural(data(k,:),nv,nw,v,w,l,m,flag); 
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

%testing
testset=xlsread('testing.xlsx');
[p,q]=size(testset);
p;
q;


dat1(:,1)=testset(:,15);
 
% testset1=normc(testset(:,2:q));
 %testset(:,2:q)=testset1;
 %testset;
 [n,col]=size(testset); 
 
 l=2;
 %m=5;

%Accuracy calculation 
 
tp=0;tn=0;fp=0;fn=0;

for i=11:n
        Ii(1:l,1)=0;
        Oi(1:l,1)=0;
        [a b]=size(v');
        Ih(1:a,1)=0;
        Ii(:,1)=testset(i,14:15)';
        Oi(:,1)=Ii(:,1);
        Ih(:,1)=v'*Oi(:,1);
        Oh=tanh(Ih);
        Io(:,1)=w'*Oh(:,1);
        Oo=tanh(Io);
        Oo;
        testset(i,16)=Oo;
 end    
    
pop=testset(:,15:16);
pop(:,3)=dat1(:,1);


for i=11:1:n
    
    if(pop(i,2)>=0.92 && pop(i,2)<0.98)
        pop(i,4)=1;
        else
        pop(i,4)=2;
    end
    
    if(pop(i,4)==1)
        disp(sprintf('Buy'));
    
        else
            disp(sprintf('Sell'));
     end
end

 
%[popr popc]=size(pop);

tp=0;tn=0;fp=0;fn=0;
for i=1:n
     if(pop(i,3)==1 && pop(i,4)==1 || (pop(i,3)==2 && pop(i,4)==2))
         tp=tp+1;
     end
     if((pop(i,3)==1 && pop(i,4)==2)||(pop(i,3)==2 && pop(i,4)==1))
         tn=tn+1;
     end
     if(pop(i,3)==1 && (pop(i,4)==2 || pop(i,4)==1))
         fp=fp+1;
     end
     if((pop(i,3)==2 || pop(i,3)==1) && pop(i,4)==1)
         fn=fn+1;
     end
end

 Acc = ((tp + tn) / (tp + tn + fp + fn))*100;                                                                                                                                                                                                                                                                                                                                                                                      
 disp('Accuracy:');
 disp(Acc);

 
 
 
 
%data2=xlsread('testing.xlsx');
%count1=0;
%for i=1:5
% if (pop(i,4)== data2(i,5))
 %   count1=count1+1;
%end
%end
%disp(count1);
%disp 'Calculating accuracy'
%acc=(count1/38)*100;
%disp(acc);
