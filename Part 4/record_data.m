close all; clear all; clc;
fs = 44100;
N = 1000;
time = fs/N;
recObj = audiorecorder(fs, 16, 1);
time = 1;

disp('record e');
recordblocking(recObj, time);
e = getaudiodata(recObj);
disp('end');

disp('record a');
recordblocking(recObj, time);
a = getaudiodata(recObj);
disp('end');

disp('record s');
recordblocking(recObj, time);
s = getaudiodata(recObj);
disp('end');

disp('record t');
recordblocking(recObj, time);
t = getaudiodata(recObj);
disp('end');

disp('record x');
recordblocking(recObj, time);
x = getaudiodata(recObj);
disp('end');

save('voice_recordings.mat');
