function [Fmod, H] = dbv_sensor(F, s, v)
%[Fmod, H] = dbv_sensor(F, s, v)

%H Aperturfilter (‹bertragungsfunktion)
%F Bild im Ortsfrequenzbereich
%F_schlange Sensorergebnis 
%s beeinflusst dabei die Fenstergrˆﬂe (2s + 1)*(2s + 1)
%v Varianz des Rauschens.

%√úbertragungsfkt als Gewichtsfkt direkt im Frequenzbereich erstellen
winsize = size(F); %Bildgrˆﬂe
h = fspecial('gaussian', min(winsize), 2*s+1);   %Gewichtsfkt
c = fix(winsize/2);                     %Mittelpunkt des Bildes
r = fix(size(h)/2);                     %Bereich>0 um den Mittelpunkt
H = zeros(size(F));                   %erweiterte Gewichtsfkt
H(c(1)-r(1)+1:c(1)+r(1), c(2)-r(2)+1:c(2)+r(2)) = h;
H = fftshift(H);                        %Gewichtsfkt dezentrieren
H = H / max(max(H));

imgfiltered = ifft2(F .* H, 'symmetric');
%Rauschen hinzuf√ºgen
imgfiltered = uint8(imgfiltered);
imgfiltered = dbv_addNoise(imgfiltered, 'gaussian', v);

%R√ºckgabe des Bildes im Frequenzbereich
Fmod = fft2(double(imgfiltered));

%aus Funktion erhalte ich den Aperturfilter H