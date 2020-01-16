function img = dbv_genSignal2D(f)
%img = dbv_genSignal2D(frequenz)
%
%Die Frequenz f besitzt keine Maßeinheit und bezieht sich auf die Anzahl
%an Oszillationen auf einem Intervall [a, b]

a=-1; b=1;      %Definitionsbereich z.B. [0, 1] oder [-1, 1]
range = linspace(a,b,1024);
[X,Y] = meshgrid(range);
%konzentrische Kreise
img = uint8(128*(sin( 2*pi*f/(b-a)*sqrt((X.^2) + (Y.^2)))+1));

%alternativ: diagonaler Wellenzug
%img = uint8(128*(sin( 2*pi*f/(b-a)*(X+Y) )+1));
%img = img + uint8(128*(sin( 2*pi*2*f/(b-a)*((2*X)+Y) )+1));
