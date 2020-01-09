function aufgabe7(filename1, filename2)

imgB1 = dbv_imageRead(filename1, 'gray');
imgB2 = dbv_imageRead(filename2, 'gray');

figure
imgB1_shift = fftshift(imgB1); %damit kann Mittenfrequenz von links oben in die Mitte des Bildes
imgB2_shift = fftshift(imgB2);
summeB1B2 = imgB1_shift + imgB2_shift; %Addition aus den beiden geshifteten Bildern

%Bilder zeigen Fouriertransformierte von Bildern
%ifft berechnet inverse Fouriertransformation

ifftB1B2= ifft2(summeB1B2);
%Spektrum dezentrieren und invers Fourier-transformieren
%Da das Spektrum reellwertig ist, ist die IFT komplexwertig, daher
%Benutzung des Realteiles der IFT.

real_ifftB1B2 = real(ifftB1B2);
imgB1B2_end = uint8(255*mat2gray(real_ifftB1B2));

%Bilder auf den Wertebereich 0-255 skalieren


%Bilder anzeigen
subplot(2,2,1)
imshow(summeB1B2)

subplot(2,2,2)
imshow(imgB1B2_end)


%Man sieht eine Welle aus der Addition der Fouriertransformierten zweier
%Wellen
%Aufgabe 7c) Rotation im Ortsraum führt zur Rotation im Frequenzraum
