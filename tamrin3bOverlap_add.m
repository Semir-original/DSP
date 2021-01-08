
clc 
clear all
N1=0:1:9;
N2=-250:1:250;
hn=(1-(abs(N1-5)/5));
xn=(10-(abs(N2)/25));
%Vetor Entrada, representando a entrada
Entrada = xn;

%Vetor H representando a resposta
H = hn; 

%Tamanho da resposta da convolução
N = size(Entrada,2) +size(H,2) - 1;

%Vetor da resposta da convolucao
Resposta = zeros(1,N);

%Fator de repartição do Overlapp
DivisaoOverlap= 2;
%%
%Preenchimento com zeros da entrada e da resposta

    Entradazeros = zeros(N,1);
   for contador = 1:size(Entrada,2)
        Entradazeros(contador) = Entrada(contador);
   end
   Entrada=Entradazeros;

   Hzero = zeros(N,1);
   for contador = 1:size(H,2)
        Hzero(contador) = H(contador);
   end
   H=Hzero;

   
%%Overlap Add   

%Convolucao Circular
    for indice = 1:N
        for  cont = 1:N
                Resposta(1,indice) = Entrada(cont,1)*H(mod(N+indice-cont,N)+1)+Resposta(1,indice);
        end
    end

for indice = 1:DivisaoOverlap -1
    Resposta(1,floor(N*indice/DivisaoOverlap)) = 2*Resposta(1,floor(N/DivisaoOverlap));
end

%Representação gráfica para entrada e saída
figure(1)
stem(Entrada)

figure(2)
stem(H)

figure(3)
stem(Resposta)