% Thaddeus Hughes
% I pledge this is my code

clear all
clc
close all

% Graphics settings... not sure these do anything
% set(gcf, 'renderer', 'opengl');
% set(gca, 'XTickLabel', num2str(get(gca, 'XTick'), '%.9f'));
tempData = importdata('TerreHauteRegional.dat',' ');
temps = tempData(:,2);
dates = tempData(:,1);
dates=dates-dates(1);

length = size(temps,1);

omega=2*pi/365.25;
d=1:length;
d=d(:);
T=temps(:);

% Set up Q matrix
Q=ones(length,4);
Q(:,1)=1;
Q(:,2)=d;
Q(:,3)=cos(omega*d);
Q(:,4)=sin(omega*d);

% Solve for coefficients
alpha = (Q'*Q)\(Q'*T);

% The fit
T_fit = alpha(1) + alpha(2)*d + alpha(3)*cos(omega*d) + alpha(4)*sin(omega*d);
fprintf('The best fit is %.5f + %.5f*d + %.5f*cos(2*pi/365.25*d) + %.5f*sin(2*pi/365.25*d)\n', alpha(1),alpha(2),alpha(3),alpha(4));

% Plot
plot(d,T,'o');
hold on
plot(d,T_fit);
xlabel('Day');
ylabel('Temperature (Farenheit)');
title('Terre Haute Temperature');
legend('Raw Data','Fit Line');