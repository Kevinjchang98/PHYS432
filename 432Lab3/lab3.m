clear all; close all; clc;
diary consoleOutput.txt

%%
%digitize2('neonData.png')
%digitize2('mercuryData.png')

%%
neonData = readtable('neonDataDigitized.dat');
mercuryData = readtable('mercuryDataDigitized.dat');

%%
neonDataTop = neonData(1:187, 1:2);
neonDataBot = neonData(188:306, 1:2);

neonDataTopX = neonDataTop.Var1;
neonDataTopY = neonDataTop.Var2;

neonDataBotX = neonDataBot.Var1;
neonDataBotY = neonDataBot.Var2;

mercuryDataTop = mercuryData(1:202, 1:2);
mercuryDataBot = mercuryData(203:380, 1:2);

mercuryDataTopX = mercuryDataTop.Var1;
mercuryDataTopY = mercuryDataTop.Var2;

mercuryDataBotX = mercuryDataBot.Var1;
mercuryDataBotY = mercuryDataBot.Var2;

%% Fit: 'Neon'.
% Top Data
[xData, yData] = prepareCurveData( neonDataTopX, neonDataTopY );

% Set up fittype and options 
ft = fittype( 'smoothingspline' );
opts = fitoptions( 'Method', 'SmoothingSpline' );
opts.SmoothingParam = 0.999644545562972;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
hold on
h = plot( fitresult, xData, yData, 'r.'  );

% Find peaks
yFitted = feval(fitresult,xData);
    
disp('Neon Top')

[HDBPks, HDBLocs] = findpeaks(yFitted, xData, 'MinPeakProminence', .1, 'MinPeakDistance', 1)
findpeaks(yFitted, xData, 'MinPeakProminence', .1, 'MinPeakDistance', 1)

text(HDBLocs+.3, HDBPks+0.5, num2str(HDBLocs));

% Bot Data
[xData, yData] = prepareCurveData( neonDataBotX, neonDataBotY );

% Set up fittype and options.
ft = fittype( 'smoothingspline' );
opts = fitoptions( 'Method', 'SmoothingSpline' );
opts.SmoothingParam = 0.999644545562971;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );
h = plot( fitresult, xData, yData, 'r.' );

% Find peaks
yFitted = feval(fitresult,xData);
    
disp('Neon Bot')

[HDBPks, HDBLocs] = findpeaks(yFitted, xData, 'MinPeakProminence', .1, 'MinPeakDistance', 1)
findpeaks(yFitted, xData, 'MinPeakProminence', .1, 'MinPeakDistance', 1)

text(HDBLocs+.3, HDBPks-0.5, num2str(HDBLocs));

% Label axes
xlabel 'Voltage'
ylabel 'Anode Current [nA]'
grid on
%% Fit: 'Mercury'.
% Top Data
[xData, yData] = prepareCurveData( mercuryDataTopX, mercuryDataTopY );

% Set up fittype and options 
ft = fittype( 'smoothingspline' );
opts = fitoptions( 'Method', 'SmoothingSpline' );
opts.SmoothingParam = 0.999644545562972;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
hold on
h = plot( fitresult, xData, yData, 'r.' );

% Find peaks
yFitted = feval(fitresult,xData);
    
disp('Mercury Top')

[HDBPks, HDBLocs] = findpeaks(yFitted, xData, 'MinPeakProminence', .1, 'MinPeakDistance', 1)
findpeaks(yFitted, xData, 'MinPeakProminence', .1, 'MinPeakDistance', 1)

text(HDBLocs+.3, HDBPks, num2str(HDBLocs));

% Bot Data
[xData, yData] = prepareCurveData( mercuryDataBotX, mercuryDataBotY );

% Set up fittype and options.
ft = fittype( 'smoothingspline' );
opts = fitoptions( 'Method', 'SmoothingSpline' );
opts.SmoothingParam = 0.999644545562972;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );
h = plot( fitresult, xData, yData, 'r.' );

% Find peaks
yFitted = feval(fitresult,xData);

disp('Mercury Bot')

[HDBPks, HDBLocs] = findpeaks(yFitted, xData, 'MinPeakProminence', .1, 'MinPeakDistance', 1)
findpeaks(yFitted, xData, 'MinPeakProminence', .1, 'MinPeakDistance', 1)

text(HDBLocs+.3, HDBPks, num2str(HDBLocs));


% Label axes
xlabel 'Voltage'
ylabel 'Anode Current [nA]'
grid on

%% Console Save
diary off
type consoleOutput.txt