ECG=load('ECG.mat');
ECG1 = ECG.data([1:359874]);
ECG2 = ECG.data([359875:619847]);
ECG3 = ECG.data([619847:end]);
fs = 847;
[RRI_1,f_1] = ECG_to_RRI(ECG1,fs)
[RRI_2,f_2] = ECG_to_RRI(ECG2,fs)
[RRI_3,f_3] = ECG_to_RRI(ECG3,fs)
save('RR1.mat','RRI_1');
save('RR2.mat','RRI_2');
save('RR3.mat','RRI_3');