function aufgabe2(filename, filtertype)

%Bild laden
imgOriginal = dbv_imageRead(filename, 'gray');
E=zeros(5,3);   %Matrix fÃ¼r Abweichungswerte anlegen


figure;
    for j = 3:2:7
        imageFiltered = dbv_filterImage(imgOriginal, filtertype, 1);
        subplot(1,3,j); % 1 Zeile, 3 Spalten, Position des Bildes (hier haben wir drei Bildgrößen
        imshow(imageFiltered);
        j= j+1;
    end
    figure(2)
    imshow(imgOriginal)
    
