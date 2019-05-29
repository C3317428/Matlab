clear all
picture = imread("Reality.jpg");
Resized = picture([1:25:end],[1:25:end],[1:3]);

image(Resized)
title("When Brenton lets you use any image for the MatLab Tasks")