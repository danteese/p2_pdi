%% Ejercicio 1
% Parte referente a Señales Unidimensionales. 

clear all;
clc;

fi = 0; % Initial Freq
ff = 7; % Final Freq

help practica2>barrido
% Como se puede observar se obtiene ya el tiempo en matriz bidimensional

e = 'Ejercicio 1'; disp(e);

[t, sweep, bi_sweep] = barrido(fi, ff, 32);
[t1, sweep1, bi_sweep1] = barrido(fi, ff, 256);
[t2, sweep2, bi_sweep2] = barrido(fi, ff, 1024);

% Mostrar las gráficas del sampleo.
figure(1)
subplot(3,1,1);
plot(t,sweep, 'g'), title('Sampling at 32.'), xlabel('time(s)'), ylabel('Amplitude'), grid on;
subplot(3,1,2);
plot(t1,sweep1, 'b'), title('Sampling at 256.'), xlabel('time(s)'), ylabel('Amplitude'), grid on;
subplot(3,1,3);
plot(t2,sweep2, 'r'), title('Sampling at 1024.'), xlabel('time(s)'), ylabel('Amplitude'), grid on;


% Conclusiones: Entre más rápido se hace el muestreo mejor se muestran las
% gráficas.
pause;

%% Ejercicio 2: Matriz transpuesta y rotacional.
% En esta parte se describe como se realizaron cada uno de los pasos para
% modificar las matrices originales y convertirlas en su transpuesta y
% rotacional.

% Para la matriz del barrido:

e = 'Ejercicio 2'; disp(e);

sweep = (sweep/2);
sweep1 = (sweep1/2);
sweep2 = (sweep2/2);
z1 = sweep' * sweep;
z2 = sweep1' * sweep1;
z3 = sweep2' * sweep2;

figure(2)
a = subplot(1,3,1);
imshow(z1,[]), title('32');
b = subplot(1,3,2);
imshow(z2,[]), title('256');
c = subplot(1,3,3);
imshow(z3,[]), title('1024');
colormap(a, jet(1024))
colormap(b, jet(1024))
colormap(c, jet(1024))
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
% El punto simboliza el cálculo de la diagonal.

figure(3)

a = subplot(1,3,1);
imshow(bi_sweep,[]), title('32');
b = subplot(1,3,2);
imshow(bi_sweep1,[]), title('256');
c = subplot(1,3,3);
imshow(bi_sweep2,[]), title('1024');
colormap(a, hsv(1024))
colormap(b, hsv(1024))
colormap(c, hsv(1024))

pause;

%% Ejercicio 3: Cuantización
% En este punto se utilizan los valores para cuantizar la imagen en los
% niveles ya predeterminados. 

e = 'Ejercicio 3'; disp(e);
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
pause;
%% Ejercicio 4: Semitonos
% Teor?a: http://dasan.sejong.ac.kr/~dihan/ip/P06_chapter6_ENG.pdf

% En este caso la interpretaci?n por semitonos fue dada por la invenci?n de
% las impresoras y las t?cnicas que utilizaban para emplear puntos para
% imprimir una imagen, hoy en d?a estas t?cnicas ya no son utilizadas por
% la gran precisi?n que se tiene.
e = 'Ejercicio 4'; disp(e);
figure(6)
[selfie, img] = semitonos('foto2.jpg');
subplot(1,2,1);
imshow(selfie,[],'InitialMagnification', 'fit'), title({'Ricardo'; '- Anónimo'})
subplot(1,2,2);
imshow(img, []), title('Original image');

figure(7)
[selfie, img] = semitonos('Foto.jpg');
subplot(1,2,1);
imshow(selfie,[],'InitialMagnification', 'fit'), title({'Clase de Ania'; '- Anónimo'})
subplot(1,2,2);
imshow(img, []), title('Original image');

figure(8)
[selfie, img] = semitonos('moon.tif');
subplot(1,2,1);
imshow(selfie,[],'InitialMagnification', 'fit'), title('Moon');
subplot(1,2,2);
imshow(img, []), title('Original image');


%% Functions

