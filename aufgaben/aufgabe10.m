%In derAufgabe 2 wurde die Wirkung von Tiefpassfiltern im Ortsbereich untersucht. 
%Welche Ausprägung ein  derartiger  Filter  im  Frequenzbereich  auf  den  Bildinhalt  hat,  
%soll  innerhalb  dieser  Aufgabe  näheruntersucht werden.

%a)Erzeugen Sie in Anlehnung an die Aufgabe 2
%aus dem gegebenen Bild B(Testbildhammer.png)Bilder Bi, die mit einem normalverteilten Rauschen mit 
%Mittelwert ?i= 0und Standardabweichung ?i= 1/(2i),i= 1,...,5, versehen sind

function aufgabe10(filename, filtertype)

%Bild laden
imgOriginal = im2double(dbv_imageRead(filename, 'gray')); %konvertiert int in double, hier konvertieren in double Werte von 0 bis 1
E=zeros(5,3);   %Matrix fÃ¼r Abweichungswerte anlegen

i = 1 %Fenstergrößen Kernel

for j=1:5
    sigma_noise = 1/(2*j);
    imgNoise = dbv_addNoise(imgOriginal, 'gaussian', sigma_noise);
    imgNoise = fft2(imgNoise);
    imgNoiseshift = fftshift(imgNoise);
    
%b)Realisieren  Sie  zunächst  einen  kreisförmigen  FilterTjim  Ortsfrequenzbereich  für  die  
%Radienj= 3,5,7,9,11, und wenden die diesen auf die BilderBian. Stellen Sie die Ergebnisbilder 
%imVergleich zum Ausgangsbild dar.

%c)Berechnen Sie für jede Kombination aus Aufgabenteilb)den RMS-Fehler E_i,j zum 
%Originalbild B(Funktion rms = dbv_rms(img1, img2)). Stellen Sie die WerteEi,j als zweidimensionales
%Balkendiagramm graphischdar(Funktionbar3).
    
    matrix = zeros(size(imgNoiseshift));
    Mittelpunkt = fix(size(imgNoiseshift)/2);
    
    
    k =1;
    
    for r=3:2:11
        h =fspecial('disk',r); %disk ist Kreisfilter
        h2 = h>0;
        h3 = double(h2);
        
        matrix(Mittelpunkt(1)-r:Mittelpunkt(1)+r, Mittelpunkt(2)-r:Mittelpunkt(2)+r)=h3;
        
        imgNoise_f = imgNoiseshift .* matrix;
        
        rTrans  = ifftshift(imgNoise_f);
        rTrans_real = real(ifft2(rTrans));
       
        i = i+1;
        
        E(j,k) = dbv_rms(imgOriginal, rTrans_real); %sagt dir, in welches Matrixelement der rms-Fehler rein soll
        k = k+1;
    end
end


figure(5)
bar3(E)
E
