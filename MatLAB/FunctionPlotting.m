clear all
k = 1;
f = 2;
t = 5;
r = 1000;

%% Creates an array for time starting at 0 and ending at 5 with 1000 values
x = linspace(0,t,r);
%% Creates an array for time starting at 0 and ending at 5 with 1000 values
y = linspace(0,t,r);
%% Calculates the Voltage
y = (exp(-k .*x)) .* sin(2 .* pi .* f .*x); 
%% Plots the Damped Decay
plot(x,y)
title("Damped Decay")
xlabel("Time (s)") 
ylabel("Voltage (V)")