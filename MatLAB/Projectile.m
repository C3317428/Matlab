clear all
Vi = 150;
g = -9.8;
theta = pi / 4;
t = -(2 * Vi * sin(theta)) / g;
x = (0:0.01:t);
x = Vi * x * cos(theta);
y = (0:0.01:t);
y = Vi * y * sin(theta) + 0.5 * g * y.^2;
plot(x,y)