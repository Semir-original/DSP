clear all
close all
f1=1/18;
f2=5/128;
fc=50/128;
n=0:1:255;
%tarif motagheyer
xn=cos(2*pi*f1*n)+cos(2*pi*f2*n);
xc=cos(2*pi*fc*n);
xa=xn.*cos(2*pi*fc*n);
subplot(211);plot(n,xn);title('X[n]');xlabel('n');ylabel('x[n]');
subplot(212);stem(n,xn);
% new figure Xc
figure;subplot(211);plot(n,xc);title('Xc[n]');xlabel('n');ylabel('xc[n]');
subplot(212);stem(n,xc);
%new figure Xa
figure;subplot(211);plot(n,xa);title('Xa[n]');xlabel('n');ylabel('xa[n]');
subplot(212);stem(n,xa);