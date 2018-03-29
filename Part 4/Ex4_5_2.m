close all ; clear all; clc;
load voice_recordings.mat;             
u=5; %adaptation gain

offset = 3.5e4;
e = e(offset:offset+1000);
offset = 3.8e4;
a = a(offset:offset+1000);
offset = 3.5e4;
s = s(offset:offset+1000);
offset = 3e4;
t = t(offset:offset+1000);
offset = 4e4;
x = x(offset:offset+1000);
R=[];R1=[];R2=[];R3=[];R4=[];
for p=[1:1:30]
    [ y, ap, error ] = arlms( e', u, p ); 
    temp = prediction_gain(e,error);
    R = [R, temp];
    [ y, ap, error ] = arlms( a', u, p ); 
    temp = prediction_gain(a,error);
    R1 = [R1, temp];
    [ y, ap, error ] = arlms( s', u, p ); 
    temp = prediction_gain(a,error);
    R2 = [R2, temp];
    [ y, ap, error ] = arlms( t', u, p ); 
    temp = prediction_gain(a,error);
    R3 = [R3, temp];
    [ y, ap, error ] = arlms( x', u, p ); 
    temp = prediction_gain(a,error);
    R4 = [R4, temp];
end
hold on
plot(R,'LineWidth',2)
plot(R1,'LineWidth',2)
plot(R2,'LineWidth',2)
plot(R3,'LineWidth',2)
plot(R4,'LineWidth',2)
hold off
title('Prediction gain versus filter order')
xlabel('Order')
ylabel('Prediction gain')
legend('e', 'a','s','t','x')