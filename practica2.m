%% Ejercicio 1
% Parte referente a Se?aales Unidimensionales. 

clear all;
clc;

fi = 0; % Initial Freq
ff = 7; % Final Freq

help barrido
% Como se puede observar se obtiene ya el tiempo en matriz bidimensional

[t, sweep, bi_sweep] = barrido(fi, ff, 32);
[t1, sweep1, bi_sweep1] = barrido(fi, ff, 256);
[t2, sweep2, bi_sweep2] = barrido(fi, ff, 1024);

% Mostrar las gr?ficas del sampleo.
figure(1)
subplot(3,1,1);
plot(t,sweep), title('Sampling at 32.'), xlabel('time(s)'), ylabel('Amplitude'), grid on;
subplot(3,1,2);
plot(t1,sweep1), title('Sampling at 256.'), xlabel('time(s)'), ylabel('Amplitude'), grid on;
subplot(3,1,3);
plot(t2,sweep2), title('Sampling at 1024.'), xlabel('time(s)'), ylabel('Amplitude'), grid on;

% Conclusiones: Entre m?s r?pido se hace el muestreo mejor se muestran las
% gr?ficas.


%% Ejercicio 2: Matriz transpuesta y rotacional.
% En esta parte se describe como se realizaron cada uno de los pasos para
% modificar las matrices originales y convertirlas en su transpuesta y
% rotacional.

% Para la matriz del barrido:

sweep = (sweep/2);
sweep1 = (sweep1/2);
sweep2 = (sweep2/2);
z1 = sweep' * sweep;
z2 = sweep1' * sweep1;
z3 = sweep2' * sweep2;

figure(2)
subplot(1,3,1);
imshow(z1,[]), title('32');
subplot(1,3,2);
imshow(z2,[]), title('256');
subplot(1,3,3);
imshow(z3,[]), colormap(jet(1024)), title('1024');

% El efecto de obtener la matriz transpuesta se puede observar en las
% imagenes resultantes, en origen esto es blanco y negro pero con el mapa
% de colores distinto se puede apreciar mejor el resultado. 

% Para la matriz de tiempo en 2 dimensiones: 

bi_sweep = bi_sweep/2;
bi_sweep1 = bi_sweep1/2;
bi_sweep2 = bi_sweep2/2;

% La combinaci?n de las matrices para este efecto fue aplicado para generar
% los c?rculos que se observan a continuaci?n y resuelve las operaciones
% que se realizan de la siguiente forma: 
%
%   1 1 1 1
%   1 .
%   1   .
%   1     . 
%
% El punto simboliza el c?lculo de la diagonal.

figure(3)

subplot(1,3,1);
imshow(bi_sweep,[]), title('32');
subplot(1,3,2);
imshow(bi_sweep1,[]), title('256');
subplot(1,3,3);
imshow(bi_sweep2,[]), colormap(hsv(1024)), title('1024');


%% Ejercicio 3: Cuantizaci?n
% En este punto se utilizan los valores para cuantizar la imagen en los
% niveles ya predeterminados. 

figure(4)
n = [1,3,7,15,31,63,127,255];
Z3 = mat2gray(z3); % Sweep de 1024
BI_sweep2 = mat2gray(bi_sweep2);

% Sweep
for v = 1:1:8
    newLevel = Z3 .* n(v);
    newLevel = uint8(newLevel);
    subplot(3,3,v);
    imshow(newLevel, []), title([num2str(n(v)+1) ' tonos'])
end

% Time 2D
figure(5)
for v = 1:1:8
    newLevel = BI_sweep2 .* n(v);
    newLevel = uint8(newLevel);
    subplot(3,3,v);
    imshow(newLevel, []), title([num2str(n(v)+1) ' tonos'])
end

% En este caso podemos observar como la cantidad de tonos importa a la hora
% de percibir mejor resoluci?n en las im?genes.

%% Ejercicio 4: Semitonos
% Teor?a: http://dasan.sejong.ac.kr/~dihan/ip/P06_chapter6_ENG.pdf

% En este caso la interpretaci?n por semitonos fue dada por la invenci?n de
% las impresoras y las t?cnicas que utilizaban para emplear puntos para
% imprimir una imagen, hoy en d?a estas t?cnicas ya no son utilizadas por
% la gran precisi?n que se tiene.

figure(5)
selfie = semitonos('foto2.jpg');
imshow(selfie,[],'InitialMagnification', 'fit'), xlabel({'Ricardo'; '- An?nimo'})

figure(6)
selfie = semitonos('Foto.jpg');
imshow(selfie,[],'InitialMagnification', 'fit'), xlabel({'Clase de Ania'; '- An?nimo'})

figure(7)
selfie = semitonos('moon.tif');
imshow(selfie,[],'InitialMagnification', 'fit'), title('Moon');