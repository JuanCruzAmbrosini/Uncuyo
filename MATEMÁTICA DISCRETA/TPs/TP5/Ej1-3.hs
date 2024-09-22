main :: IO ()
main = do

    putStrLn "Ingrese el día de la semana que desee: "
    putStrLn "1: Lunes"
    putStrLn "2: Martes"
    putStrLn "3: Miércoles"
    putStrLn "4: Jueves"
    putStrLn "5: Viernes"
    putStrLn "6: Sábado"
    putStrLn "7: Domingo"

    x <- getLine

    let res = elegirDiaSemana (read x :: Int)

    putStrLn ("El día de la semana que eligió es el: " ++ show res)

elegirDiaSemana :: Int -> String
elegirDiaSemana x 
    | x == 1 = "Lunes"
    | x == 2 = "Martes"
    | x == 3 = "Miercoles"
    | x == 4 = "Jueves"
    | x == 5 = "Viernes"
    | x == 6 = "Sabado"
    | x == 7 = "Domingo"
    | otherwise = "El valor ingresado no es valido."