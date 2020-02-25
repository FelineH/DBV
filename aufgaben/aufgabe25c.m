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
X = zeros(12,2); 
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
        for n = 1: length(B{k})-1 %n ist Nummer des Eckpunktes bis zur Länge einer Kontur
            v1=boundary(n,:);
            v2=boundary(n+1,:);
            x = x + norm(v1-v2); %Umfang
        end
        l(k)=x;
    end
    [kontur_max,j] = max(l) %wir wollen Index haben, kontur_max ist absoluter Wert uind j gibt den Index aus (welcher Polygonzug ist der längste?)
    boundary = B{j};
    
    C=0;
        for m = 1:length(boundary)-1
%           a = 1/2 *(boundary(i,2)-boundary(i-1,1) - boundary(i+1,2)*boundary(i,1));
            a = 0.5 * ((boundary(m,2)+(boundary(m+1,2)))*(boundary(m+1, 1)-boundary(m,1))); %Trapezformel a ist Teilfläche, weil man Pixelweise durchgeht, um die Gesamtfläche A zu berechnen
            C = a + C; %Fläche innerhalb des längsten Polygonzuges
        end
        
    K = 4 * pi * (C ./ kontur_max.^2);
    X(i-2,1) = kontur_max; %Umfang der längsten Kontur
    X(i-2,2) = K; %Kreishaftigkeit --> beide Merkmal Umfang und Kreishaftigkeit werden in die zweidimensionale leere Matrix X hineingeschrieben mit 12 Zeilen und 2 Spalten
    
    subplot(4,3,i-2)
    imshow(img)
    hold on
    plot(boundary(:,2), boundary(:,1), 'm', 'LineWidth', 1.5)
    title(num2str(i-2))
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Clusteranalyse der Konturen mittels des Befehls kmeans durch, und gruppieren Sie auf diese
%Weise die Konturen in zwei Cluster unter Benutzung des euklidischen Abstandsmaßes
[idx,c] = kmeans(X,2); %idx: cluster index, d.h. zugeordnete Klasse (hier: Schraube ist Klasse 2, Mutter Klasse 1), c: zentroidkoordinaten (Clusterzentren für die beiden Klassen)

%extrahierte Konturen der beiden Klassen zeichnen
figure(3)
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
        for n = 1: length(B{k})-1 %n ist Nummer des Eckpunktes bis zur Länge einer Kontur
            v1=boundary(n,:);
            v2=boundary(n+1,:);
            x = x + norm(v1-v2); %Umfang
        end
        l(k)=x;
    end
    [kontur_max,j] = max(l) %wir wollen Index haben, kontur_max ist absoluter Wert uind j gibt den Index aus (welcher Polygonzug ist der längste?)
    boundary = B{j};
    
    subplot(4,3,i-2)
    imshow(img)
    hold on
    if idx(i-2)==1
        plot(boundary(:,2), boundary(:,1),'c', 'LineWidth', 3)
    elseif idx(i-2)==2
        plot(boundary(:,2), boundary(:,1),'m', 'LineWidth',3)
    end        
end

X 
%in erster Spalte steht Umfang
%in der zweiten Spalte wird ersichtlich, dass für K bis 0,4 Schraube und für K bis 0,9 ergibt sich die Mutter, die einem Kreis am stärksten ähnelt (Kreis hätte Kreishaftigkeit K =1)