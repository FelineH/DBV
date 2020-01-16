function r=dbv_selectPixel(img,i,j,s)

%Fenster der Größe 5x5 (entsprechend verkleinert im Randbereich)
win=[max(1,i-2), min(size(img,1),i+2);
     max(1,j-2), min(size(img,2),j+2)];
 
%Summe der Pixelwerte innerhalb des Fensters berechnen:


%Prüfe, ob Summe kleiner als Schwellwert ist und Rückgabe in r
%entsprechend anpassen: