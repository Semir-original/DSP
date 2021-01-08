clear all;
close all;
m=4;
n=0:1:127;
xn=cos(n*pi/11);
Downxn=downsample(xn,m);
%w=-pi:2*pi/(length(n)-1):pi;
%figure;subplot(211);plot(n,xn);xlabel('n');ylabel('amp');title('X[n]');
%subplot(212);stem(n,xn);
%figure;subplot(211);plot([0:1:(length(n)/m)-1],Downxn);xlabel('n');ylabel('amp');title('X[n] Downsampled');
%subplot(212);stem([0:1:(length(n)/m)-1],Downxn);
%fftxn=fftshift(fft(xn),128);
fftxn=fft(xn,128);
fftDxn=fft(Downxn,128);
figure;subplot(211);plot(0:127,abs(fftxn)/128);title('DFT Xa[n]');xlabel('n');ylabel('Mag DFT');
subplot(212);stem(n,abs(fftxn)/128);

figure;subplot(211);plot(0:127,abs(fftDxn)/128);title('DFT Down sampled Xa[n]');xlabel('n');ylabel('Mag DFT');
subplot(212);stem(n,abs(fftDxn)/128);