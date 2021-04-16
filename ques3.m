clear all;
clf;
clc;

t1 = 5; % Parameter 
t2 = 8; % Parameter
t = -1:0.001:1; % Time range

x1 = heaviside(t + 0.3) - heaviside(t - 0.1*t1); % Signal x₁(t) = u(t+0.3) - u(t - 0.1t₁)
x2 = heaviside(t + 0.5) - heaviside(t - 0.1*t2); % Signal x₂(t) = u(t+0.5) - u(t - 0.1t₂)
y = conv(x1, x2)*0.001; % Convolution of x₁(t) and x₂(t)
tnet = -2:0.001:2; % Time vector for y(t), 
% which can be obtained by summing endpoints of both the signals

f = gcf; % current figure
f.Position = f.Position + [0 -200 0 200];
ax1 = subplot(4,1,1);
p1 = plot(t, x1); % Plotting x₁(t)
grid on;
xlabel('time', "Interpreter","latex");
ylabel('Amplitude', "Interpreter","latex");
title("$x_1(t)$", "Interpreter","latex");

ax2 = subplot(4,1,2);
p2 = plot(t, x2); % Plotting x₂(t)
grid on;
xlabel('time', "Interpreter","latex");
ylabel('Amplitude', "Interpreter","latex");
title("$x_2(t)$", "Interpreter","latex");

ax3 = subplot(4,1,[3, 4]); % Merging two tiles for better visibility
p3 = plot(tnet, y); % Ploting y(t) = x1(t)*x2(t)
datatip(p3, -0.8, 0, 'Location', 'northwest'); 
datatip(p3, 0, 0.8, 'Location','southwest'); 
datatip(p3, 0.5, 0.8, 'Location','northeast'); 
datatip(p3, 1.3, 0, 'Location','northeast');
ax3pos = ax3.Position + [0 -0.03 0 0];

xlabel(ax3, 'time', "Interpreter","latex");
ylabel(ax3, 'Amplitude', "Interpreter","latex");
title(ax3, "$y(t)=x_1(t)*x_2(t)$", "Interpreter","latex");
ax3.XGrid = 'on';
ax3.YGrid = 'on';
ax3.Position = ax3pos;