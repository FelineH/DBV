function aufgabe2(filename, filtertype)

%Bild laden
imgOriginal = dbv_imageRead(filename, 'gray');
E=zeros(5,3);   %Matrix fÃ¼r Abweichungswerte anlegen

J = [3,5,7]; %Fenstergrößen Kernel
k = 1;
figure; %neues Bild aufrufen
for i=1:5
    sigma_noise = 1/(2*i);
    imgNoise = dbv_addNoise(imgOriginal, 'gaussian', sigma_noise);
    
    for j=1:3
    dim = [J(j), J(j)];
    imgFilter = dbv_filterImage(imgNoise, filtertype, dim);
    subplot(5,3,k); % 1 Zeile, 3 Spalten, Position des Bildes (hier haben wir drei Bildgrößen)
    imshow(imgFilter);
    
    E(i,j) = dbv_rms(imgOriginal, imgFilter); %sagt dir, in welches Matrixelement der rms-Fehler rein soll
    k = k+1;
    end
    
end
E
figure(2);
bar3(E);


%random noise wird hier angewendet, daher kann das bei anderen leicht
%veränderte Werte für die Matrix E ergeben
 %in Command Window aufgabe2c('hammer.png', 'gaussian')
