%Desarrollar un algoritmo que lea dos vectores de 100 componentes, y obtenga el modulo (la norma
%cuadrática) del vector diferencia de los vectores leídos. Sólo si dicha norma es no nula, debe escribir
%el nuevo vector diferencia normalizado con dicha norma, de lo contrario debe escribir que la norma
%del vector diferencia es nula

function NormaVectorDiferencia

  clear
  clc

  vector1 = 0;
  vector2 = 0;
  vector3 = 0;
  vector3Normalizado = 0;
  sumCuadrados = 0;

  minValue = -100;
  maxValue = 100;

  for( i = 1:50)

    vector1(i) = randi([minValue,maxValue]);
    vector2(i) = randi([minValue,maxValue]);

  endfor

  vector3 = restaVectores(vector1,vector2);

 for (i = 1:numel(vector3))

   cuadradoDeLasComponentes = vector3(i)^2;
   sumCuadrados = sumCuadrados +cuadradoDeLasComponentes;

 endfor

 normaCuadraticaVector3 = sumCuadrados^(1/2);

 if(normaCuadraticaVector3 != 0 )

    vector3Normalizado = normalizarVector(vector3, normaCuadraticaVector3);
    disp("El vector normalizado es: "), vector3Normalizado
 else

    disp("La norma del vector diferencia es nula :(")

 endif

endfunction
%--------------------------------------------------------------------------------------------------------------------
function vectorResta = restaVectores (vector1, vector2)

  vectorResta = 0;

  for(i = 1:numel(vector1))

    vectorResta(i) = vector1(i) - vector2(i);

  endfor

endfunction
%--------------------------------------------------------------------------------------------------------------------
function vectorNormalizado = normalizarVector(vector,normaCuadratica)

  for(i = 1:numel(vector))

  vectorNormalizado(i) = vector(i)/normaCuadratica;

  endfor

endfunction