function [t, linear_sweep, space_sweep] = barrido( fi, ff, m )
% Function that generates a sine sweep from fi to ff at m samples.
%
% [time, linear_sweep, space_sweep] = barrido(freq_in, freq_fin, muestras)
%
% Params: 
%   fi - initial frequency in h
%   ff - end frequency in h
%   m - number of samples
% Returns: 
%   linear_sweep - the sweep in timeline
%   space_sweep - Mesh the time into a bidimensional matrix and returns its
%   sweep.

    % Idea from: https://www.edn.com/electronics-news/4384064/Generate-a-Swept-Sine-Test-Signal

    sampling = (ff - fi)/m; % Assuming normalized freq
    t = fi: sampling: (ff-sampling); % Times per cycle
    a = t.^2; % a factor
    linear_sweep = sin(a)+1;
    
    % Bidimensional sweeping
    [X,Y] = meshgrid(t);
    space = sqrt(X.^2 + Y.^2);
    space_sweep = sin(space .^ 2)+1;

    
end


function [z, img] = semitonos(image_name)
% Idea of semitones took from: http://dasan.sejong.ac.kr/~dihan/ip/P06_chapter6_ENG.pdf
% Rylander's recursive pattering (tones from 0 - 16):
    t0 =   [0   0   0   0 ;
            0   0   0   0 ;
            0   0   0   0 ;
            0   0   0   0 ];

    t1 =  [255  0   0   0 ;
            0   0   0   0 ;
            0   0  255  0 ;
            0   0   0   0 ];

    t2 =  [255  0  255  0 ;
            0   0   0   0 ;
            0   0  255  0 ;
            0   0   0   0 ];

    t3 =  [255  0  255  0 ;
            0   0   0   0 ;
           255  0  255  0 ;
            0   0   0   0 ];

    t4 =  [255  0  255  0 ;
           255  0   0   0 ;
           255  0  255  0 ;
            0   0   0   0 ];

    t5 =  [255  0  255  0 ;
           255  0   0   0 ;
           255  0  255  0 ;
            0   0  255  0 ];

    t6 =  [255  0  255  0 ;
           255  0  255  0 ;
           255  0  255  0 ;
            0   0  255  0 ];

    t7 =  [255  0  255  0 ;
           255  0  255  0 ;
           255  0  255  0 ;
           255  0  255  0 ];

    t8 =  [255 255 255  0 ;
           255  0  255  0 ;
           255  0  255  0 ;
           255  0  255  0 ];

    t9 =  [255 255 255  0 ;
           255  0  255  0 ;
           255  0  255 255;
           255  0  255  0 ];

    t10 = [255 255 255 255;
           255  0  255  0 ;
           255  0  255 255;
           255  0  255  0 ];

    t11 = [255 255 255 255;
           255  0  255  0 ;
           255 255 255 255;
           255  0  255  0 ];

    t12 = [255 255 255 255;
           255 255 255  0 ;
           255 255 255 255;
           255  0  255  0 ];

    t13 = [255 255 255 255;
           255 255 255  0 ;
           255 255 255 255;
           255  0  255 255];

    t14 = [255 255 255 255;
           255 255 255 255;
           255 255 255 255;
           255  0  255 255];

    t15 = [255 255 255 255;
           255 255 255 255;
           255 255 255 255;
           255 255 255 255];
   
  % Concatenar las matrices en un arreglo 3D
  SEM = cat(3, t0, t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15);
  
  img = imread(image_name);
  % Check if is black and white or rgb
  if size(img,3) == 3
    img = rgb2gray(img);
  end
  img = round(img/17);
  [h, w] = size(img);
  z = zeros(h * 4, w * 4); % Generar la imagen nueva en blanco para llenarla con los semitonos.
  
  for i = 1:h
      for j = 1:w
          % Siempre vas adelante 3 pixeles
          i_min = 1 + (4 * (i - 1));
          i_max = i_min + 3;
          j_min = 1 + (4 * (j - 1));
          j_max = j_min + 3;
          
          temp_semitone = img(i,j);
          z(i_min : i_max, j_min : j_max) = SEM(:,:,temp_semitone + 1);
      end     
  end

end



