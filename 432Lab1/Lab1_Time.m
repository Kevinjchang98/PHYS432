close all; clear all; clc;
warning('off')
diary consoleOutputTime.txt

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
    coeffs = coeffvalues(fitresult);
    ci = confint(fitresult);
    pos1 = coeffs(1,2);
    uncert1 = ci(2,2) - ci(1,2);
    pos2 = coeffs(1,5);
    uncert2 = ci(2,5) - ci(1,5);
    
    disp('NaD Lines, Time')
    disp([num2str(pos1), ' ', char(177), ' ', num2str(uncert1)])
    disp([num2str(pos2), ' ', char(177), ' ', num2str(uncert2)])
    
    

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
saveas(gcf,'Fig1-Time.png')


%% HD Alpha Data Import

HDA = readtable('HD_Alpha_run1.CSV', 'HeaderLines', 15);
HDA{:,2} = -HDA{:,2};
HDA{:,1} = HDA{:,1} + 20;
HDA{:,1} = HDA{:,1};


%% Plot
[xData, yData] = prepareCurveData( HDA{:,1}, HDA{:,2} );

% Set up fittype and options.
ft = fittype( 'gauss2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0 -Inf -Inf 0];
opts.StartPoint = [0.45 9.892 1.14112625074907 0.274 19.12442 1.45865120128312];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );
    coeffs = coeffvalues(fitresult);
    ci = confint(fitresult);
    pos1 = coeffs(1,2);
    uncert1 = ci(2,2) - ci(1,2);
    pos2 = coeffs(1,5);
    uncert2 = ci(2,5) - ci(1,5);
    
    disp('HD Alpha')
    disp([num2str(pos1), ' ', char(177), ' ', num2str(uncert1)])
    disp([num2str(pos2), ' ', char(177), ' ', num2str(uncert2)])

% Plot fit with data.
figure( 'Name', 'HD Alpha' );
hold on;
plot( xData, yData );

yFitted = feval(fitresult,xData);

[HDAPks, HDALocs] = findpeaks(yFitted, xData, 'MinPeakProminence', .1, 'MinPeakDistance', 1);
findpeaks(yFitted, xData, 'MinPeakProminence', .1, 'MinPeakDistance', 1)

legend( 'HD Alpha Raw Data', 'Gaussian Fit', 'Peaks', 'Location', 'NorthEast' );
% Label axes
xlabel 'Time [s]'
ylabel 'Intensity [Arbitrary Units]'
title 'HD Alpha'
grid on

text(HDALocs+.1, HDAPks, strcat("Time = ", num2str(HDALocs)));
saveas(gcf,'Fig3-Time.png')


%% HD Beta Data Import

HDB = readtable('HD_Beta_run1.CSV', 'HeaderLines', 15);
HDB{:,2} = -HDB{:,2};
HDB{:,1} = HDB{:,1} + 20;
HDB{:,1} = HDB{:,1};


%% Plot
[xData, yData] = prepareCurveData( HDB{:,1}, HDB{:,2} );

% Set up fittype and options.
ft = fittype( 'gauss2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0 -Inf -Inf 0];
opts.StartPoint = [0.554 13.8018 1.00794943317294 0.314 20.51459 1.50272491394115];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );
    coeffs = coeffvalues(fitresult);
    ci = confint(fitresult);
    pos1 = coeffs(1,2);
    uncert1 = ci(2,2) - ci(1,2);
    pos2 = coeffs(1,5);
    uncert2 = ci(2,5) - ci(1,5);
    
    disp('HD Beta')
    disp([num2str(pos1), ' ', char(177), ' ', num2str(uncert1)])
    disp([num2str(pos2), ' ', char(177), ' ', num2str(uncert2)])

% Plot fit with data.
figure( 'Name', 'HD Beta' );
hold on;
plot( xData, yData );

yFitted = feval(fitresult,xData);

