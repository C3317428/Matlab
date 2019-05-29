clear all
CamDistance1 = 1;
CamDistance2 = 1;
DiagDistance1 = 0;
DiagDistance2 = 0;
VertFOV = 60;
HorizFOV = 80;
DiagFOV = sqrt(VertFOV^2 + HorizFOV^2);
%DetectTempRange ?40oC to 382oC
Resol = 0.026;
%The sensor returns an array of thermal intensities as an integer level represented by 8 bits.
c = newline;
T1 = imread("T1.png");
T2 = imread("T2.png");

threshold = 0.1;

BWs = edge(T1,'sobel',threshold * Resol);
se90 = strel('line',3,90);
se0 = strel('line',3,0);
BWsdil = imdilate(BWs,[se90 se0]);
BWdfill = imfill(BWsdil,'holes');
BWnobord = imclearborder(BWdfill,4);
seD = strel('diamond',1);
BWfinal = imerode(BWnobord,seD);
BWfinal = imerode(BWfinal,seD);
BWoutline = bwperim(BWfinal);
Segout = T1; 
Segout(BWoutline) = 255; 

[center1, radius1, metric1] = imfindcircles(Segout,[1 30]);
Area1 = pi * radius1^2;

DiaLengthofCanvas = 2 * CamDistance1 * abs(tan(DiagFOV / 2));
PixelLength = DiaLengthofCanvas / DiagFOV;

DiagFromCenter = sqrt(center1(1)^2 + center1(2)^2);

DiagCenDistance = PixelLength * DiagFromCenter;
radiusActual = PixelLength * radius1;

AreaActual = PixelLength^2 * Area1;

figure(1)
imshow(Segout)
title('Task 1')
xlabel("X,Y = ("+round(center1(1))+","+round(center1(2))+")  Radius = "...
        +round(radius1)+" pixels  Area = "+round(Area1)+" pixels^2  "...
        +c+"Diagonal Distance of center = "+DiagCenDistance+" m"+c+ "Radius = "...
        + radiusActual+ " m  Area = " + AreaActual + " m^2")


BWs = edge(T2,'sobel',threshold * Resol);
se90 = strel('line',3,90);
se0 = strel('line',3,0);
BWsdil = imdilate(BWs,[se90 se0]);
BWdfill = imfill(BWsdil,'holes');
BWnobord = imclearborder(BWdfill,4);
seD = strel('diamond',1);
BWfinal = imerode(BWnobord,seD);
BWfinal = imerode(BWfinal,seD);
BWoutline = bwperim(BWfinal);
Segout = T2; 
Segout(BWoutline) = 255; 

[center2, radius2, metric2] = imfindcircles(Segout,[1 30]);
Area2 = pi * radius2(1)^2;

DiaLengthofCanvas = 2 * CamDistance2 * abs(tan(DiagFOV / 2));
PixelLength = DiaLengthofCanvas / DiagFOV;

DiagFromCenter = sqrt(center2(1,1)^2 + center2(1,2)^2);

DiagCenDistance = PixelLength * DiagFromCenter;
radiusActual = PixelLength * radius2(1);

AreaActual = PixelLength^2 * Area2;
c = newline;

figure(2)
imshow(Segout)
title('Task 2')
xlabel("X,Y = ("+round(center2(1,1))+","+round(center2(1,2))+")  Radius = "...
        +round(radius2(1))+" pixels  Area = "+round(Area2)+" pixels^2  "...
        +c+"Diagonal Distance of center = "+DiagCenDistance+" m"+c+ "Radius = "...
        + radiusActual+ " m  Area = " + AreaActual + " m^2")

