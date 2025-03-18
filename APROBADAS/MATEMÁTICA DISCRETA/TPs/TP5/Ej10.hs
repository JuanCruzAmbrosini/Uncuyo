-- 10. Definir una función cuadrado que tome un número y devuelva su cuadrado.
main :: IO ()
main = do

    putStrLn "Ingrese el número que desea elevar al cuadrado: "
    x <- getLine

    let res = cuadrado (read x :: Int)
    putStrLn ("El número " ++ x ++ " al cuadrado es igual a: " ++ show res)

cuadrado :: Int -> Int
cuadrado x = x*x    