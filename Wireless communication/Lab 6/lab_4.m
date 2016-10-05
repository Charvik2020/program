%ISI and Doppler shift
close all;
clear;
p=[0.1,0.01,0.01,0.001];
tau =[0,1*10^-6,2*10^-6,5*10^-6];
p_t_s=sum(p.*tau)/sum(p);
p_tt_s=sum(p.*(tau.^2))/sum(p);
sigma_tau=(p_tt_s-p_t_s^2)^0.5;
bc=1/(2*sigma_tau);
fc=128*10^6;
ts=10^-8;
v = 500*5/18;
theta=310*pi/180;
c = 3*10^8;
fd=v*cos(theta)*fc/c;
channel =rayleighchan(ts,fd,tau,(db(p)./2)); %rayleigh channel
tx=randsrc(10^5,1,[0,1]); %bpsk transmiter source 
fading_channel=filter(channel,tx);
eyediagram(fading_channel,50);
title (' ISI | Doppler Shift');