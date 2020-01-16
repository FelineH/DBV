function filtered = dbv_pruningFilter(img, param)

img = double(img);

%2D FT berechnen
imgF = 
%Leistungs- A, Phasen-  Pund (optional) Amplitudenspektrum A2 berechnen
A = 
P = 
A2=A.^2;

%optional: Nullfrequenzkomponente entfernen, da diese i.A. die anderen
%Werte des Spektrums dominiert und somit den Mittelwert R verzerrt
a0=A2(1,1); A2(1,1)=0;

%Mittelwert des Leistungsspektrums:


%Manipulation des Amplitudenspektrums: 1.mittels Amplitudenspektrum
%oder 2. mittels Leistungsspektrum (Skript):

%optional: originalen Mittelwert wieder hinzufügen
A(1,1)=sqrt(a0);

%Spektrum aus (manipuliertem) Amplituden- und Phasenanteil zurückrechnen
imgF = 
%2D-IFT; optional 'symmetric' erzwingt hier die durch Rundungsfehler
%möglicherweise verlorene konjugierte Symmetrie des Spektrums.
filtered = 