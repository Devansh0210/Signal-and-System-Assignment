tstart = 0;
tend = 5e-3;
tmid = 3e-3;
A = 5; % Amplitude
Fs = 800e3; % Sampling Frequency
f = 1158; %% Signal Frequency
tp = tstart:1/Fs:tmid; %% 0 ≤ t < 3ses
ts = tstart:1/Fs:tend; %% 0 ≤ t ≤ 5sec
x = A*cos(2*pi*f*tp); %% A*cos(2π*f*t) 
x = [x zeros([1 (tend-tmid)*Fs])]; %% for 3 ≤ t ≤ 5

figure %% initializing figure
plot(ts, x); xlabel("Time(s)");ylabel("Amplitude(V)");legend("x(t)"); grid;title("Signal $x(t)$", "Interpreter","latex")

b = 8e-3; %% Parameter "b" -> ID : 2019A3PS0158P => b = 8ms
t3 = (b-ts)*2; %% Tranformed time-range for signal x₁(t) = x(-t/2 + b) 
t2 = ts-b; %% Transformed time-range for signal  x₂(t) = x(t+b)

figure %% initializing figure

subplot(3,1,1) %% Plot of x(t)
plot(ts, x); title("$x(t)$", "Interpreter","latex")
ylabel("Amplitude(V)","Interpreter","latex")
xlabel("$t$","Interpreter","latex")
grid

subplot(3,1,2) %% Plot of x₂(t) = x(t+b)
plot(t2, x); title("$x_2(t) = x(t + b)$", "Interpreter","latex")
ylabel("Amplitude(V)","Interpreter","latex")
xlabel("$t$","Interpreter","latex")
grid

subplot(3,1,3) %% Plot of x₁(t) = x(-t/2 + b)
plot(t3, x); title("$x_1(t) = x(-\frac{t}{2} + b)$", "Interpreter","latex")
grid
ylabel("Amplitude(V)","Interpreter","latex")
xlabel("$t$","Interpreter","latex")