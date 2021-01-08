 close all;
 clear all;
 n=0:1:127;
xn=cos(pi*n)+sin(pi/2*n);
X=fft(xn,128);
psd=abs(X)/128;
plot(n/128,psd);
