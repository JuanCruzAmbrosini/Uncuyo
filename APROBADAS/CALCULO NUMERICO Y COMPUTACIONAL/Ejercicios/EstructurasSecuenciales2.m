%Desarrollar un programa para que una vez ingresado el valor de temperatura en grados Celsius,
%entregue su valor equivalente en grados Farenheit (F=(9/5)*(ºC)+32)

function ConvertidorDeGrados
  clear
  clc

  gradosCelsius = input("Ingrese la temperatura en grados celcius: ");

  gradosFarenheit = (9/5)*(gradosCelsius)+32;
  disp("La temperatura en grados Farenheit es de: "), gradosFarenheit

  endfunction
