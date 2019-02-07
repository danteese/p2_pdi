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