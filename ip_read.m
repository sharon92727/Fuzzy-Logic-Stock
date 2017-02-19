clc
clear
node=xlsread('findataset.xlsx');
[r c]=size(node);
for i=11:r
    a=node(i,13);
    b=node(i,14);
    disp('Dataset Number: ');
    disp(i);
    stock_prediction(a,b,i);
end