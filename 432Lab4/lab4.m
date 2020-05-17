close all; clear; clc;

g_B0 = readtable('Green_B0.csv', 'HeaderLines', 15);
g_3612_NP = readtable('Green_3612A_no_polarizer.csv', 'HeaderLines', 15);
g_357A_Sig = readtable('Green_357A_sigma.csv', 'HeaderLines', 15);
g_357A_Pi = readtable('Green_357A_pi.csv', 'HeaderLines', 15);

y_B0 = readtable('Yellow_B0.csv', 'HeaderLines', 15);
y_1817_NP = readtable('Yellow_1817A_no_polarizer.csv', 'HeaderLines', 15);
y_380A_Pi = readtable('Yellow_380A_pi.csv', 'HeaderLines', 15);
y_182A_Sig = readtable('Yellow_182A_sigma.csv', 'HeaderLines', 15);
y_182A_Pi = readtable('Yellow_182A_pi.csv', 'HeaderLines', 15);

%%

% Green
figure()
plot(g_B0.('TIME'), g_B0.('CH1'))

figure()
plot(g_3612_NP.('TIME'), g_3612_NP.('CH1'))

figure()
plot(g_357A_Pi.('TIME'), g_357A_Pi.('CH1'))

figure()
plot(g_357A_Sig.('TIME'), g_357A_Sig.('CH1'))

% Yellow
figure()
plot(y_B0.('TIME'), y_B0.('CH1'))

figure()
plot(y_1817_NP.('TIME'), y_1817_NP.('CH1'))

figure()
plot(y_182A_Pi.('TIME'), y_182A_Pi.('CH1'))

figure()
plot(y_182A_Sig.('TIME'), y_182A_Sig.('CH1'))

figure()
plot(y_380A_Pi.('TIME'), y_380A_Pi.('CH1'))