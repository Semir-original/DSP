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
t=ovrlpsav(xn,hn,64);
plot(t)
function [y] = ovrlpsav(x,h,N)
% Overlap-Save method of block convolution
% ----------------------------------------
% [y] = ovrlpsav(x,h,N)
% y = output sequence
% x = input sequence
% h = impulse response
% N = block length
%
Lenx = length(x); M = length(h); M1 = M-1; L = N-M1;
h = [h zeros(1,N-M)];
%
x = [zeros(1,M1), x, zeros(1,N-1)]; % preappend (M-1) zeros
K = floor((Lenx+M1-1)/(L)); % # of blocks
Y = zeros(K+1,N);
% convolution with succesive blocks
for k=0:K
xk = x(k*L+1:k*L+N);
Y(k+1,:) = cconv(xk,h,N);
end
Y = Y(:,M:N)'; % discard the first (M-1) samples
y = (Y(:))'; % assemble output
end

