function [K,c] = LO(terremoto)
%Valentina Iturra Rosales

datos = readtable(terremoto, 'Delimiter', ',');

fechas = table2array(datos(:,1));
fechas = flipud(fechas);

c=0;
for i =1:length(fechas)
    c = c+1;
    primer=(fechas{i});
    a = primer(1:10);
    fecha(i,1) = datenum(a);
    fechas{i}=a;
end

a = datenum(fechas(1),'yyyy-mm-dd');
b(1) = a;
k(1) = length(find(fecha == b(1)));

p = fecha(end) - fecha(1);
for i = 2:p
    b(i,1) = b(i-1) +1;
    k(i,1) = length(find(fecha == b(i)));
end

fecha_datetime = datetime(b, 'ConvertFrom', 'datenum');

K = max(k);
 c = 0.01;
for i = 1:length(k)
    n(i,1) = K / (c+i);
end

figure()
plot(fecha_datetime,k,'LineWidth',2)
hold on
plot(fecha_datetime,n,'LineWidth',1.5)
grid minor
xlim([fecha_datetime(1)-5 fecha_datetime(end)+5])
ylim([0-5 max(k)+5])
xtickformat("MMM yyyy")
xlabel("Fecha")
ylabel("Número de eventos")
title("Ley de Omori") %Renombrar dependiendo el terremoto
legend("Datos","Curva ajustada")

