clear all
close all
f1=1/18;
f2=5/128;
fc=50/128;
n=0:1:128;
%tarif motagheyer
xn=cos(2*pi*f1*n)+cos(2*pi*f2*n);
xc=cos(2*pi*fc*n);
xa=xn.*cos(2*pi*fc*n);
xa(100:1:end)=0;
figure;subplot(211);plot(n,xa);title('Xa[n]');xlabel('n');ylabel('xa[n]');
subplot(212);stem(n,xa);

%Fxa=fftshift(fft(xa,128));
Fxa=fft(xa,128);


figure;subplot(211);plot(0:127,abs(Fxa)/128);title('FFT Xa[n]');xlabel('n');ylabel('Mag fft');
subplot(212);stem(0:127,abs(Fxa)/128);

figure;subplot(211);plot(0:127,angle(Fxa)*180/pi);title('angle Xa[n]');xlabel('n');ylabel('Phase');
subplot(212);stem(0:127,angle(Fxa)*180/pi);ylim auto;
