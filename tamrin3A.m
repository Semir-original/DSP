close all;
clear all;
N1=0:1:9;
N2=-250:1:250;
hn=(1-(abs(N1-5)/5));
xn=(10-(abs(N2)/25));

%tarif motagheyr  tamam !
%subplot(211);stem (N1,hn);title('H[n]');xlim([0 10])
%subplot(212);stem(N2,xn);title('X[n]');
%Lconv=conv(hn,xn);
%plot(-255:1:254,Lconv);grid;title('LCONV X,Y');xlim([-255 254]);

fftxn=fft(xn,64);
% fftxn=fftshift(fftxn);
ffthn=fft(hn,64);
% subplot(211);plot(0:63,abs(fftxn));
Fconv=fftxn.*ffthn;
Fconv=ifft(Fconv,64);
plot(-32:1:31,Fconv);