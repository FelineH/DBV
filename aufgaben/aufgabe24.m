function aufgabe24(filename)
close('all')
img =dbv_imageRead(filename, 'gray');
imshow(img);
hold on

BW = edge(img, 'sobel');
B = bwboundaries(BW, 'noholes'); %Kanten finden
%B ist Container, mit k-ter Komponente auf die Elemente mithilfe geschweifter
%Klammer zugreifen

%size(B, dim) 
for j = 1:16
    M = j;
    subplot(4,4,j)
    imshow(img,[])
    hold on
    L_strich = cell(size(B,1),1); %2*1 Cell Array
    for k = 1:size(B,1)
        boundary = B{k,1};
        x = boundary(:, 2);
        y = boundary(:, 1);
        % mit 2 auf x werte zugreifen, mit 1 auf die y werte
        N = size(boundary,1);
        C = x + 1i*y %Punkt (x,y) in x + iy überführen
        D = fft(C); 
        %plot(x, y, 'm', 'LineWidth', 6);
        %plot(x, y, 'c', 'LineWidth', 2);
        
        %3.
        %nur m<=N/2 Deskriptorenpaare sollen verwendet werden
        D=[D(1);D(2:1+M);zeros(N-1-2*M,1);D(end-M+1:end)]; %Matrix D(1) als oberste, darunter Matrix D(2:1+M) usw.
        C_strich = ifft(D);
    
        %4.
        L_strich{k} = [real(C_strich),imag(C_strich)] %Concatenation mit Matrizen nebeneinander
        
    end
        for i=1:size(L_strich,1)
            boundary = L_strich{i,1};
            plot(boundary(:,1),boundary(:,2),'c','LineWidth',2)
        end
   
end