function aufgabe23(filename)

img = dbv_imageRead(filename, 'gray');

BW2 = edge(img, 'Sobel');

[B,L] = bwboundaries(BW2,'noholes');
figure(1)
imshow(img)
hold on
% for k = 1:length(B)
%    boundary = B{k};
%    plot(boundary(:,2), boundary(:,1), 'g', 'LineWidth', 1) % Jede Kontur=Matrix
% end
A = zeros(length(B),1);
l = zeros(length(B),1);
for k = 1:length(B) %(geht über äußere Kontur), innere Schleife geht über einzelne Eckpunkte der Kontur)
    boundary = B{k}; %Koordinaten der Punkte eines Poligonzugs
    x=0;
    for i =1:length(B{k})-1 %i=Nummer des Eckpunkts, Länge einer Kontur
        v1=boundary(i,:);
        v2=boundary(i+1,:);
        x = x + norm(v1-v2); %Umfang
    end
    l(k)=x;
    C=0;
    for i = 1:length(boundary)-1
%     a = 1/2 *(boundary(i,2)-boundary(i-1,1) - boundary(i+1,2)*boundary(i,1));
      a = 0.5 * ((boundary(i,2)+(boundary(i+1,2)))*(boundary(i+1, 1)-boundary(i,1)));
    C = a + C;
    end
A(k)= C;
end
A

%%% Teil b) %%%%%

K = zeros(length(B),1)
K = 4 * pi * (A ./ l.^2)

for k = 1: length(B)
    
    boundary = B{k};
    

    if K(k) <= 0.75
        plot(boundary(:,2), boundary(:,1), 'g', 'LineWidth', 1) % Jede Kontur=Matrix
    else

        plot(boundary(:,2), boundary(:,1), 'r', 'LineWidth', 1) % Jede Kontur=Matrix
    end
end

figure(2)
bar(K)
