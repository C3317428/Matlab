clear all
i1 = double(imread("IMG_5704.JPG"));
i2 = double(imread("IMG_5703.JPG"));
i3 = double(imread("IMG_5702.JPG"));
i4 = double(imread("IMG_5701.JPG"));
i5 = double(imread("IMG_5700.JPG"));
i6 = double(imread("IMG_5699.JPG"));
i7 = double(imread("IMG_5698.JPG"));

Dark = imread("dark.png");

pic = uint8((i1+i2+i3+i4+i5+i6+i7)./7) - Dark;

indices = find(abs(pic) < 30);
pic(indices) = 0;

Blur = imgaussfilt(pic,4);

y = double (pic - Blur);
y = y.*10;
pic = double(pic);
Final = uint8(y + pic);
pic = uint8(pic);
figure(1)
image(pic)
figure(2)
image(Blur)
figure(3)
image(Final)
title("When you low-key want to die but you have to pretend everything is okay")