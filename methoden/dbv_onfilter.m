function Frecon = dbv_onfilter(F,H,lambda)

c = fspecial('laplacian');  %Hochpassfilter im Ortsbereich
C = psf2otf(c,size(F));     %zugehöriger Hochpassfilter im Frequenzbereich

%Frecon = ...