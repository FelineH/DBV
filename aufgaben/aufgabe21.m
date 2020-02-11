img_Original = dbv_imageRead('buecherregal.png', 'gray');

%Sobel-Operator auf das Originalbild anwenden
%Gmag = Magnitude of gradient
%Gdir = Direction of Gradient
%[Gmag, Gdir] = imgradient(img_Original);
%imshowpair(Gmag, Gdir, 'montage')
%Problem: imgradient spuckt hier zwei Gradientenbilder aus, brauche aber
%binäres Bild

%binäres Bild
BW = edge(img_Original, 'Sobel');
imshow(BW)
imshow(img_Original)
B=bwboundaries(BW,'nonholes');

l = zeros(length(B),1);

for k = 1:length(B)
    for i = length(B(k))
        norm(B) %Euklidischen Abstand berechnen
    end    
end 

%https://de.mathworks.com/matlabcentral/answers/175548-bwboundaries-explanation-of-a-example


