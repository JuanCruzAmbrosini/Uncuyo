-- 11. Definir una función cubo que tome un número y devuelva su cubo.
main :: IO ()
main = do

    putStrLn "Ingrese el número que desea elevar al cubo: "
    x <- getLine

    let res = cuadrado (read x :: Int)
    putStrLn ("El número " ++ x ++ " al cubo es igual a: " ++ show res)

cuadrado :: Int -> Int
cuadrado x = x*x*x   