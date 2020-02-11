%Schwellenwert ortsabh�ngig variieren
%Binarisieren Sie das Bild unter Verwendung eines
%f�r jeden Pixel neu berechneten Schwellwertes:
%-Daf�r soll zun�chst aus der k*k-Nachbarschaft
%des zu binarisierenden Pixels die Intervallbreite r zwischen dem minimalen und 
%maximalen Graustufenwert bestimmen  
%Ist r gr��er als ein vorgegebener Schwellwert s, so wird f�r das Pixel
%ein optimaler Schwellwert �quivalent zum Vorgehen aus Aufgabenteil a) ermittelt,
%wobei ein lokales
%Histogramm basierend auf der k*k-Nachbarschaft des Pixels zu verwenden ist. 
%Wenn r  s, so
%wird das Pixel dem Hintergrund zugeordnet. 
%Finden Sie Werte f�r die Parameter k und s, die eine
%sinnvolle Segmentierung bewirken.

function aufgabe20c(filename, k)

img_Original= dbv_imageRead(filename, 'gray'); %hier nur das inhomogene Bild bearbeiten
img=zeros(size(img_Original));

[M,N] =size(img);
%k=3 %Fenstergr��e, aber w�re nicht flexibel, daher bei x1 und Co. einbauen
%und nicht bei k=3 --> x1=i-1, x2=i+1 ....
for i=1:N
    for j=1:M
        x1=i-fix((k/2)); %wenn man anderen k-Wert nimmt, also Fenstergrp��e anders ist, statt i-1 --> i-(k-2)
        x2=i+fix((k/2));
        y1=j-fix((k/2));
        y2=j+fix((k/2));
       if x1<1
            x1=1;
        end
        if y1<1
            y1=1;
        end
        if x2>N
            x2=N;
        end
        if y2>M
            y2=M;
        end 
        %fenster=[(i-1):(i+1);(j-1):(j+1)]; %Position im Bild siehe Notizen
        %fenster = img_Original((i-1):(i+1);(j-1):(j+1))
        fenster = img_Original(x1:x2,y1:y2); %als k kreuz k Fenster
        maximum=max(max(fenster));
        minimum=min(min(fenster));
        r=maximum-minimum; %Intervallbreite r zwischen dem minimalen und maximalen Graustufenwert
        s=10; %Schwellwert
        %f�r jeden Pixel eine Entscheidung treffen, entweder 0 und 255
        if r>s
            level_inhomogen =  fix(graythresh(fenster)*255); %lokalen Schwellenwert berechnen
            if img_Original(i,j) < level_inhomogen
                img(i,j) = 0; %Pixel wird schwarz
            else 
                img(i,j) = 255; %Pixel wird wei�
            end
        %Pixel wird dem Hintergrund zugeordnet    
        else 
           img(i,j) = 255; %Pixel wird wei�
        end 
    end
    img(i,j);
end

imshow(img)
title(['s=', num2str(s), ', k=', num2str(k)])
