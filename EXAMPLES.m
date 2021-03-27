%% Copyright (c) 2021 Tamas Kis

% Examples for using the least_squares_fit function.



%% SCRIPT SETUP

% clears variables and command window, closes all figures
clear;
clc;
close all;



%% LINEAR FIT

% data (https://www.mathsisfun.com/data/least-squares-regression.html)
x = [2,3,5,7,9];
y = [4,5,7,10,15];

% performs linear least squares fit
[c0,c1] = least_squares_fit(x,y);
%[c0,c1] = least_squares_fit(x,y,'linear');

% vectors for least squares fit
x_fit = min(x):((max(x)-min(x))/1000):max(x);
y_fit = c0+c1*x_fit;

% plot
figure;
hold on;
plot(x,y,'ko','markersize',7,'linewidth',1.5);
plot(x_fit,y_fit,'color',[140,21,21]/255,'linewidth',1.5);
hold off;
grid on;
xlabel('$x$','interpreter','latex','fontsize',18);
ylabel('$y$','interpreter','latex','fontsize',18);
legend('data','linear least squares fit','interpreter','latex',...
    'fontsize',14,'location','best');



%% POLYNOMIAL FIT

% data (https://mste.illinois.edu/malcz/ExpFit/FIRST.html)
x = 0:1:16;
y = [8.3,11,14.7,19.7,26.7,35.2,44.4,55.9,68.9,83.2,98.8,114.2,127.1,...
    140.1,164,190.9,214.3];

% performs polynomial least squares fit
c = least_squares_fit(x,y,'poly',2);

% extracts coefficients from coefficient vector
c0 = c(1);
c1 = c(2);
c2 = c(3);

% vectors for least squares fit
x_fit = min(x):((max(x)-min(x))/1000):max(x);
y_fit = c0+c1*x_fit+c2*x_fit.^2;

% plot
figure;
hold on;
plot(x,y,'ko','markersize',7,'linewidth',1.5);
plot(x_fit,y_fit,'color',[140,21,21]/255,'linewidth',1.5);
hold off;
grid on;
xlabel('$x$','interpreter','latex','fontsize',18);
ylabel('$y$','interpreter','latex','fontsize',18);
legend('data','polynomial least squares fit','interpreter','latex',...
    'fontsize',14,'location','best');



%% POWER FIT

% data (https://www.mathworks.com/matlabcentral/answers/65624-curve-fitting-a-power-function)
x = [0.5,2.4,3.2,4.9,6.5,7.8];
y = [0.8,9.3,37.9,68.2,155,198];

% performs power least squares fit
[a,b] = least_squares_fit(x,y,'power');

% vectors for least squares fit
x_fit = min(x):((max(x)-min(x))/1000):max(x);
y_fit = a*x_fit.^b;

% plot
figure;
hold on;
plot(x,y,'ko','markersize',7,'linewidth',1.5);
plot(x_fit,y_fit,'color',[140,21,21]/255,'linewidth',1.5);
hold off;
grid on;
xlabel('$x$','interpreter','latex','fontsize',18);
ylabel('$y$','interpreter','latex','fontsize',18);
legend('data','power least squares fit','interpreter','latex',...
    'fontsize',14,'location','best');



%% EXPONENTIAL FIT

% data (https://mste.illinois.edu/malcz/ExpFit/FIRST.html)
x = 0:1:16;
y = [8.3,11,14.7,19.7,26.7,35.2,44.4,55.9,68.9,83.2,98.8,114.2,127.1,...
    140.1,164,190.9,214.3];

% performs exponential least squares fit
[a,b] = least_squares_fit(x,y,'exp');

% vectors for least squares fit
x_fit = min(x):((max(x)-min(x))/1000):max(x);
y_fit = a*exp(b*x_fit);

% plot
figure;
hold on;
plot(x,y,'ko','markersize',7,'linewidth',1.5);
plot(x_fit,y_fit,'color',[140,21,21]/255,'linewidth',1.5);
hold off;
grid on;
xlabel('$x$','interpreter','latex','fontsize',18);
ylabel('$y$','interpreter','latex','fontsize',18);
legend('data','exponential least squares fit','interpreter','latex',...
    'fontsize',14,'location','best');



%% LOGARITHMIC FIT

% data (https://stackoverflow.com/questions/3433486/how-to-do-exponential-and-logarithmic-curve-fitting-in-python-i-found-only-poly)
x = [1,7,20,50,79];
y = [10,19,30,35,51];

% performs logarithmic least squares fit
[a,b] = least_squares_fit(x,y,'log');

% vectors for least squares fit
x_fit = min(x):((max(x)-min(x))/1000):max(x);
y_fit = a+b*log(x_fit);

% plot
figure;
hold on;
plot(x,y,'ko','markersize',7,'linewidth',1.5);
plot(x_fit,y_fit,'color',[140,21,21]/255,'linewidth',1.5);
hold off;
grid on;
xlabel('$x$','interpreter','latex','fontsize',18);
ylabel('$y$','interpreter','latex','fontsize',18);
legend('data','logarithmic least squares fit','interpreter','latex',...
    'fontsize',14,'location','best');