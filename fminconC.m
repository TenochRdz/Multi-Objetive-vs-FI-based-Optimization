clear all
close all
clc

%% Restricicones temporales 

rst=[-1.1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
     0.9 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
     0 -1.1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
     0 0.9 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
     0 0 -1.1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
     0 0 0.9 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
     0 0 0 0 -1.1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
     0 0 0 0 0.9 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
     0 0 0 0 0 -1.1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
     0 0 0 0 0 0.9 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
     0 0 0 0 0 0 -1.1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
     0 0 0 0 0 0 0.9 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
     0 0 0 0 0 0 0 0 -1.1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0
     0 0 0 0 0 0 0 0 0.9 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0
     0 0 0 0 0 0 0 0 0 -1.1 1 0 0 0 0 0 0 0 0 0 0 0 0 0
     0 0 0 0 0 0 0 0 0 0.9 -1 0 0 0 0 0 0 0 0 0 0 0 0 0
     0 0 0 0 0 0 0 0 0 0 -1.1 1 0 0 0 0 0 0 0 0 0 0 0 0
     0 0 0 0 0 0 0 0 0 0 0.9 -1 0 0 0 0 0 0 0 0 0 0 0 0
     0 0 0 0 0 0 0 0 0 0 0 0 -1.1 1 0 0 0 0 0 0 0 0 0 0
     0 0 0 0 0 0 0 0 0 0 0 0 0.9 -1 0 0 0 0 0 0 0 0 0 0
     0 0 0 0 0 0 0 0 0 0 0 0 0 -1.1 1 0 0 0 0 0 0 0 0 0
     0 0 0 0 0 0 0 0 0 0 0 0 0 0.9 -1 0 0 0 0 0 0 0 0 0
     0 0 0 0 0 0 0 0 0 0 0 0 0 0 -1.1 1 0 0 0 0 0 0 0 0
     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.9 -1 0 0 0 0 0 0 0 0
     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -1.1 1 0 0 0 0 0 0
     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.9 -1 0 0 0 0 0 0
     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -1.1 1 0 0 0 0 0
     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.9 -1 0 0 0 0 0
     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -1.1 1 0 0 0 0
     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.9 -1 0 0 0 0
     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -1.1 1 0 0
     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.9 -1 0 0     
     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -1.1 1 0
     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.9 -1 0
     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -1.1 1
     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.9 -1];


%% Opciones
% optimset nos permite configurar opciones de la optimización
options = optimset;
options = optimset(options,'Display', 'iter');     % Activa que se muestre en la pantalla de comandos las iteraciones
options = optimset(options,'MaxFunEvals', 90000);   % Pone un límite en la cantidad de veces que se evalua (corre) la función. 
                                                   % Cada iteración requiere evaluar varias veces la función
options = optimset(options,'MaxIter', 6000);        % Pone un limite en las iteraciones
options = optimset(options,'TolFun', 1e-30);       % Tolerancia en la función. El código no para hasta que no alcanza este 
                                                   % grado de exactitud, lo cual puede hacer que se tarde mucho
options = optimset(options,'TolX', 1e-30);         % Similar al previo, pero con las variables de decisión
%options = optimset(options,'Algorithm', 'sqp');   % Algoritmo de optimización utilizado
options = optimset(options,'Diagnostics', 'on');   % Activa una diagnóstico del problema para fines informativos


%% fmincon se utliza para optimizar

rsb(1,(1:36))=0;

x0 = [0.197313146 0.43853 0.050392 0.24182 0.3109 0.676677233 
      0.197313146 0.43853 0.050392 0.24182 0.3109 0.676677233
      0.197313146 0.43853 0.050392 0.24182 0.3109 0.676677233
      0.197313146 0.43853 0.050392 0.24182 0.3109 0.676677233]; %se dejan los 4 filas de datos por si se desea modificar el valor en lapso de tiempo especifico

lw = x0*0.9;

up = x0*1.1;
  
[xopt,fval] = fmincon(@GWM,x0,rst,rsb,[],[],lw,up,[],options);

% x es el valor de la variable de decision que la computadora establezca en cada iteración
% fval será el valor de la función en cada iteración
% @Funcion es tu funcion a optimizar
% X0 o a es el valor inicial de tu variable de decisión
% [] los ponemos así, ya que esos argumentos son para las restricciones, mismas que ahorita no tenemos
% lw y up son limites para la variable de decisión
% options activa las opciones descritas arriba

%%  Gráficas para comparar con modelo sin optimizar

load('ResultsGW.mat')
xcg = x; ycg = y;
clear x y

load ('ResultsGWFI.mat')
xfi = x; yfi = y;

%[y,x,FI]=GWM22(xopt);
%[y,x,Z,Z1,Z2,Z3]=GWM22(xopt);
[y,x,Z1,Z2,Z3,FI] = GWM22(xopt);

t = 1:101;
t2 = 1:100;

figure
plot(t,y(:,27),"g",t,ycg(:,27),"r--",t,yfi(:,27),"b.","linewidth", 1.5)
legend("Modelo optimizado MO","Modelo original","Modelo optimizado IF","Location","northwest");
grid on
axis([0 100 24 36])
xticks(0:10:100);
yticks(24:1:36);
xlabel("Tiempo en Años");
ylabel("Temperatura °C"); 
title("Temperatura Global del Modelo (temp)");

figure
plot(t,y(:,13),"g",t,ycg(:,13),"r--",t,yfi(:,13),"b.","linewidth", 1.5)
legend("Modelo optimizado MO","Modelo original","Modelo optimizado IF","Location","northwest");
grid on
axis([0 100 1000 1500])
xticks(0:10:100);
xlabel("Tiempo en Años"); 
ylabel("Número de Humanos");
title("Número de Humanos (numHH)");

figure
plot(t2,x(:,44),"g",t2,xcg(:,44),"r--",t2,xfi(:,44),"b:","linewidth", 1.5)
legend("Modelo optimizado MO","Modelo original","Modelo optimizado IF","Location","northeast");
grid on
xticks(0:10:100);
yticks(.3:.005:.36);
xlabel("Tiempo en Años");
ylabel("Salario per Capita"); 
title("Salario per Capita (W)");


%% Figura economica
figure
hold on
plot(t,y(:,1),"g",t,ycg(:,1),"r--",t,yfi(:,1),"b.","linewidth", 1.5)
plot(t,y(:,4),"g",t,ycg(:,4),"r--",t,yfi(:,4),"b.","linewidth", 1.5)
plot(t,y(:,10),"g",t,ycg(:,10),"r--",t,yfi(:,10),"b.","linewidth", 1.5)
plot(t2,x(:,61),"g",t2,xcg(:,61),"r--",t2,xfi(:,61),"b.","linewidth", 1.5)
legend("Modelo optimizado MO","Modelo original","Modelo optimizado IF","Location","northwest");
grid on
%axis([0 100 1000 1500])
xticks(0:10:100);
xlabel("Tiempo en Años"); 
ylabel("Número de Humanos");
title("Número de Humanos (numHH)");

hold off
%print('figure', '-dpng', '-r300'); no utilizado, pues tiene mayor calidad el copiar directo
%de plot en edit_copy