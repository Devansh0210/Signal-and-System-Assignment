clear all;
clf;
clc;
s = tf('s');
N = 8; % Order of Butterworth Filter
p2 = exp(sqrt(-1)*(pi*(1:2:2*N-1)/(2*N) + pi/2)); % Poles of butterworth filter
Bs = 1;
for j = 1:N
    Bs = Bs * (1/(s-p2(j)));
end
b1 = Bs.Denominator{1}; 
Bs.Denominator = {real(Bs.Denominator{1})};  % ignoring imaginary terms because of order of 1e-15

% 4a) ----------------
h1 = pzplot(Bs); % Plotting Pole-Zero of B(s)
h1.AxesGrid.YUnits = '';
h1.AxesGrid.XUnits = ''; 
h1.AxesGrid.BackgroundAxes.Title.Interpreter = 'Latex';
h1.AxesGrid.BackgroundAxes.XLabel.Interpreter = 'Latex'; 
h1.AxesGrid.BackgroundAxes.YLabel.Interpreter = 'Latex'; 
p1 = getoptions(h1);
p1.Title.String = "Pole Zero Plot of $B(s)$";
p1.XLabel.Interpreter = "latex";
p1.XLabel.String = "$\mathrm{Re}(s)$";
p1.Title.Interpreter = "latex";
p1.YLabel.String = "$\mathrm{Im}(s)$";
p1.YLabel.Interpreter = 'latex';
p1.XLim = {[-1 1]};

ax1 = gca;
ax1.XGrid = 'on';
ax1.YGrid = 'on';
hold on;
theta = -pi/2:0.001:pi/2;
plot(-cos(theta), sin(theta), 'g--'); % Drawing left-half circle
hold off
setoptions(h1, p1);
Bs_ = 1; % B(-s)
for j = 1:N
    Bs_ = Bs_ * (1/(-s - p2(j)));
end
Bs_.Denominator = {real(Bs_.Denominator{1})};

B = Bs*Bs_;  % B(s)B(-s)

% 4b) ------------
figure;
h3 = pzplot(B);
B.Denominator = {B.Denominator{1}.*(abs(B.Denominator{1})>1e-7)}; %ignoring small terms

h3.AxesGrid.YUnits = '';
h3.AxesGrid.XUnits = ''; 
h3.AxesGrid.BackgroundAxes.Title.Interpreter = 'Latex';
h3.AxesGrid.BackgroundAxes.XLabel.Interpreter = 'Latex'; 
h3.AxesGrid.BackgroundAxes.YLabel.Interpreter = 'Latex'; 
p3 = getoptions(h3);
p3.Title.String = "Pole Zero Diagram of $B(s)B(-s)$";
p3.Title.Interpreter = 'latex';
p3.XLabel.Interpreter = 'latex';
p3.XLabel.String = "$\mathrm{Re}(s)$";
p3.YLabel.String = "$\mathrm{Im}(s)$";
p3.YLabel.Interpreter = "latex";
ax2 = gca;
ax2.XGrid = 'on';
ax2.YGrid = 'on';

hold on;
theta = -pi:0.001:pi;
plot(cos(theta), sin(theta), 'g--');
hold off
setoptions(h3, p3);

% 4c) ---------------------
	display(Bs) % Displaying B(s)