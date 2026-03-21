negacion :: Bool -> Bool
negacion True = False
negacion False = True

conjuncion :: Bool -> Bool -> Bool
conjuncion True True = True
conjuncion True False = False
conjuncion False True = False
conjuncion False False = False

disyuncion :: Bool -> Bool -> Bool
disyuncion True True = True
disyuncion True False = True
disyuncion False True = True
disyuncion False False = False

esPar :: Int -> Maybe Bool
esPar 0 = Just True
esPar 1 = Just False
esPar n 
 |n > 0 = esPar (n - 2)
 |n < 0 = Nothing

condicionAlumno :: Int -> Maybe String
condicionAlumno nota
 | nota < 60 && nota >= 0 = Just "Desaprobado"
 | nota >= 60 && nota <= 100 = Just "Aprobado"
 | otherwise = Nothing

data ColorPrimario = Amarillo | Rojo | Azul deriving (Show, Eq)
mezclarColor :: ColorPrimario -> Int -> ColorPrimario -> Int -> Maybe String
mezclarColor Amarillo p1 Rojo p2 
 |p1 + p2 /= 100 = Nothing
 |p1 == p2 = Just "Naranja"
 |p1 > p2 = Just "Amarillo rojizo"
 |p1 < p2 =  Just "Rojo Amarillento"
mezclarColor Amarillo p1 Azul p2 
 |p1 + p2 /= 100 = Nothing
 |p1 == p2 = Just "Verde"
 |p1 > p2 = Just "Amarillo azulado"
 |p1 < p2 = Just "Azul Amarillento"
mezclarColor Rojo p1 Azul p2 
 |p1 + p2 /= 100 = Nothing
 |p1 == p2 = Just "Violeta"
 |p1 > p2 = Just "Rojo azulado"
 |p1 < p2 = Just "Azul rojizo"
mezclarColor Rojo p1 Amarillo p2 = mezclarColor Amarillo p2 Rojo p1 
mezclarColor Azul p1 Amarillo p2 = mezclarColor Amarillo p2 Azul p1 
mezclarColor Azul p1 Rojo p2 = mezclarColor Rojo p2 Azul p1 
mezclarColor _  _ _ _ = Nothing

data Estudio = Primario | Secundario | Superior deriving (Show, Eq)
data Persona = Persona {edad :: Int, nombre :: String, estudios :: Estudio} deriving (Show, Eq) 
clasificarPersona :: Persona -> Maybe String
clasificarPersona (Persona e _ _ )
 | e < 13 && e >= 0 = Just "Menor"
 | e < 18 = Just "Adolescente"
 | e <= 69 = Just "Adulto"
 | e > 69 && e < 122 = Just "Anciano"
 | otherwise = Nothing

calificarPorEstudio :: Persona -> Maybe String
calificarPorEstudio (Persona ed _ est)
 | ed < 18 = Nothing
 | est == Primario = Just "Estudios Primarios"
 | est == Secundario = Just "Estudios Secundarios"
 | est == Superior = Just "Estudios superiores"

data Figura = Circulo {radio :: Float} | Rectangulo {lado1 :: Float, lado2 :: Float} | Cuadrado {lado :: Float} | Triangulo {lado1 :: Float, lado2 :: Float, lado3 :: Float}
clasifTriang :: Figura -> String
clasifTriang (Triangulo l1 l2 l3)
 | l1 == l2 && l1 == l3 = "Equilatero"
 | l1 == l2 || l1 == l2 || l2 == l3 = "Isoceles"
 | otherwise = "Escaleno"
clasifTriang _ = "No es triangulo"















































