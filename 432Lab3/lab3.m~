close all; clear; clc;
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

[NTPeaks, NTPLocs] = findpeaks(yFitted, xData, 'MinPeakProminence', .1, 'MinPeakDistance', 1)
findpeaks(yFitted, xData, 'MinPeakProminence', .1, 'MinPeakDistance', 1)

text(NTPLocs+.3, NTPeaks+0.5, num2str(NTPLocs));

% Find troughs
yFitted = feval(fitresult,xData);

disp('Neon Top')

[NTTroughs, NTTLocs] = findpeaks(-yFitted, xData, 'MinPeakProminence', .1, 'MinPeakDistance', 1)
NTTroughs = -NTTroughs
plot(NTTLocs, NTTroughs, 'bo')
text(NTTLocs+.3, NTTroughs, num2str(NTTLocs));

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

[NBPeaks, NBPLocs] = findpeaks(yFitted, xData, 'MinPeakProminence', .1, 'MinPeakDistance', 1)
findpeaks(yFitted, xData, 'MinPeakProminence', .1, 'MinPeakDistance', 1)

text(NBPLocs+.3, NBPeaks-0.5, num2str(NBPeaks));

% Find troughs
yFitted = feval(fitresult,xData);

disp('Neon Bot')

[NBTroughs, NBTLocs] = findpeaks(-yFitted, xData, 'MinPeakProminence', .1, 'MinPeakDistance', 1)
NBTroughs = -NBTroughs
plot(NBTLocs, NBTroughs, 'ro')
text(NBTLocs+.3, NBTroughs, num2str(NBTLocs));

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

[MTPeaks, MTPLocs] = findpeaks(yFitted, xData, 'MinPeakProminence', .1, 'MinPeakDistance', 1)
findpeaks(yFitted, xData, 'MinPeakProminence', .1, 'MinPeakDistance', 1)

text(MTPLocs+.3, MTPeaks, num2str(MTPLocs));

% Find troughs
yFitted = feval(fitresult,xData);

disp('Mercury Top')

[MTTroughs, MTTLocs] = findpeaks(-yFitted, xData, 'MinPeakProminence', .1, 'MinPeakDistance', 1)
MTTroughs = -MTTroughs
plot(MTTLocs, MTTroughs, 'bo')
text(MTTLocs+.3, MTTroughs+.05, num2str(MTTLocs));

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

[MBPeaks, MBPLocs] = findpeaks(yFitted, xData, 'MinPeakProminence', .1, 'MinPeakDistance', 1)
findpeaks(yFitted, xData, 'MinPeakProminence', .1, 'MinPeakDistance', 1)

text(MBPLocs+.3, MBPeaks, num2str(MBPLocs));

% Find troughs
yFitted = feval(fitresult,xData);

disp('Mercury Bot')

[MBTroughs, MBTLocs] = findpeaks(-yFitted, xData, 'MinPeakProminence', .1, 'MinPeakDistance', 1)
MBTroughs = -MBTroughs
plot(MBTLocs, MBTroughs, 'ro')
text(MBTLocs+.3, MBTroughs, num2str(MBTLocs));

% Label axes
xlabel 'Voltage'
ylabel 'Anode Current [nA]'
grid on

%% Feature plotting
figure( 'Name', 'Neon Bot' );
hold on;

%% Fit: 'Linear Neon Bot'.
NBPLocsLength = [1; 2; 3; 4];
NBTLocsLength = [1; 2; 3];

MBPLocsLength = [1; 2; 3; 4; 5; 6];
MBTLocsLength = [1; 2; 3; 4; 5; 6];

[xData, yData] = prepareCurveData( NBPLocsLength, NBPLocs );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft )

% Plot fit with data.
figure( 'Name', 'Neon Preliminary Plot' );
hold on
plot( fitresult, xData, yData, 'bo');

% Fit: 'Neon Bot Troughs'.
[xData, yData] = prepareCurveData( NBTLocsLength, NBTLocs );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft )

% Plot fit with data.
plot( fitresult, xData, yData, 'ro');
% Label axes
xlabel 'Peak/Trough Number'
ylabel 'Peak/Trough Voltage'
legend('Peaks', 'Peaks Line Fit', 'Troughs', 'Troughs Line Fit', 'Location', 'NorthWest')
grid on


%% Fit: 'Linear Mercury Bot'.
[xData, yData] = prepareCurveData( MBPLocsLength, MBPLocs );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft )

% Plot fit with data.
figure( 'Name', 'Mercury Preliminary Plot' );
hold on
plot( fitresult, xData, yData, 'bo');

% Fit: 'Mercury Bot Troughs'.
[xData, yData] = prepareCurveData( MBTLocsLength, MBTLocs );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft )

% Plot fit with data.
plot( fitresult, xData, yData, 'ro');
% Label axes
xlabel 'Peak/Trough Number'
ylabel 'Peak/Trough Voltage'
legend('Peaks', 'Peaks Line Fit', 'Troughs', 'Troughs Line Fit', 'Location', 'NorthWest')
grid on

%% Fit: 'Poly2 Neon Bot'.
NBPLocsLength = [1; 2; 3; 4];
NBTLocsLength = [1; 2; 3];

MBPLocsLength = [1; 2; 3; 4; 5; 6];
MBTLocsLength = [1; 2; 3; 4; 5; 6];

[xData, yData] = prepareCurveData( NBPLocsLength, NBPLocs );

% Set up fittype and options.
ft = fittype( 'poly2' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft )

% Plot fit with data.
figure( 'Name', 'Neon Preliminary Plot Poly2' );
hold on
plot( fitresult, xData, yData, 'bo');

