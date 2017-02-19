clc;
clear all;
format long;

%loading the dataset

dataset=xlsread('training.xlsx');
[n,m]=size(dataset);
[v,w]=cal(dataset);
