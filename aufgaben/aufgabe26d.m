%PCA Principal Component Analysis
function aufgabe26()
addpath 'C:\Users\feline.heinzelmann\Documents\MATLAB\DBV1920\bilder\bilderPCA'
Bilder = dir('C:\Users\feline.heinzelmann\Documents\MATLAB\DBV1920\bilder\bilderPCA');
[w,h] = size(dbv_imageRead(Bilder(3).name,'gray')); %  returns the number of rows and columns when "Bilder" is a matrix., but 3 means that you get the third item from the structure array bilder
Datenmatrix = zeros(14,w*h); %returns a 14 by w*h array of zeros with dimension 14 and w*h(=69)
for i = 3:16
    img = dbv_imageRead(Bilder(i).name,'gray');
    Bildvektor = zeros(1,w*h); %produces a row vector
    img = img';                %Strucure array img transponieren um zeilenweise auszulesen (ginge auch spaltenweise)
    Bildvektor(1:end) = img(1:end); % Bildvektor ist ein Zeilenvektor mit allen Bildinformationen
    Datenmatrix(i-2,:) = Bildvektor; %einzelne Bildvektoren werden zur Matrix zusammengesetzt; die Matrix soll ab erster Spalter besetzt sein, daher i-2
end 

[evectors,score,evalues] = princomp(Datenmatrix); %Alternative is pca 
%princom(Datenmatrix) returns eigenvectors a vector which returns principal component coefficients (Hauptkomponentenkoeffizienten), 
%scores (Ränge) a vector containg principal component scores
%(Repräsentation von Datenmatrix im Hauptkomponentenraum, Reihen von scores sind Anzahl, Spalten von scores Komponenten)
%and eigenvalues(vector containing the eigenvalues of the covariance matrix of "Datenmatrix"

%return the 20 biggest eigenvalues and plot them
figure(1) 
bar(1:20,evalues(1:20)) %draws the bars at the locations specified by 1:20
xlabel('Rang')
ylabel('Eigenwert')

%b)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% display eigenvectors
%basis of coordinates now should consist of the first three eigenvectors
%which correspond to the three biggest eigenvalues
figure(2) 
for i=1:2
ev = evectors(:,i);
img_ev = reshape(ev,69,69);%sort elements from the vector of length 69*69 in a 69 by 69 matrix --> img_ev ist matrix!
subplot(1,2,i)
imshow(img_ev,[]) %imshow uses a display range of [min(img_ev(:)) img_ev(I(:))]
title(['Eigenvektor ',num2str(i)]) %entitles the three pictures with Eigenvektor 1, Eigenvektor 2, Eigenvektor 3
end

%%% Transformation of "Datenmatrix" into "D_strich"
D_strich = zeros(14,2);
D_strich(:,1:2) = score(:,1:2);


% c)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Mittelwert der Gruppen
%%% first 8 pictures are screws (Schrauben)
Prototyp_Schraube_x = 1/8 * sum(D_strich(1:8,1)); %row 1
Prototyp_Schraube_y = 1/8 * sum(D_strich(1:8,2)); %row 2


%%% last 6 pictures are nuts (Muttern)
Prototyp_Muttern_x = 1/6 * sum(D_strich(9:14,1));
Prototyp_Muttern_y = 1/6 * sum(D_strich(9:14,2));


%%%display of 14 datapoints in a 3d-plot
figure(3) 
plot(D_strich(:,1),D_strich(:,2),'b.') %plots a three dimensional plot of the column vectors D_strich(:,1), D_strich(:,2), D_strich(:,3)
hold on 
plot(Prototyp_Schraube_x,Prototyp_Schraube_y,'c.')
plot(Prototyp_Muttern_x,Prototyp_Muttern_y,'m.')

%%% belonging to group 
Schraube = [Prototyp_Schraube_x,Prototyp_Schraube_y];
Mutter = [Prototyp_Muttern_x,Prototyp_Muttern_y];
figure(4)
plot(Prototyp_Schraube_x,Prototyp_Schraube_y,'kx') %three dimensional feature point with coordinates Prototyp_Schraube_x,Prototyp_Schraube_y,Prototyp_Schraube_z
hold on
plot(Prototyp_Muttern_x,Prototyp_Muttern_y,'ko') %three dimensional feature point with coordinates in x, y, and z direction

%determine for every data point the prototype for the smallest Euclidian distance 
%and sort them by two groups corresponding to Euclidian distance to the group prototype
for i=1:14
    vec = D_strich(i,1:2);    
    Abstand_Schraube = norm((vec - Schraube),2); %calculate the Euclidian Distance
    Abstand_Mutter = norm((vec - Mutter),2);
    if Abstand_Schraube <= Abstand_Mutter
        Gruppe = 'Schraube';
        plot(D_strich(i,1),D_strich(i,2),'c.')
        fprintf('Dateiname:%s \t Gruppe:%s \n',Bilder(i+2).name,Gruppe);
    else
        Gruppe = 'Mutter';  
        plot(D_strich(i,1),D_strich(i,2),'m.')
        fprintf('Dateiname:%s \t Gruppe:%s \n',Bilder(i+2).name,Gruppe);
    end 
end 
legend('Schraube','Mutter')

%%% d) siehe aufgabe26_2dim bzw -1dim
%%% e)
%%% Basisvektoren an der iten Stelle ungleich 0 
%%% Eigenvektoren an 'allen' Komponenten ungleich null enthalten mehr
%%% Bildinformation
