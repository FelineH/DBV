img_Original = dbv_imageRead('buecherregal.png', 'gray');

%Sobel-Operator auf das Originalbild anwenden
%Gmag = Magnitude of gradient
%Gdir = Direction of Gradient
%[Gmag, Gdir] = imgradient(img_Original);
%imshowpair(Gmag, Gdir, 'montage')
%Problem: imgradient spuckt hier zwei Gradientenbilder aus, brauche aber
%bin�res Bild

%bin�res Bild
BW = edge(img_Original, 'Sobel');
imshow(img_Original)

%https://de.mathworks.com/matlabcentral/answers/175548-bwboundaries-explanation-of-a-example


