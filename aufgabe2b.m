function aufgabe2(filename, filtertype)

%Bild laden
imgOriginal = dbv_imageRead(filename, 'gray');
E=zeros(5,3);   %Matrix fÃ¼r Abweichungswerte anlegen

J = [3,5,7]; %Fenstergrößen Kernel

for i=1:5
    sigma_noise = 1/(2*i);
    imgNoise = dbv_addNoise(imgOriginal, 'gaussian', sigma_noise);
    
    for j=1:3
    dim = [J(j), J(j)];
    filterfunc = dbv_filterImage(imgNoise, filtertype, dim);
    subplot(1,3,j); % 1 Zeile, 3 Spalten, Position des Bildes (hier haben wir drei Bildgrößen
    imshow(filterfunc)
    end
    
end


