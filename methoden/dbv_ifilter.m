function Frecon = dbv_ifilter(F,H,S)

%S Schwellenwert

xx = F .* ((1./abs(H))< S) .* 1./H; %hier keine if-Bedingung, weil die einen Wert erwartet
yy = F .* ((1./abs(H))>= S) .* S;   %statt if ist die Bedingung in Klamnmern mit dem Betrag von H (abs(H))

Frecon = xx + yy;
end