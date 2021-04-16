s = tf('s'); % 's' parameter

% Poles = [-5, -8 + j2]
% Zeros = [-2.5, 2]

sys = (s+2.5)*(s-2)/(s+5)/(s+8-2i)/(s+8+2i);

% sys = 
%            (s + 2.5)(s - 2) 
%  --------------------------------------
%     (s + 5)(s + 8 - 2j)(s + 8 + 2j) 
% 
% Continous Time Transfer Function

figure;
h = pzplot(sys); % Generating pole-zero plot handle

h.AxesGrid.YUnits = '';
h.AxesGrid.XUnits = ''; 
h.AxesGrid.BackgroundAxes.Title.Interpreter = 'Latex';
h.AxesGrid.BackgroundAxes.XLabel.Interpreter = 'Latex'; 
h.AxesGrid.BackgroundAxes.YLabel.Interpreter = 'Latex';

p = getoptions(h); % getting properties option for customizing plot
p.XLim = {[-10, 4]}; % Setting X-Limits
p.YLim = {[-2.5, 2.5]}; % Setting Y-Limits

p.Title.String = "Pole Zero Diagram of $x(t)$";
p.Title.Interpreter = 'latex';

p.XLabel.Interpreter = 'latex';
p.XLabel.String = "$\mathrm{Re}(s)$";
p.YLabel.String = "$\mathrm{Im}(s)$";
p.YLabel.Interpreter = "latex";

setoptions(h, p); % Applying properties 

ax = gca; % getting current axes for setting up Cartesian Grid
ax.XGrid = 'on'; ax.XMinorGrid = 'on'; % Turning Grid Lines On
ax.YGrid = 'on'; ax.YMinorGrid = 'on'; 

hold on 
patch([-5 4 4 -5], [-2.5 -2.5 2.5 2.5], 'green', 'FaceAlpha', 0.15) % Drawing ROC region
hold off