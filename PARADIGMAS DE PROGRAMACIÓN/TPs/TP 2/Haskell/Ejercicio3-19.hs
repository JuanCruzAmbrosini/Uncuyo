sumaElementos :: [Int] -> Int
sumaElementos []  = 0
sumaElementos (h:t) = h + sumaElementos(t)

soloPares :: Int -> [Int]
soloPares num = [x|x <- [0..num], mod x 2 == 0]

todosVerdaderos :: [Bool] -> Bool
todosVerdaderos lista = null [x | x <- lista, x == False]

incrementar :: [Int] -> [Int]
incrementar [] = []
incrementar (h:t) = [h+1] ++ incrementar t 

cuadrados :: [Int] -> [Int]
cuadrados [] = []
cuadrados (h:t) = [h^2] ++ cuadrados t 

divisores :: Int -> [Int]
divisores num = [ x | x <- [1..num], mod num x == 0 ]

sumaParesDesde :: Int -> Int -> Maybe [Int]
sumaParesDesde m n 
 | n > m = Just [x|x <- [m+1..n], mod x 2 == 0]
 | otherwise = Nothing

sumaDeCuadrados :: Int -> Int
sumaDeCuadrados num = (sumaElementos . cuadrados) [x | x <- [1..num]]

sumaDeCuadradosPares :: Int -> Int
sumaDeCuadradosPares num = sumaElementos [num^x | x <- [1..num-1]]

productoEscalar :: [Int] -> [Int] -> Int
productoEscalar [] [] = 0
productoEscalar (h1:t1) (h2:t2) = (h1 * h2) + productoEscalar t1 t2

masDe :: Int -> [[a]] -> [[a]]
masDe n listPlus = [x | x <- listPlus, length x > n]

posicionEnLista :: [Int] -> [Int] -> Maybe Int
posicionEnLista lista1 lista2 = buscarSub 0 lista1 lista2

buscarSub :: Int -> [Int] -> [Int] -> Maybe Int
buscarSub _ _ [] = Nothing
buscarSub i sub (h:t)
 | esPrefijo sub (h:t) = Just i
 | otherwise = buscarSub (i+1) sub t

esPrefijo :: [Int] -> [Int] -> Bool
esPrefijo [] _ = True
esPrefijo _ [] = False
esPrefijo (h1:t1) (h2:t2)
 | h1 == h2 = esPrefijo t1 t2
 | otherwise = False

buscarCrucigrama :: Char -> Int -> Int -> [String] -> [String]
buscarCrucigrama _ _ _ [] = []
buscarCrucigrama caracter indice longitud (h:t)
 | letraPosicion indice 0 caracter h && longitudPalabra h == longitud = buscarCrucigrama caracter indice longitud t ++ [h]
 | otherwise = buscarCrucigrama caracter indice longitud t

letraPosicion :: Int -> Int -> Char -> String -> Bool
letraPosicion indice contador caracter (h:t)
 | contador < indice = letraPosicion indice (contador + 1) caracter t
 | contador == indice && caracter == h = True
 | otherwise = False

longitudPalabra :: String -> Int
longitudPalabra [] = 0
longitudPalabra (h:t) = 1 + longitudPalabra t 






