[HDBPks, HDBLocs] = findpeaks(yFitted, xData, 'MinPeakProminence', .1, 'MinPeakDistance', 1);
findpeaks(yFitted, xData, 'MinPeakProminence', .1, 'MinPeakDistance', 1)

legend( 'HD Beta Raw Data', 'Gaussian Fit', 'Peaks', 'Location', 'NorthEast' );
% Label axes
xlabel 'Time [s]'
ylabel 'Intensity [Arbitrary Units]'
title 'HD Beta'
grid on

text(HDBLocs+.1, HDBPks, strcat("Time = ", num2str(HDBLocs)));
saveas(gcf,'Fig4-Time.png')

%% HD Delta Data Import

HDD = readtable('HD_Delta_run1.CSV', 'HeaderLines', 15);
HDD{:,2} = -HDD{:,2};
HDD{:,1} = HDD{:,1} + 20;
HDD{:,1} = HDD{:,1};


%% Plot
[xData, yData] = prepareCurveData( HDD{:,1}, HDD{:,2} );

% Set up fittype and options.
ft = fittype( 'gauss2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0 -Inf -Inf 0];
opts.StartPoint = [0.0654 13.0108 1.21056972834414 0.0413999999884987 18.7481 2.05099348119075];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );
    coeffs = coeffvalues(fitresult);
    ci = confint(fitresult);
    pos1 = coeffs(1,2);
    uncert1 = ci(2,2) - ci(1,2);
    pos2 = coeffs(1,5);
    uncert2 = ci(2,5) - ci(1,5);
    
    disp('HD Delta')
    disp([num2str(pos1), ' ', char(177), ' ', num2str(uncert1)])
    disp([num2str(pos2), ' ', char(177), ' ', num2str(uncert2)])

% Plot fit with data.
figure( 'Name', 'HD Delta' );
hold on;
plot( xData, yData );

yFitted = feval(fitresult,xData);

[HDDPks, HDDLocs] = findpeaks(yFitted, xData, 'MinPeakProminence', .01, 'MinPeakDistance', 1);
findpeaks(yFitted, xData, 'MinPeakProminence', .01, 'MinPeakDistance', 1)

legend( 'HD Delta Raw Data', 'Gaussian Fit', 'Peaks', 'Location', 'NorthEast' );
% Label axes
xlabel 'Time [s]'
ylabel 'Intensity [Arbitrary Units]'
title 'HD Delta'
grid on

text(HDDLocs+.1, HDDPks, strcat("Time = ", num2str(HDDLocs)));
saveas(gcf,'Fig5-Time.png')

%% HD Gamma Data Import

HDG = readtable('HD_Gamma_run1.CSV', 'HeaderLines', 15);
HDG{:,2} = -HDG{:,2};
HDG{:,1} = HDG{:,1} + 20;
HDG{:,1} = HDG{:,1};


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
    coeffs = coeffvalues(fitresult);
    ci = confint(fitresult);
    pos1 = coeffs(1,2);
    uncert1 = ci(2,2) - ci(1,2);
    pos2 = coeffs(1,5);
    uncert2 = ci(2,5) - ci(1,5);
    
    disp('HD Gamma')
    disp([num2str(pos1), ' ', char(177), ' ', num2str(uncert1)])
    disp([num2str(pos2), ' ', char(177), ' ', num2str(uncert2)])

% Plot fit with data.
figure( 'Name', 'HD Gamma' );
hold on;
plot( xData, yData );

yFitted = feval(fitresult,xData);

[HDGPks, HDGLocs] = findpeaks(yFitted, xData, 'MinPeakProminence', .01, 'MinPeakDistance', 1);
findpeaks(yFitted, xData, 'MinPeakProminence', .01, 'MinPeakDistance', 1)

legend( 'HD Gamma Raw Data', 'Gaussian Fit', 'Peaks', 'Location', 'NorthEast' );
% Label axes
xlabel 'Time [s]'
ylabel 'Intensity [Arbitrary Units]'
title 'HD Gamma'
grid on

text(HDGLocs+.1, HDGPks, strcat("Time = ", num2str(HDGLocs)))
saveas(gcf,'Fig6-Time.png')

