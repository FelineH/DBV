function aufgabe25()
addpath 'C:\Users\feline.heinzelmann\Documents\MATLAB\DBV1920\bilder\bilderFM'
%a)
figure(1)
Bilder = dir('C:\Users\feline.heinzelmann\Documents\MATLAB\DBV1920\bilder\bilderFM');
%dir lists files and foldersin the current folder
%Bilder returns attributes about name
%3:14 und nicht 1:12
for i = 3:14
    img = dbv_imageRead(Bilder(i).name,'gray'); %Bilder(i).name erlaubt Zugriff auf den i-ten Dateinamen (Index, here i, into the structure to access a particular item).
    img = edge(img,'sobel','nothinning');
    subplot(4,3,i-2)
    imshow(img)
    title(num2str(i-2)) %Bilder werden nummeriert von 1 bis 12
end 

%b) Morphologische Glättung
%Extrahieren Sie aus jedem Bild die längste Kontur. Zeigen Sie alle 12 Bilder unter Benutzung des
%subplot-Befehls zusammen an und zeichnen Sie auf jedem Bild die extrahierte längste Kontur nach
figure(2)
for i = 3:14
    img=dbv_imageRead(Bilder(i).name, 'gray');
    img = edge(img, 'sobel', 'nothinning');
    img = imclose(img, strel('square', 7)); %Closing Polygonzüge w4erden länger, Kanten verbinden mit dem Ziel: äußere Kontur bekommen
    
    [B,L] = bwboundaries(img,'noholes'); %gibt Pixel des Polygonzuges (boundary pixel locations)
    l = zeros(length(B),1);
    %Längsten Polygonzug ermitteln
    for k = 1:length(B)
        boundary = B{k};
        x=0;
        for n = length(B{k})-1
            v1=boundary(n,:);
            v2=boundary(n+1,:);
            x = x + norm(v1-v2);
        end
        l(k)=x;
    end
    [kontur_max,j] = max(l); %wir wollen Index haben, kontur_max ist absoluter Wert uind j gibt den Index aus (welcher Polygonzug ist der längste?)
    boundary = B{j};
    
    subplot(4,3,i-2)
    imshow(img)
    hold on
    plot(boundary(:,2), boundary(:,1), 'm', 'LineWidth', 1.5)
    title(num2str(i-2))
end
    