% Fit: 'Neon Bot Troughs'.
[xData, yData] = prepareCurveData( NBTLocsLength, NBTLocs );

% Set up fittype and options.
ft = fittype( 'poly2' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft )

% Plot fit with data.
plot( fitresult, xData, yData, 'ro');
% Label axes
xlabel 'Peak/Trough Number'
ylabel 'Peak/Trough Voltage'
legend('Peaks', 'Peaks Curve Fit', 'Troughs', 'Troughs Curve Fit', 'Location', 'NorthWest')
grid on


%% Fit: 'Poly2 Mercury Bot'.
[xData, yData] = prepareCurveData( MBPLocsLength, MBPLocs );

% Set up fittype and options.
ft = fittype( 'poly2' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft )

% Plot fit with data.
figure( 'Name', 'Mercury Preliminary Plot Poly2' );
hold on
plot( fitresult, xData, yData, 'bo');

% Fit: 'Mercury Bot Troughs'.
[xData, yData] = prepareCurveData( MBTLocsLength, MBTLocs );

% Set up fittype and options.
ft = fittype( 'poly2' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft )

% Plot fit with data.
plot( fitresult, xData, yData, 'ro');
% Label axes
xlabel 'Peak/Trough Number'
ylabel 'Peak/Trough Voltage'
legend('Peaks', 'Peaks Curve Fit', 'Troughs', 'Troughs Curve Fit', 'Location', 'NorthWest')
grid on

%% Location Differences

% Neon
NTPLocsDiffLength = length(NTPLocs) - 1
NTPLocsDiff = zeros(1, NTPLocsDiffLength);
for n = 1:NTPLocsDiffLength
    NTPLocsDiff(n) = NTPLocs(n+1) - NTPLocs(n);
end
NTPLocs
NTPLocsDiff

NTTLocsDiffLength = length(NTTLocs) - 1
NTTLocsDiff = zeros(1, NTTLocsDiffLength);
for n = 1:NTTLocsDiffLength
    NTTLocsDiff(n) = NTTLocs(n+1) - NTTLocs(n);
end
NTTLocs
NTTLocsDiff

NBPLocsDiffLength = length(NBPLocs) - 1
NBPLocsDiff = zeros(1, NBPLocsDiffLength);
for n = 1:NBPLocsDiffLength
    NBPLocsDiff(n) = NBPLocs(n+1) - NBPLocs(n);
end
NBPLocs
NBPLocsDiff

NBTLocsDiffLength = length(NBTLocs) - 1
NBTLocsDiff = zeros(1, NBTLocsDiffLength);
for n = 1:NBTLocsDiffLength
    NBTLocsDiff(n) = NBTLocs(n+1) - NBTLocs(n);
end
NBTLocs
NBTLocsDiff


% Mercury
MTPLocsDiffLength = length(MTPLocs) - 1
MTPLocsDiff = zeros(1, MTPLocsDiffLength);
for n = 1:MTPLocsDiffLength
    MTPLocsDiff(n) = MTPLocs(n+1) - MTPLocs(n);
end
NTPLocs
NTPLocsDiff

MTTLocsDiffLength = length(MTTLocs) - 1
MTTLocsDiff = zeros(1, MTTLocsDiffLength);
for n = 1:MTTLocsDiffLength
    MTTLocsDiff(n) = MTTLocs(n+1) - MTTLocs(n);
end
MTTLocs
MTTLocsDiff

MBPLocsDiffLength = length(MBPLocs) - 1
MBPLocsDiff = zeros(1, MBPLocsDiffLength);
for n = 1:MBPLocsDiffLength
    MBPLocsDiff(n) = MBPLocs(n+1) - MBPLocs(n);
end
MBPLocs
MBPLocsDiff

MBTLocsDiffLength = length(MBTLocs) - 1
MBTLocsDiff = zeros(1, MBTLocsDiffLength);
for n = 1:MBTLocsDiffLength
    MBTLocsDiff(n) = MBTLocs(n+1) - MBTLocs(n);
end
MBTLocs
MBTLocsDiff


%% Neon Diff Bot
[xData, yData] = prepareCurveData( 1:NBPLocsDiffLength, NBPLocsDiff );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft )

% Plot fit with data.
figure( 'Name', 'Neon Preliminary Plot' );
hold on
plot( fitresult, xData, yData, 'bo');

% Fit: 'Neon Bot Troughs'.
[xData, yData] = prepareCurveData( 1:NBTLocsDiffLength, NBTLocsDiff );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft )

% Plot fit with data.
plot( fitresult, xData, yData, 'ro');
% Label axes
xlabel 'Peak/Trough Number'
ylabel 'Peak/Trough Voltage'
legend('Peaks', 'Peaks Line Fit', 'Troughs', 'Troughs Line Fit', 'Location', 'NorthWest')
grid on

%% Fit: 'Mercury Diff Bot'.
[xData, yData] = prepareCurveData( 1:MBPLocsDiffLength, MBPLocsDiff );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft )

% Plot fit with data.
figure( 'Name', 'Mercury Preliminary Plot' );
hold on
plot( fitresult, xData, yData, 'bo');

% Fit: 'Mercury Bot Troughs'.
[xData, yData] = prepareCurveData( 1:MBTLocsDiffLength, MBTLocsDiff );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft )

% Plot fit with data.
plot( fitresult, xData, yData, 'ro');
% Label axes
xlabel 'Peak/Trough Number'
ylabel 'Peak/Trough Voltage'
legend('Peaks', 'Peaks Line Fit', 'Troughs', 'Troughs Line Fit', 'Location', 'NorthWest')
grid on


%% Console Save
diary off
type consoleOutput.txt