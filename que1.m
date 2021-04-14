tstart = 0;
tend = 5e-3;
tmid = 3e-3;
A = 5; 
Fs = 800e3; 
f = 1158; 
tp = tstart:1/Fs:tmid;
ts = tstart:1/Fs:tend;
x = A*cos(2*pi*f*tp); 
x = [x zeros([1 (tend-tmid)*Fs])];

figure;
plot(ts, x); xlabel("Time(s)");ylabel("Amplitude(V)");legend("x(t)"); grid;title("Signal x(t)")

------

b = 8e-3; %% Parameter "b" -> ID : 2019A3PS0158P => b = 8ms
t3 = (b-ts)*2; %% Tranformed time-range for signal x₁(t) = x(-t/2 + b) 
t2 = ts-b; %% Transformed time-range for signal  x₂(t) = x(t+b)

figure %% initializing figure

subplot(3,1,1)

plot(ts, x); title("x(t)")
ylabel("Amplitude(V)")
xlabel("t")
grid

subplot(3,1,2)
plot(t2, x); title("x2(t) = x(t + b)")
ylabel("Amplitude(V)")
xlabel("t")
grid

subplot(3,1,3)
plot(t3, x); title("x1(t) = x(-t/2 + b)")
grid
ylabel("Amplitude(V)")
xlabel("t")