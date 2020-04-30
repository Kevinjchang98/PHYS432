clear all; close all; clc;

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
h = plot( fitresult, xData, yData, 'r.'  );
% Label axes
xlabel neonDataTopX
ylabel neonDataTopY
grid on
hold on

% Bot Data
[xData, yData] = prepareCurveData( neonDataBotX, neonDataBotY );

% Set up fittype and options.
ft = fittype( 'smoothingspline' );
opts = fitoptions( 'Method', 'SmoothingSpline' );
opts.SmoothingParam = 0.999644545562971;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );
h = plot( fitresult, xData, yData, 'r.' );

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
h = plot( fitresult, xData, yData, 'r.' );
% Label axes
xlabel neonDataTopX
ylabel neonDataTopY
grid on
hold on

% Bot Data
[xData, yData] = prepareCurveData( mercuryDataBotX, mercuryDataBotY );

% Set up fittype and options.
ft = fittype( 'smoothingspline' );
opts = fitoptions( 'Method', 'SmoothingSpline' );
opts.SmoothingParam = 0.999644545562972;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );
h = plot( fitresult, xData, yData, 'r.' );