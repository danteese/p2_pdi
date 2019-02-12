%% Ejercicio 1
clear all;
clc;
fi = 0;
ff = 7;
[t, sweep, bi_sweep] = barrido(fi, ff, 32);
[t1, sweep1, bi_sweep1] = barrido(fi, ff, 256);
[t2, sweep2, bi_sweep2] = barrido(fi, ff, 1024);

figure
subplot(3,1,1);
plot(t,sweep), title('Sampling at 32.'), xlabel('time(s)'), ylabel('Amplitude');
subplot(3,1,2);
plot(t1,sweep1), title('Sampling at 256.'), xlabel('time(s)'), ylabel('Amplitude');
subplot(3,1,3);
plot(t2,sweep2), title('Sampling at 1024.'), xlabel('time(s)'), ylabel('Amplitude');

figure
plot(t, bi_sweep)

%% Ejercicio 2
figure
sweep = (sweep/2);
sweep1 = (sweep1/2);
sweep2 = (sweep2/2);
z1 = sweep' * sweep;
z2 = sweep1' * sweep1;
z3 = sweep2' * sweep2;
subplot(1,3,1);
imshow(z1,[]);
title('32');
subplot(1,3,2);
imshow(z2,[]);
title('256');
subplot(1,3,3);
imshow(z3,[]);
colormap(jet(1024));
title('1024');
figure
bi_sweep = bi_sweep/2;
bi_sweep1 = bi_sweep1/2;
bi_sweep2 = bi_sweep2/2;
%s = bi_sweep' * bi_sweep;
%s1 = bi_sweep1' * bi_sweep1;
%s2 = bi_sweep2' * bi_sweep2;
subplot(1,3,1);
imshow(bi_sweep,[]);
title('32');
subplot(1,3,2);
imshow(bi_sweep1,[]);
title('256');
subplot(1,3,3);
imshow(bi_sweep2,[]);
colormap(hsv(1024));
title('1024');

%% Ejercicio 3
figure;
n = [1,3,7,15,31,63,127,255];
Z3 = mat2gray(z3);
BI_sweep2 = mat2gray(bi_sweep2);
for v = 1:1:8
    %newLevel = bitand(uint8(Z3),(256-n(v)));
    newLevel = Z3 .* n(v);
    newLevel = uint8(newLevel);
    subplot(3,3,v);
    imshow(newLevel, [])
    title([num2str(n(v)+1) ' tonos'])
end
figure
for v = 1:1:8
    newLevel = BI_sweep2 .* n(v);
    newLevel = uint8(newLevel);
    subplot(3,3,v);
    imshow(newLevel, [])
    title([num2str(n(v)+1) ' tonos'])
end

%% Ejercicio 4
figure
[z]=semitonos('Foto.jpg');
imshow(z,[]);