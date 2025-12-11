%Funcion de FI; corrección a anterior código, actualmente se llama
%colocando la funcion en GWM por su nombre ("FISHER"); contempla las 14
%piscinas de recursos --------- Diseño: AOC. 23/10/2024

for yi = [1:12 24:25]      %Ciclo for para ir tomando la piscina de recursos y aplicarle FI
    P1a = y(:,yi);
    TP1a = P1a';
    
    Tyi = yi';
    
    for i = 1:15
        for i2 = 1:length(yi)
            TP1ady(i2) = (TP1a(i2+2)-TP1a(i2))/2;
        end
    end
            
end
    
yi = [1:12 24:25];
Pool = y(:,yi);
A = Pool';

% Paso 1:matriz para almacenar los resultados.
B = zeros(size(A));  

% Paso 2: Recorrer la matriz
for i = 1:size(A,1)  
    for j = 1:size(A,2)-2  
        B(i, j) = (A(i, j+2) - A(i, j)) / 2;  % Operación: (tercer - primero) / 2
    end
end

% Paso 3: Crear una nueva variable para almacenar los resultados
C = zeros(1, size(A, 2));  

% Paso 4
for j = 1:size(B, 2)
    C(j) = sqrt(sum(B(:, j).^2));  % Eleva al cuadrado, suma y saca la raíz
end

% Paso 5: Crear una nueva matriz para almacenar los resultados.
D = zeros(size(A));  

% Paso 6: Recorrer la matriz
for i = 1:size(A,1)  
    for j = 1:size(A,2)-2  % Comienza desde el segundo elemento de cada fila
        D(i, j) = (A(i, j+2)-(2*(A(i, j+1)))+A(i, j)) / (1^2);  % Operación: (tercer - 2 por primero + segundo) / 1^2
    end
end

% Paso 7: Crear una nueva variable para almacenar los resultados
E = zeros(1, size(A, 2));  

% Paso 8: Recorrer las columnas de y' y las multiplica y suma con y''.
for j = 1:size(D, 2)
    E(j) = sum(B(:, j).*D(:,j));  % Sumatoria de y' con y''
end

% Paso 9: Crear una nueva variable para almacenar los resultados
F = zeros(1, size(A, 2));  

% Paso 10: Recorrer las columnas
for j = 1:size(D, 2)
    F(j) = E(:, j)./C(:,j);  
end

% Paso 11: Crear una nueva variable para almacenar los resultados
FISH = zeros(1, size(A, 2));  

% Paso 12: Obtención de Fisher
for j = 1:size(D, 2)
    FISH(j) = (F(:, j)^2)/(C(:,j)^4); 
end

 FI=FISH(:,1:99);
% FI=FISH(:,1:99)*1e6;

% figure;
% plot(FISH);
% title("FISHER INFO");
