clc;
clear all;
format long;

%loading the dataset

dataset=xlsread('taiwandata.xlsx');
[n,m]=size(dataset);
[v,w]=taiwancal(dataset);
