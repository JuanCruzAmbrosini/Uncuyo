newtype Zona = Zona String deriving (Show, Eq)
type Timestamp = Int 
data Estacion = Estacion {iden :: Int, nombre :: String, zona :: Zona} deriving (Show, Eq)
data Medicion = Medicion {estacion :: Estacion, timestamp :: Timestamp, temperatura :: Int, humedad :: Int, viento :: Int} deriving (Show, Eq)
data Severidad = SinAlerta | Preventiva | Alerta | Emergencia deriving (Show, Eq, Ord)
data Motivo = CalorExtremo | VientoFuerte | FrioExtremo | DatosSospechosos String deriving (Show, Eq)
data ResultadoMedicion = ResultadoMedicion {severidad :: Severidad, motivos :: [Motivo]} deriving (Show, Eq)

estacion1 = Estacion 1 "Observatorio Central" (Zona "Norte")
estacion2 = Estacion 2 "Base Glaciar"         (Zona "Sur")
estacion3 = Estacion 3 "Puerto Deseado"       (Zona "Este")
estacion4 = Estacion 4 "Puesto Montaña"       (Zona "Oeste")
estacion5 = Estacion 5 "Estación Costera"     (Zona "Norte")

medicion1 = Medicion estacion1 15  25   34   25
medicion2 = Medicion estacion1 15  31   48   84
medicion3 = Medicion estacion2 18  15  162   35
medicion4 = Medicion estacion3  2  11   34 (-56)  -- ojo: negativos van con paréntesis
medicion5 = Medicion estacion4 20  16   95   81
medicion6 = Medicion estacion5 13 258   12   36
medicion7 = Medicion estacion2  7 (-123) 22  40
medicion8 = Medicion estacion2  1  (-6)  11  55
medicion9 = Medicion estacion3 16  35   95    3 
medicionTotal = Medicion estacion2 7 60 40 100 

noruega = Zona "Noruega"
jamaica = Zona "Jamaica"

validar :: Medicion -> ResultadoMedicion
validar med
 | null (motivoTempAlt med ++ motivoTempBaj med ++ motivoVientoNeg med ++ motivoHumed med) = ResultadoMedicion SinAlerta []
 | otherwise = ResultadoMedicion Preventiva (motivoTempAlt med ++ motivoTempBaj med ++ motivoVientoNeg med ++ motivoHumed med)

motivoVientoNeg :: Medicion -> [Motivo]
motivoVientoNeg med
 | viento med < 0 = [VientoFuerte]
 | otherwise = []

motivoTempAlt :: Medicion -> [Motivo]
motivoTempAlt med
 | temperatura med > 55 = [CalorExtremo]
 | otherwise = []

motivoTempBaj :: Medicion -> [Motivo]
motivoTempBaj med
 | temperatura med < -10 = [FrioExtremo]
 | otherwise = []

motivoHumed :: Medicion -> [Motivo]
motivoHumed med
 | humedad med > 100 || humedad med < 0 = [DatosSospechosos "Valor incorrecto de inundación"]
 | otherwise = []

clave :: Medicion -> (Estacion, Timestamp)
clave med = (estacion med, timestamp med)

listaRepetidas :: [Medicion] -> [[Medicion]]
listaRepetidas [] = []
listaRepetidas (h:t) = grupo : listaRepetidas sinGrupo
  where
    grupo    = filter (\x -> clave x == clave h) (h:t)
    sinGrupo = filter (\x -> clave x /= clave h) t

comparadorMediciones :: [Medicion] -> Medicion
comparadorMediciones [x] = x 
comparadorMediciones (h:t:_) 
 | length (motivos (validar h)) > length (motivos (validar t))= t
 |otherwise = h

elimDups :: [Medicion] -> [Medicion]
elimDups listaMed = map (comparadorMediciones) (listaRepetidas listaMed)
