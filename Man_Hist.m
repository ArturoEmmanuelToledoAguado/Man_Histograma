clc; 
clear all;
close all;

%Abrir imagen
prompt={"Ingrese el nombre de la imagen con el .jpg"};
title='Imagen';
dims=[1 35];
definput={'IMG/'};
answer=inputdlg(prompt,title,dims,definput)