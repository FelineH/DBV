imgOriginal = dbv_imageRead('buecherregal.png', 'gray'); %gibt Bild in integer Werten als Grauwerte aus
%imgOriginal = im2double(imgOriginal);
A = imgOriginal;

%Bild Fourier-transformieren

fftA = fft2(A); %entspricht F_Schlange

%fftA = fftshift(fft2(A))/numel(A); shift setzt Ursprung in die Mitte und numel als Anzahl der Elemente --> Normierung 
%imshow(fftA);

[imgSensor, H]= dbv_sensor(fftA, 40, 0.001); %durch eckige Klammern gibt die Funktion Werte zurück, die ein Mal in die Varibale imgSensor und in Variable H gespeichert werden
imshow(imgSensor);

imgFiltered = dbv_ifilter(imgSensor, H, 2);

subplot(1,3,1):
imshow(A);

subplot(1,3,2);
imshow(unit8(fft2(imageSensor)));

subplot(1,3,3);
imshow(dbv_normImage(fft2(imageFiltered)));