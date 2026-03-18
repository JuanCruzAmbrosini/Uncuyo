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