%optimaler Schwellwert mithilfe des Histogramms mit Methode graytresh



function aufgabe20(filename1, filename2)

I_homogen = dbv_imageRead(filename1, 'gray');
I_inhomogen = dbv_imageRead(filename2, 'gray');

%I_homogen = imread(filename1,'quadrat_homogen.png'); %unschön
%I_inhomogen = imread(filename2,'quadrat_inhomogen.png');


%Graytresh
%Calculate a threshold using graythresh. The threshold is normalized to the range [0, 1].
level_homogen = graythresh(I_homogen);
level_inhomogen =  graythresh(I_inhomogen);

%Binary Image
%Convert the image into a binary image using the threshold.
%The output image BW replaces all pixels in the input image 
%with luminance greater than level with the value 1 (white) 
%and replaces all other pixels with the value 0 (black). 
%Specify level in the range [0,1]
%BW = im2bw(I, level) is the same as imbinarize, for level you can use the
%graytresh function
BW_homogen = imbinarize(I_homogen,level_homogen);
BW_inhomogen = imbinarize(I_inhomogen,level_inhomogen);

%Histogramm
%[counts,binLocations] = imhist(gpuarrayI,___)
%returns the histogram counts in counts and the bin locations in 
%binLocations so that stem(binLocations,counts) shows the histogram
[counts1,x]=imhist(I_homogen,16); %here with oroginal image, otherwise 2 bins instead of 16
[counts2,x]=imhist(I_inhomogen,16); 

%Display the original image next to the binary image.
figure(1);
imshowpair(I_homogen,BW_homogen,'montage')
figure(2);
imshowpair(I_inhomogen,BW_inhomogen,'montage')

figure(3);
stem(x,counts1);
title('homogen');
figure(4);
stem(x,counts2);
title('inhomogen');