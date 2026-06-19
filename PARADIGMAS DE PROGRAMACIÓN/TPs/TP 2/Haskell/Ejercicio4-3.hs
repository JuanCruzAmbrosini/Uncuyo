data Robot = Robot {direccion :: String, coordenadas :: (Int, Int)} deriving (Eq, Show)

r2d2 = Robot "Norte" (0, 0)

girarDerecha :: Robot -> Robot
girarDerecha robot
 | direccion robot == "Norte" = robot {direccion = "Este"}
 | direccion robot == "Este" = robot {direccion = "Sur"}
 | direccion robot == "Sur" = robot {direccion = "Oeste"}
 | direccion robot == "Oeste" = robot {direccion = "Norte"}
 | otherwise = robot

girarIzquierda :: Robot -> Robot
girarIzquierda robot
 | direccion robot == "Norte" = robot {direccion = "Oeste"}
 | direccion robot == "Este" = robot {direccion = "Norte"}
 | direccion robot == "Sur" = robot {direccion = "Este"}
 | direccion robot == "Oeste" = robot {direccion = "Sur"}
 | otherwise = robot

avanzar :: Robot -> Robot
avanzar robot
 | direccion robot == "Norte" = robot {coordenadas = (fst (coordenadas robot), snd (coordenadas robot) + 1)}
 | direccion robot == "Este" = robot {coordenadas = (fst (coordenadas robot) + 1, snd (coordenadas robot))} 
 | direccion robot == "Sur" = robot {coordenadas = (fst (coordenadas robot), snd (coordenadas robot) - 1)}
 | direccion robot == "Oeste" = robot {coordenadas = (fst (coordenadas robot) - 1, snd (coordenadas robot))}

simular :: String -> Robot -> Robot
simular [] robot = robot
simular (h:t) robot
 | h == 'A' = (simular t . avanzar) robot
 | h == 'D' = (simular t . girarDerecha) robot
 | h =='I' = (simular t . girarIzquierda) robot
 | otherwise = simular t robot


