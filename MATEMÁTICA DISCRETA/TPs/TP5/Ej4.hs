{- 4. Definir una función division que tome dos enteros y devuelva el cociente entero de la
división. -}
main :: IO ()
main = do

    putStrLn "Ingrese el primer operando: "
    x <- getLine

    putStrLn "Ingrese el segundo operando: "
    y <- getLine

    let res = division (read x :: Int) (read y :: Int)
    putStrLn ("La parte entera del resultado es: " ++ show res)

division :: Int -> Int -> Int
division x y = x `div` y    