close all; clear; clc;

%% Data input

% data is a cell array that contains all the individual data, which each
% have a TIME and CH1 column where TIME corresponds to x-axis data and CH1
% corresponds to y-axis data. The names with matching indices are in the
% names array as a 1D string array. These names can be changed without
% breaking anything to be more descriptive later, currently they're just
% the same names as the individual tables that are being read from the
% csv's.

g_B0 = readtable('Green_B0.csv', 'HeaderLines', 15);
g_3612_NP = readtable('Green_3612A_no_polarizer.csv', 'HeaderLines', 15);
g_357A_Sig = readtable('Green_357A_sigma.csv', 'HeaderLines', 15);
g_357A_Pi = readtable('Green_357A_pi.csv', 'HeaderLines', 15);

y_B0 = readtable('Yellow_B0.csv', 'HeaderLines', 15);
y_1817_NP = readtable('Yellow_1817A_no_polarizer.csv', 'HeaderLines', 15);
y_380A_Pi = readtable('Yellow_380A_pi.csv', 'HeaderLines', 15);
y_182A_Sig = readtable('Yellow_182A_sigma.csv', 'HeaderLines', 15);
y_182A_Pi = readtable('Yellow_182A_pi.csv', 'HeaderLines', 15);

data = {g_B0, g_3612_NP, g_357A_Sig, g_357A_Pi, y_B0, y_1817_NP, y_380A_Pi, y_182A_Sig, y_182A_Pi};
names = ["g-B0", "g-3612-NP", "g-357A-Sig", "g-357A-Pi", "y-B0", "y-1817-NP", "y-380A-Pi", "y-182A-Sig", "y-182A-Pi"];

%% Initial Raw Data Plots

% I've got one for loop that iterates through the data object to create
% each graph.

% The peaks and their locations are found and compiled into the
% peakData object, which is a cell array of tables which have the first
% column being the y-axis value of the peak and the second column being the
% location on the x-axis (I believe, gotta confirm that).

% TODO: Refine peak-finding parameters to avoid missed peaks in certain
% graphs
% TODO: Probably rename the names array for better graph naming
% TODO: Possibly label each point on the graph, though might not be needed
% TODO: Find FWHM

for i = 1:9
    figure('Name', names(i))
    hold on

    plot(data{i}.('TIME'), data{i}.('CH1'))

    [Peaks, Locs] = findpeaks(data{i}.('CH1'), data{i}.('TIME'), 'MinPeakProminence', .03, 'MinPeakDistance', .0001);
    peakData{i} = [Peaks, Locs];
    disp(names(i))
    disp(Locs)
    findpeaks(data{i}.('CH1'), data{i}.('TIME'), 'MinPeakProminence', .03, 'MinPeakDistance', .0001);

    title(names(i))
    saveas(gcf, names(i) + '.png')
    hold off
end