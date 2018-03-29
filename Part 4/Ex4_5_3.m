close all ; clear all; clc;
load voice_recordings.mat; 
%change the sampling rate to 16000Hz
[P,Q] = rat(16000/fs);
e_new = resample(e,P,Q);
a_new = resample(a,P,Q);
s_new = resample(s,P,Q);
t_new = resample(t,P,Q);
x_new = resample(x,P,Q);
u=5; %adaptation gain
offset = 1.1e4;
e_new = e_new(offset:offset+1000);
offset = 1.38e4;
a_new = a_new(offset:offset+1000);
offset = 1.27e4;
s_new = s_new(offset:offset+1000);
offset = 1.09e4;
t_new = t_new(offset:offset+1000);
offset = 1.45e4;
x_new = x_new(offset:offset+1000);
R=[];R1=[];R2=[];R3=[];R4=[];
for p=[1:1:30]
    [ y, ap, error ] = arlms( e_new', u, p ); 
    temp = prediction_gain(e,error);
    R = [R, temp];
    [ y, ap, error ] = arlms( a_new', u, p ); 
    temp = prediction_gain(a,error);
    R1 = [R1, temp];
    [ y, ap, error ] = arlms( s_new', u, p ); 
    temp = prediction_gain(a,error);
    R2 = [R2, temp];
    [ y, ap, error ] = arlms( t_new', u, p ); 
    temp = prediction_gain(a,error);
    R3 = [R3, temp];
    [ y, ap, error ] = arlms( x_new', u, p ); 
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
title('Prediction gain versus filter order with fs = 16000Hz')
xlabel('Order')
ylabel('Prediction gain')
legend('e', 'a','s','t','x')