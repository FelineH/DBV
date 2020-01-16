%a) Glätten Sie das Testbildmuenzen.png morphologisch mit dem Ziel, das Rauschen zu entfernen.
%Nutzen Sie hierzu strukturierende Elemente der Fenstergrößen5×5und7×7, die Sie mittels der
%Funktion strel(’square’, width)erstellen können. 
%Führen Sie nachfolgend die morpholo-gische Glättung durch Anwendung entsprechender Grauwert-Opening 
%(Funktion imopen(img,strucEl))und Grauwert-Closing(Funktion imclose(img, strucEl))Operationen aus.
%Geben Sie die Ergebnisbilder auf dem Bildschirm aus.

%b)Wenden Sie auf das erste Ergebnisbild eine weitere morphologische Glättung mit der Fenstergröße 5×5 an
%und geben Sie auch dieses Bild auf dem Bildschirm aus. Ist ein Unterschied zu dem Ergeb-nis mit der 
%Fenstergröße 7×7 wahrnehmbar?

%c)Wie wirkt sich die Anwendung eines rechteckigen anstatt quadratischen Strukturelementes auf das
%Ergebnisbild aus? Führen Sie hierzu die morphologische Glättung mit rechteckigen Strukturelementen
%der Größen 3×7 und 7×3 aus und begründen Sie das Ergebnis.

%d)Führen Sie auf dem mit Fenstergröße 7×7 gefilterten Bild eine Histogrammglättung durch und
%geben Sie das Bild auf dem Bildschirm aus. Kann dadurch eine Verbesserung erzielt werden?

function aufgabe12(filename, filtertype);

imgOriginal = im2double(dbv_imageRead(filename, 'gray'));

j = 1;

%for i = 5:2:7;
    %strucEl = strel('square', i); % strel object represents a flat morphological structuring element, which is an essential part of morphological dilation and erosion operations
    %imop = imopen(imgOriginal,strucEl); %morphological open operation is an erosion followed by a dilation, using the same structuring element for both operations.
    %imcl = imclose(imgOriginal,strucEl);
    
    %figure(1);
    %subplot(2,1,j);
    %imshow(imop);
    
    %figure(2);
    %subplot(2,1,j);
    %imshow(imcl); 
    
    %j = j+1;
%end
%falsch, da man beide Funktionen hintereinander ausführen soll für eine
%morphologische Glättung!!!

%a)
image_smoothed_5 = imopen(imclose(imgOriginal, strel('square', 5)),strel('square',5));
figure(1);
subplot(2,1,1);
imshow(image_smoothed_5);

image_smoothed_7 = imopen(imclose(imgOriginal, strel('square', 7)),strel('square',7));
subplot(2,1,2);
imshow(image_smoothed_7);

%b)
figure(2);
subplot(3,1,1);
imshow(image_smoothed_5);
imop2 = imopen(imclose(image_smoothed_5, strel('square', 5)),strel('square',5));
subplot(3,1,2);
imshow(imop2);
imop2_andersherum = imclose(imopen(image_smoothed_5, strel('square', 5)),strel('square',5));
subplot(3,1,3);
imshow(imop2_andersherum);

%c)
image_smoothed_37 = imopen(imclose(imgOriginal, strel('rectangle', [3,7])),strel('rectangle', [3,7]));
figure(3);
subplot(2,1,1);
imshow(image_smoothed_37);

image_smoothed_73 = imopen(imclose(imgOriginal, strel('rectangle', [7,3])),strel('rectangle', [7,3]));
subplot(2,1,2);
imshow(image_smoothed_73);
    
%d)
%Histogrammausgleich nicht Histogrammglättung
figure(4);
imshow(histeq(image_smoothed_7));
    
    