clear all
close all
f1=1/18;
f2=5/128;
fc=50/128;
n=0:1:255;
k=0:500;
w=(pi/500)*k;
%tarif motagheyer

xn=cos(2*pi*f1*n)+cos(2*pi*f2*n);
xc=cos(2*pi*fc*n);
xa=xn.*cos(2*pi*fc*n);
dtftxa = xa * (exp(-1i*pi/500)) .^ (n'*k);
figure;subplot(211);plot(n,xa);title('Xa[n]');xlabel('n');ylabel('xa[n]');


figure;subplot(211);plot(w/pi,abs(dtftxa));title('DTFT Xa[n]');xlabel('n');ylabel('Mag DTFT');
subplot(212);plot(k/500,angle(dtftxa)*180/pi);title('angle DTFT Xa[n]');xlabel('freq in pi unit');ylabel('Phase');
