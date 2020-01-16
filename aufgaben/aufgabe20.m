%optimaler Schwellwert mithilfe des Histogramms mit Methode graytresh



function aufgabe20(filename1, filename2)

I_homogen = dbv_imageRead(filename1, 'gray');
I_inhomogen = dbv_imageRead(filename2, 'gray');

%I_homogen = imread(filename1,'quadrat_homogen.png'); %unschön
%I_inhomogen = imread(filename2,'quadrat_inhomogen.png');

%Calculate a threshold using graythresh. The threshold is normalized to the range [0, 1].

level_homogen = graythresh(I_homogen);
level_inhomogen =  graythresh(I_inhomogen);

%Convert the image into a binary image using the threshold.

BW_homogen = imbinarize(I_homogen,level_homogen);
BW_inhomogen = imbinarize(I_inhomogen,level_inhomogen);

%Display the original image next to the binary image.

figure(1);
imshowpair(I_homogen,BW_homogen,'montage')
figure(2);
imshowpair(I_inhomogen,BW_inhomogen,'montage')