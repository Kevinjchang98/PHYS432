close all; clear all; clc;


%% Na D Lines Import Data

NaDLines = readtable('Na_D_lines_run1.CSV', 'HeaderLines', 15);
NaDLines{:,2} = -NaDLines{:,2};
NaDLines{:,1} = NaDLines{:,1} + 20;


%% Plot for peak determination

% Prep data
[xData, yData] = prepareCurveData( NaDLines{:,1}, NaDLines{:,2} );

% Set up fittype and options.
ft = fittype( 'gauss2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0 -Inf -Inf 0];
opts.StartPoint = [0.772 4.531 2.52336275795925 0.668 35.899 1.91621639204114];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'Na D Lines for Calibration' );
hold on;
plot( xData, yData );
yFitted = feval(fitresult,xData);

[NaDPks, NaDLocs] = findpeaks(yFitted, xData, 'MinPeakProminence', .3, 'MinPeakDistance', 10);
findpeaks(yFitted, xData, 'MinPeakProminence', .3, 'MinPeakDistance', 10)
legend( 'Na D Lines Raw Data', 'Gaussian Fit', 'Peaks', 'Location', 'NorthEast' );
% Label axes
xlabel Time
ylabel Intensity
title 'Na D Lines for Calibration'
grid on

text(NaDLocs-3, NaDPks+.05, strcat("Time = ", num2str(NaDLocs)))
saveas(gcf,'Fig1.png')

% Convert X axis to angstroms
NaDLinesAngstroms = NaDLines{:,1} * 0.189632;

%% Plot with converted X axis

% Prep data
[xData, yData] = prepareCurveData( NaDLinesAngstroms, NaDLines{:,2} );

% Set up fittype and options.
ft = fittype( 'gauss2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0 -Inf -Inf 0];
opts.StartPoint = [0.772 0.859222592 0.478510326517328 0.668 6.807599168 0.363375946855546];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'Na D Lines for Calibration in Angstroms' );
hold on;
plot( xData, yData );
yFitted = feval(fitresult,xData);

[NaDPks, NaDLocs] = findpeaks(yFitted, xData, 'MinPeakProminence', .3, 'MinPeakDistance', 1)
findpeaks(yFitted, xData, 'MinPeakProminence', .3, 'MinPeakDistance', 1)
legend( 'Na D Lines Raw Data', 'Gaussian Fit', 'Peaks', 'Location', 'NorthEast' );
% Label axes
xlabel 'Position [Angstroms]'
ylabel 'Intensity [Arbitrary Units]'
title 'Na D Lines for Calibration in Angstroms'
grid on

text(NaDLocs-.6, NaDPks+.05, strcat("Pos = ", num2str(NaDLocs)))
saveas(gcf,'Fig2.png')


%% HD Alpha Data Import

HDA = readtable('HD_Alpha_run1.CSV', 'HeaderLines', 15);
HDA{:,2} = -HDA{:,2};
HDA{:,1} = HDA{:,1} + 20;
HDA{:,1} = HDA{:,1} * 0.189632;


%% Plot
[xData, yData] = prepareCurveData( HDA{:,1}, HDA{:,2} );

% Set up fittype and options.
ft = fittype( 'gauss2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0 -Inf -Inf 0];
opts.StartPoint = [0.45 1.875839744 0.216394053182048 0.274 3.62660201344 0.276606944601721];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'HD Alpha' );
hold on;
plot( xData, yData );

yFitted = feval(fitresult,xData);

[HDAPks, HDALocs] = findpeaks(yFitted, xData, 'MinPeakProminence', .1, 'MinPeakDistance', 1)
findpeaks(yFitted, xData, 'MinPeakProminence', .1, 'MinPeakDistance', 1)

legend( 'HD Alpha Raw Data', 'Gaussian Fit', 'Peaks', 'Location', 'NorthEast' );
% Label axes
xlabel 'Position [Angstroms]'
ylabel 'Intensity [Arbitrary Units]'
title 'HD Alpha'
grid on

text(HDALocs+.1, HDAPks, strcat("Pos = ", num2str(HDALocs)))
saveas(gcf,'Fig3.png')


%% HD Beta Data Import

HDB = readtable('HD_Beta_run1.CSV', 'HeaderLines', 15);
HDB{:,2} = -HDB{:,2};
HDB{:,1} = HDB{:,1} + 20;
HDB{:,1} = HDB{:,1} * 0.189632;


%% Plot
[xData, yData] = prepareCurveData( HDB{:,1}, HDB{:,2} );

% Set up fittype and options.
ft = fittype( 'gauss2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0 -Inf -Inf 0];
opts.StartPoint = [0.45 1.875839744 0.216394053182048 0.274 3.62660201344 0.276606944601721];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'HD Beta' );
hold on;
plot( xData, yData );

yFitted = feval(fitresult,xData);

[HDBPks, HDBLocs] = findpeaks(yFitted, xData, 'MinPeakProminence', .1, 'MinPeakDistance', 1)
findpeaks(yFitted, xData, 'MinPeakProminence', .1, 'MinPeakDistance', 1)

legend( 'HD Beta Raw Data', 'Gaussian Fit', 'Peaks', 'Location', 'NorthEast' );
% Label axes
xlabel 'Position [Angstroms]'
ylabel 'Intensity [Arbitrary Units]'
title 'HD Beta'
grid on

text(HDBLocs+.1, HDBPks, strcat("Pos = ", num2str(HDBLocs)))
saveas(gcf,'Fig4.png')

%% HD Delta Data Import