%% HD Epsilon Data Import

HDE1 = readtable('HD-Epsilon_run1.CSV', 'HeaderLines', 15);
HDE1{:,2} = -HDE1{:,2};
HDE1{:,1} = HDE1{:,1} + 20;
HDE1{:,1} = HDE1{:,1};

HDE2 = readtable('HD-Epsilon_run2.CSV', 'HeaderLines', 15);
HDE2{:,2} = -HDE2{:,2};
HDE2{:,1} = HDE2{:,1} + 20;
HDE2{:,1} = HDE2{:,1};


%% Plot E1
[xData, yData] = prepareCurveData( HDE1{:,1}, HDE1{:,2} );

% Set up fittype and options.
ft = fittype( 'gauss3' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0 -Inf -Inf 0 -Inf -Inf 0];
opts.StartPoint = [0.01172 15.0461 1.09215335166182 0.00843999999999098 20.81413 1.66995392012494 0.00643735125985056 16.2442 2.04561038718622];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );
    coeffs = coeffvalues(fitresult);
    ci = confint(fitresult);
    pos1 = coeffs(1,2);
    uncert1 = ci(2,2) - ci(1,2);
    pos2 = coeffs(1,5);
    uncert2 = ci(2,8) - ci(1,8);
    
    disp('HD Gamma Run 1')
    disp([num2str(pos1), ' ', char(177), ' ', num2str(uncert1)])
    disp([num2str(pos2), ' ', char(177), ' ', num2str(uncert2)])

    
% Plot fit with data.
figure( 'Name', 'HD Epsilon' );
hold on;
plot( xData, yData );

yFitted = feval(fitresult,xData);

[HDE1Pks, HDE1Locs] = findpeaks(yFitted, xData, 'MinPeakProminence', .002, 'MinPeakDistance', 1);
findpeaks(yFitted, xData, 'MinPeakProminence', .002, 'MinPeakDistance', 1)

text(HDE1Locs+.1, HDE1Pks, strcat("Time = ", num2str(HDE1Locs)))

%% Plot E1
[xData, yData] = prepareCurveData( HDE2{:,1}, HDE2{:,2} );

% Set up fittype and options.
ft = fittype( 'gauss3' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0 -Inf -Inf 0 -Inf -Inf 0];
opts.StartPoint = [0.01404 13.126 0.950231648893089 0.00907999999999999 18.7865 1.56193893756922 0.00881843268642466 11.5515 1.59058649943031];


% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );
    coeffs = coeffvalues(fitresult);
    ci = confint(fitresult);
    pos1 = coeffs(1,2);
    uncert1 = ci(2,2) - ci(1,2);
    pos2 = coeffs(1,5);
    uncert2 = ci(2,8) - ci(1,8);
    
    disp('HD Gamma Run 2')
    disp([num2str(pos1), ' ', char(177), ' ', num2str(uncert1)])
    disp([num2str(pos2), ' ', char(177), ' ', num2str(uncert2)])

% Plot fit with data.
plot( xData, yData );

yFitted = feval(fitresult,xData);

[HDE2Pks, HDE2Locs] = findpeaks(yFitted, xData, 'MinPeakProminence', .002, 'MinPeakDistance', 1);
findpeaks(yFitted, xData, 'MinPeakProminence', .002, 'MinPeakDistance', 1)

legend( 'HD Epsilon Raw Data Run 1', 'Gaussian Fit Run 1', 'Peaks Run1','HD Epsilon Raw Data Run 2', 'Gaussian Fit Run 2', 'Peaks Run2', 'Location', 'NorthWest' );
% Label axes
xlabel 'Time [s]'
ylabel 'Intensity [Arbitrary Units]'
title 'HD Epsilon'
grid on

text(HDE2Locs+.1, HDE2Pks, strcat("Time = ", num2str(HDE2Locs)))
saveas(gcf,'Fig7-Time.png')

%% Export console

diary off
type consoleOutput.txt