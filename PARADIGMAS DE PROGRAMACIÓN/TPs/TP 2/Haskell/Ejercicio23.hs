encontrarCuadrante :: (Ord a, Num a) => (a, a) -> String
encontrarCuadrante (x, y) 
 | x > 0 && y > 0 = "Primer Cuadrante"
 | x < 0 && y > 0 = "Segundo Cuadrante"
 | x < 0 && y < 0 = "Tercer Cuadrante"
 | x > 0 && y < 0 = "Cuarto Cuadrante"
 | otherwise = "El par no debe estar sobre los ejes x ni y"
