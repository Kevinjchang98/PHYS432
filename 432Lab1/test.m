close all; clear all; clc;

y=[1.755; 1.268; .951; 1.105]
dy = [.003; .003; .004; .008]

x=[6562.852; 4861.33;4340.47 ;4101.74]

[xData, yData, weights] = prepareCurveData( x, y, dy );

% Set up fittype and options.
ft = fittype( 'poly1' );
opts = fitoptions( 'Method', 'LinearLeastSquares' );
opts.Weights = weights;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts )

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, xData, yData );
hold on
errorbar(x, y, dy)
legend( h, 'y vs. x with dy', 'untitled fit 1', 'Location', 'NorthEast' );
% Label axes
xlabel x
ylabel y
grid on

