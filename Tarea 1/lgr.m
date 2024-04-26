function [a,b] = lgr(archivo)
%Valentina Iturra Rosales

datos=readmatrix(archivo);

magnitude = datos(:,5);

M = [0:0.1:9];

count=0;
for i = 1:length(M)
    count=count+1;
    n= find(magnitude > M(i));
    N(count,1)= length(n);
end

LOG=log10(N);

%p= find(M >4.1 & M<7.1); %Despues del terremoto Maule
%p= find(M >3.9 & M<7.1); %Despues del terremoto Illapel
%p= find(M >3.4 & M<6.2); %Antes del terremoto,Maule
%p= find(M >4 & M<6.4); %Antes del terremoto,Illapel

x = M(p);
y = LOG(p);

pf = polyfit(x,y,1);
pv = polyval(pf,x);

a = pf(2);
b = pf(1);

figure()
plot(M,LOG,'LineWidth',2)
hold on
plot(x,pv,'LineWidth',2)
xlabel("Magnitud")
ylabel("Logaritmo de eventos acumulados")
title("Ley de Gutenberg-Richter") %Renombrar dependiendo el terremoto
grid minor
%xlim([0 8.8]) %Maule
%xlim([0 8.4]) %Illapel
legend("Datos","Ajuste lineal")