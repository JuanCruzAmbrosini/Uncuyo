-- 5. Definir una función resto que tome dos enteros y devuelva el resto de la división.
main :: IO ()
main = do

    putStrLn "Ingrese el primer operando: "
    x <- getLine

    putStrLn "Ingrese el segundo operando: "
    y <- getLine

    let res = resto (read x :: Int) (read y :: Int)
    putStrLn ("El resultado es igual a: " ++ show res)

resto :: Int -> Int -> Int
resto x y = mod x y    