HDD = readtable('HD_Delta_run1.CSV', 'HeaderLines', 15);
HDD{:,2} = -HDD{:,2};
HDD{:,1} = HDD{:,1} + 20;
HDD{:,1} = HDD{:,1} * 0.189632;


%% Plot
[xData, yData] = prepareCurveData( HDD{:,1}, HDD{:,2} );

% Set up fittype and options.
ft = fittype( 'gauss2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0 -Inf -Inf 0];
opts.StartPoint = [0.0654 2.4672640256 0.229562758725355 0.0413999999884987 3.5552396992 0.388933995825161];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'HD Delta' );
hold on;
plot( xData, yData );

yFitted = feval(fitresult,xData);

[HDDPks, HDDLocs] = findpeaks(yFitted, xData, 'MinPeakProminence', .01, 'MinPeakDistance', 1)
findpeaks(yFitted, xData, 'MinPeakProminence', .01, 'MinPeakDistance', 1)

legend( 'HD Delta Raw Data', 'Gaussian Fit', 'Peaks', 'Location', 'NorthEast' );
% Label axes
xlabel 'Position [Angstroms]'
ylabel 'Intensity [Arbitrary Units]'
title 'HD Delta'
grid on

text(HDDLocs+.1, HDDPks, strcat("Pos = ", num2str(HDDLocs)))
saveas(gcf,'Fig5.png')

%% HD Gamma Data Import

HDG = readtable('HD_Gamma_run1.CSV', 'HeaderLines', 15);
HDG{:,2} = -HDG{:,2};
HDG{:,1} = HDG{:,1} + 20;
HDG{:,1} = HDG{:,1} * 0.189632;


%% Plot
[xData, yData] = prepareCurveData( HDG{:,1}, HDG{:,2} );

% Set up fittype and options.
ft = fittype( 'gauss2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0 -Inf -Inf 0];
opts.StartPoint = [0.0654 2.4672640256 0.229562758725355 0.0413999999884987 3.5552396992 0.388933995825161];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'HD Gamma' );
hold on;
plot( xData, yData );

yFitted = feval(fitresult,xData);

[HDGPks, HDGLocs] = findpeaks(yFitted, xData, 'MinPeakProminence', .01, 'MinPeakDistance', 1)
findpeaks(yFitted, xData, 'MinPeakProminence', .01, 'MinPeakDistance', 1)

legend( 'HD Gamma Raw Data', 'Gaussian Fit', 'Peaks', 'Location', 'NorthEast' );
% Label axes
xlabel 'Position [Angstroms]'
ylabel 'Intensity [Arbitrary Units]'
title 'HD Gamma'
grid on

text(HDGLocs+.1, HDGPks, strcat("Pos = ", num2str(HDGLocs)))
saveas(gcf,'Fig6.png')

%% HD Epsilon Data Import

HDE1 = readtable('HD-Epsilon_run1.CSV', 'HeaderLines', 15);
HDE1{:,2} = -HDE1{:,2};
HDE1{:,1} = HDE1{:,1} + 20;
HDE1{:,1} = HDE1{:,1} * 0.189632;

HDE2 = readtable('HD-Epsilon_run2.CSV', 'HeaderLines', 15);
HDE2{:,2} = -HDE2{:,2};
HDE2{:,1} = HDE2{:,1} + 20;
HDE2{:,1} = HDE2{:,1} * 0.189632;


%% Plot E1
[xData, yData] = prepareCurveData( HDE1{:,1}, HDE1{:,2} );

% Set up fittype and options.
ft = fittype( 'gauss3' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0 -Inf -Inf 0 -Inf -Inf 0];
opts.StartPoint = [0.01172 2.8532220352 0.207107224382333 0.00843999999999098 3.94702510016 0.316676701781134 0.0064373512598506 3.0804201344 0.387913188942895];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'HD Epsilon' );
hold on;
plot( xData, yData );

yFitted = feval(fitresult,xData);

[HDE1Pks, HDE1Locs] = findpeaks(yFitted, xData, 'MinPeakProminence', .002, 'MinPeakDistance', 1)
findpeaks(yFitted, xData, 'MinPeakProminence', .002, 'MinPeakDistance', 1)

text(HDE1Locs+.1, HDE1Pks, strcat("Pos = ", num2str(HDE1Locs)))

%% Plot E1
[xData, yData] = prepareCurveData( HDE2{:,1}, HDE2{:,2} );

% Set up fittype and options.
ft = fittype( 'gauss3' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0 -Inf -Inf 0 -Inf -Inf 0];
opts.StartPoint = [0.01404 2.489109632 0.180194328042894 0.00907999999999999 3.562521568 0.296193604609126 0.00881843268642467 2.190534048 0.301626099059969];


% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
plot( xData, yData );

yFitted = feval(fitresult,xData);

[HDE2Pks, HDE2Locs] = findpeaks(yFitted, xData, 'MinPeakProminence', .002, 'MinPeakDistance', 1)
findpeaks(yFitted, xData, 'MinPeakProminence', .002, 'MinPeakDistance', 1)

legend( 'HD Epsilon Raw Data Run 1', 'Gaussian Fit Run 1', 'Peaks Run1','HD Epsilon Raw Data Run 2', 'Gaussian Fit Run 2', 'Peaks Run2', 'Location', 'NorthWest' );
% Label axes
xlabel 'Position [Angstroms]'
ylabel 'Intensity [Arbitrary Units]'
title 'HD Epsilon'
grid on

text(HDE2Locs+.1, HDE2Pks, strcat("Pos = ", num2str(HDE2Locs)))
saveas(gcf,'Fig7.png')