function h=dbv_faltungOrt_1D(f, g)
                                                                                                                                                               
%1. Länge der Vektoren bestimmen
N=length(f);      %Signal der Länge N
G=length(g);      %Filterkern der Länge G

%2. Faltung im Ortsbereich OHNE Befehl "conv" oder "filter"!
%Randbehandlung: zum Beispiel f beiderseits um halbe Filterkernlänge mit 0 erweitern
%auf Gesamtlänge N+G-1, und Ergebnis h wieder auf Länge N beschneiden
%Bemerkung: resultierende Faltung ist dadurch nicht kommutativ!

%[] Vektor oder Matrix erstellen
% zeros(x, y) erstellt Nullvektor/-matrix mit x f�r Zeilenzahl und y
% Spaltenzahl

r = fix(G/2);                           %halbe Filterkernlänge
fExt =	[zeros(1,r), f, zeros(1,r)];	%erweiterter Eingabevektor
h = zeros(1,N);						    %Ausgabevektor anlegen %Dimension von f, leerer Vektor

%for i=1+r:length(fExt)-r %l�uft von 2 bis 5 in Ab                                                                                                                                                                              h�ngigkeit von L�nge f
for i=1:N   %Schleife wird vier Mal durchlaufen
    %Schleifenrumpf
    h(i) = sum(fExt(i:i-1+G) .* fliplr(g))
end

%3. Erweiterungen entfernen
