function [v,w,nv,nw,Ep,Oo]=taineural(data,nv,nw,v,w,l,m,flag)
n=1;
ne=0.3;
alp=0.5;
Ii(1:l,1)=0;
Ii
Oi(1:l,1)=0;
Oi
[a b]=size(v');
Ih(1:a,1)=0;
Ih
data(:,7:15)
Ii(:,1)=data(:,7:15);
Ii
Oi(:,1)=Ii(:,1);
Oi
v'
Ih(:,1)=v'*Oi(:,1); %
Ih
Oh=tanh(Ih);  
Oh
Io(1:n,1)=0;
Io
Io(:,1)=w'*Oh(:,1);
Io
Oo=tanh(Io);
Oo
Ep=((data(1,15)-Oo)^2)^(1/2); % error at a point = (target value-obtained value)2
d=(data(1,15)-Oo).*Oo.*(1-Oo); % delta
y=Oh*d'; 
nw=alp*nw+ne*y; % new weight
e=w*d; 
dstar=e.*Oh.*(1-Oh); % delta of hidden to output
X=Oi*dstar';
nv=alp*nv+ne*X;
w=w+nw;
v=v+nv;



