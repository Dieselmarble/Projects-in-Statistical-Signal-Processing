close all; clear all; clc;
load('sunspot.dat')
sunspotdata = sunspot(:, 2);
data = sunspotdata - mean(sunspotdata);

N = 50;
temp = data(1:N);   
m2 = ar(temp,2,'ls');
m2.A = -[-1, m2.A(2) m2.A(3)];
compare(temp,m2,50)