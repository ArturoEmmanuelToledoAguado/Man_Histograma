clc; 
clear all;
close all;

% %Interfaz para pedir la imagen
% prompt="Ingrese el nombre de la imagen";
% t='Imagen';
% dims=[1 50];
% definput={'IMG/'};
% answer=inputdlg(prompt,t,dims,definput);
% 
% %Abrir imagen
% img=imread(string(answer)+'.jpg');

ruta = {'IMG/BN1','IMG/BN2','IMG/BN3','IMG/Col1','IMG/Col2','IMG/Col3'};

for k=1:6
    %Abrir imagen
    img=imread(string(ruta{k})+'.jpg');

    %B/N
    if(k<4)

         %Mostramos original y su histograma
        figure(k)
        subplot(1,2,1)
        imshow(img)
        title('Original')
        subplot(1,2,2)
        imhist(img)
        title('Histograma')

        %Histograma con gamma predeterminado (1)
        imgjs=imadjust(img,[.16 .83],[.0833 .9166]);%[42.5 <-> 212.5]/6, [21.25 <-> 233.75]/12

        %Histograma con gamma <1 (más brillante)
        imgjsb=imadjust(img,[.01 .85],[.08 .91],.6);%[2.55 <-> 216.75] , [21.25 <-> 233.75]/12

        %Histograma con gamma >1 (más oscuro)
        imgjso=imadjust(img,[.12 .87],[.083 .916],1.4);%[32.875 <-> 223.125]/8 , [21.25 <-> 233.75]/1

        %Mostramos resultados
        figure(k+6)
        subplot(3,2,1)
        imshow(imgjs)
        title('\gamma = 1')
        subplot(3,2,2)
        imhist(imgjs)
        title('Histograma \gamma = 1')
        subplot(3,2,3)
        imshow(imgjsb)
        title('\gamma = .6')
        subplot(3,2,4)
        imhist(imgjsb)
        title("Histograma \gamma = .6")
        subplot(3,2,5)
        imshow(imgjso)
        title("\gamma = 1.4")
        subplot(3,2,6)
        imhist(imgjso)
        title("Histograma \gamma = 1.4")
    %Color
    else
         %Mostramos original y su histograma
        figure(k)
        subplot(1,4,1)
        imshow(img)
        title('Original')
        subplot(1,4,2)
        imhist(img(:,:,1))
        title('Histograma R')
        subplot(1,4,3)
        imhist(img(:,:,2))
        title('Histograma G')
        subplot(1,4,4)
        imhist(img(:,:,3))
        title('Histograma B')

        %Histograma con gamma predeterminado (1)
        imgjs=imadjust(img,[0 .78 .65; 1 .98 .96],[]);

        %Histograma con gamma <1 (más brillante)
        imgjsb=imadjust(img,[.45 0 .33; .62 1 .53],[],.6);

        %Histograma con gamma >1 (más oscuro)
        imgjso=imadjust(img,[.80 .78 0; .96 .94 1],[],1.4);

        %Mostramos resultados
        figure(k+6)
        subplot(3,2,1)
        imshow(imgjs)
        title('\gamma = 1')
        subplot(3,2,2)
        imhist(imgjs)
        title('Histograma \gamma = 1')
        subplot(3,2,3)
        imshow(imgjsb)
        title('\gamma = .6')
        subplot(3,2,4)
        imhist(imgjsb)
        title("Histograma \gamma = .6")
        subplot(3,2,5)
        imshow(imgjso)
        title("\gamma = 1.4")
        subplot(3,2,6)
        imhist(imgjso)
        title("Histograma \gamma = 1.4")
    end
end