clc; 
clear all;
close all;

%Interfaz para pedir la imagen
prompt="Ingrese el nombre de la imagen";
t='Imagen';
dims=[1 50];
definput={'IMG/'};
answer=inputdlg(prompt,t,dims,definput);

%Abrir imagen
img=imread(string(answer)+'.jpg');

%Mostramos original y su histograma
figure()
subplot(1,2,1)
imshow(img)
title('Original')
subplot(1,2,2)
imhist(img)
title('Histograma')

%Histograma con gamma predeterminado (1)
imgjs=imadjust(img,[.01 .85],[]);

%Histograma con gamma <1 (más brillante)
imgjsb=imadjust(img,[.01 .85],[],.5);

%Histograma con gamma >1 (más oscuro)
imgjso=imadjust(img,[.01 .85],[],1.3);

%Mostramos resultados
figure()
subplot(3,2,1)
imshow(imgjs)
title('\gamma = 1')
subplot(3,2,2)
imhist(imgjs)
title('Histograma \gamma = 1')
subplot(3,2,3)
imshow(imgjsb)
title('\gamma = .5')
subplot(3,2,4)
imhist(imgjsb)
title("Histograma \gamma =.5")
subplot(3,2,5)
imshow(imgjso)
title("\gamma = 1.3")
subplot(3,2,6)
imhist(imgjso)