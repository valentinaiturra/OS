clear all
close all
clc

chile = struct();
chile.tp = [11 16 19.5 19 19 19.5 26];
chile.ts = [17.5 26 33 32 32.5 33.5 44];
chile.estaciones = {'A13C' 'AC04' 'AC05' 'C160' 'C170' 'C005' 'C260'};
epi_chile = [-28.91 -71.44];
chile.lat= [-28.463 -28.205 -28.836 -29.879 -29.904 -29.919 -30.259];
chile.lon= [-71.225 -71.074 -70.274 -71.271 -71.238 -71.238 -71.490];

pf_chile = polyfit(chile.tp, (chile.ts-chile.tp),1);
pv_chile = polyval(pf_chile,chile.tp);

figure()
plot(chile.tp,(chile.ts-chile.tp),'or','LineWidth',2)
hold on
plot(chile.tp,pv_chile)
dx = 0.2; % Desplazamiento en x para separar la etiqueta del punto
dy = 0.1; % Desplazamiento en y para separar la etiqueta del punto
text(chile.tp([1:4,7]) + dx, (chile.ts([1:4,7])-chile.tp([1:4,7])) - dy, chile.estaciones([1:4,7]));
dxx = 1.4; % Desplazamiento en x para separar la etiqueta del punto
dyy = 0.4; % Desplazamiento en y para separar la etiqueta del punto
text(chile.tp([5,6]) - dxx, (chile.ts([5,6])-chile.tp([5,6])) + dyy, chile.estaciones([5,6]));
grid minor
xlabel("Tiempo onda P [s]")
ylabel("Tiempo onda S - onda P [s]")
title('Diagrama de Wadati evento Chile')
xlim([10 28])


m = pf_chile(1);
vpvs_chile = m+1;

for i = 1:length(chile.lat)
    x(i) = (abs(chile.lat(i)-epi_chile(1))*110836).^2;
    y(i) = (abs(chile.lon(i)-epi_chile(2))*97429).^2;
    chile.dist(i) = sqrt(x(i)+y(i));
end
chile.vs = chile.dist ./ chile.ts;
chile.vp = chile.dist ./ chile.tp;


%% 
taiwan = struct();
taiwan.tp = [107 181 185 213 235];
taiwan.ts = [204 329 383 377 430];
taiwan.estaciones = ["HKPS" "QIZ" "ENH" "INCN" "BJT"];
epi_taiwan = [23.819 121.56];
taiwan.lat = [22.28 19.03 30.28 37.48 40.02];
taiwan.lon = [114.14 109.84 109.49 126.62 116.17];

pf_taiwan = polyfit(taiwan.tp, (taiwan.ts-taiwan.tp),1);
pv_taiwan = polyval(pf_taiwan,taiwan.tp);

figure()
plot(taiwan.tp,(taiwan.ts-taiwan.tp),'ob','LineWidth',2)
dx = 10.9; % Desplazamiento en x para separar la etiqueta del punto
dy = 0.6; % Desplazamiento en y para separar la etiqueta del punto
text(taiwan.tp([3,5]) - dx, (taiwan.ts([3,5])-taiwan.tp([3,5])) - dy, taiwan.estaciones([3,5]));
dxx = 1.7; % Desplazamiento en x para separar la etiqueta del punto
dyy = 0.6; % Desplazamiento en y para separar la etiqueta del punto
text(taiwan.tp([1,2,4]) + dxx, (taiwan.ts([1,2,4])-taiwan.tp([1,2,4])) - dyy, taiwan.estaciones([1,2,4]));
hold on
hold on
plot(taiwan.tp,pv_taiwan,'b')
grid minor
xlabel("Tiempo onda P [s]")
ylabel("Tiempo onda S - onda P [s]")
title('Diagrama de Wadati evento Taiwán')
ylim([90 200])

m=pf_taiwan(1);
vpvs_taiwan = m+1;

x = [];
y = [];
for i = 1:length(taiwan.lat)
    x(i) = abs(taiwan.lat(i)-epi_taiwan(1))*110857;
    y(i) = abs(taiwan.lon(i)-epi_taiwan(2))*95889;
    taiwan.dist(i) = sqrt(x(i).^2+y(i).^2);
end

taiwan.vs= taiwan.dist ./ taiwan.ts;
taiwan.vp = taiwan.dist ./ taiwan.tp;


