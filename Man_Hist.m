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