function aufgabe7(filename1, filename2)

imgB1 = dbv_imageRead(filename1, 'gray');
imgB2 = dbv_imageRead(filename2, 'gray');

figure
imgB1_shift = fftshift(imgB1); %damit kann Mittenfrequenz von links oben in die Mitte des Bildes
imgB2_shift = fftshift(imgB2);

%Bilder zeigen Fouriertransformierte von Bildern
%ifft berechnet inverse Fouriertransformation

ifftB1= ifft2(imgB1_shift);
ifftB2= ifft2(imgB2_shift);
%Spektrum dezentrieren und invers Fourier-transformieren
%Da das Spektrum reellwertig ist, ist die IFT komplexwertig, daher
%Benutzung des Realteiles der IFT.

real_ifftB1 = real(ifftB1);
imgB1_end = uint8(255*mat2gray(real_ifftB1));

real_ifftB2 = real(ifftB2);
imgB2_end = uint8(255*mat2gray(real_ifftB2));

%Bilder auf den Wertebereich 0-255 skalieren


%Bilder anzeigen
subplot(2,2,1)
imshow(filename1)
title('B1 Fourier')

subplot(2,2,2)
imshow(filename2)
title('B2 Fourier')

subplot(2,2,3)
imshow(imgB1_end)
title('B1 inverse Fourier')

subplot(2,2,4)
imshow(imgB2_end)
title('B2 inverse Fourier')



